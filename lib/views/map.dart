import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:fitiq/views/dashborad/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:math' show sin, cos, sqrt, atan2, pi;
import 'dart:ui' as ui;

const String _kGoogleApiKey = 'AIzaSyBpZlo-KoAOvPmz736aPtuvKVgM4xt3AHI';
const bool _kUseLiveApi = false;

// const String _kStaticDistance = '18.3 km';
// const String _kStaticDuration = '42 mins';

// List<LatLng> _kStaticRoutePoints = RouteUtils.generateUltraSmoothRoute(
//   _kStaticRoutePoint,
// );

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Completer<GoogleMapController> _controllerCompleter = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  GoogleMapController? _mapController;

  LatLng? _currentLocation;
  bool _isInitialized = false;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  BitmapDescriptor? customIcon;

  bool _isLoading = true;
  String? _errorMessage;
  LatLng? _destination;

  String _distance = '';
  String _duration = '';
  StreamSubscription<Position>? _positionStream;
  int _simIndex = 0;
  double _heading = 0;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    await loadCustomIcon();
    await _initMap();
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _initMap() async {
    if (_isInitialized) return;

    setState(() {
      _isInitialized = true;
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _handleLocationPermission();
      await _startTracking();
      await Future.delayed(const Duration(seconds: 1));
      await _fetchRoute();
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _startTracking() async {
    // 1. Get current location FIRST
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final current = LatLng(position.latitude, position.longitude);

    _heading = position.heading;

    _updateMarker(current);

    // 2. Get destination from short URL
    final latLng = await getLatLngFromShortUrl(
      "https://maps.app.goo.gl/ofZaduJMubVsTrdv7",
    );

    _destination = latLng;

    // 3. Update destination marker
    _updateMarker(current);

    // 4. Draw route
    await _fetchRoute();
    _positionStream =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 5,
          ),
        ).listen((Position pos) {
          _heading = pos.heading;
          final updated = LatLng(pos.latitude, pos.longitude);
          _updateMarker(updated);
        });
  }

  void _updateMarker(LatLng position, {bool isSimulated = false}) {
    if (!mounted) return;

    setState(() {
      _currentLocation = position;

      _markers = {
        // ================== CURRENT LOCATION WITH DIRECTION ==================
        Marker(
          markerId: const MarkerId('current'),
          position: position,
          icon:
              customIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          rotation: _heading, // ← This controls direction
          flat: true, // ← Very Important
          anchor: const Offset(0.5, 0.5), // ← Center anchor for arrow
          zIndex: 5,
          draggable: false,
          consumeTapEvents: false,
        ),

        // Destination Marker
        if (_destination != null)
          Marker(
            markerId: const MarkerId('destination'),
            position: _destination!,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
            zIndex: 2,
          ),
      };
    });
  }

  Future<void> _handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(
        'Location services are disabled. Please enable them in settings.',
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied by user.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied. Please enable from app settings.',
      );
    }
  }

  Future<void> loadCustomIcon() async {
    if (customIcon != null) return;
    customIcon = await getCustomIcon();
  }

  Future<BitmapDescriptor> getCustomIcon() async {
    final byteData = await rootBundle.load('assets/joker.png');
    final codec = await instantiateImageCodec(
      byteData.buffer.asUint8List(),
      targetWidth: 100,
    );
    final frame = await codec.getNextFrame();
    final data = await frame.image.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  Future<void> _fetchRoute() async {
    if (_currentLocation == null) return;

    if (_kUseLiveApi) {
      await _fetchLiveRoute();
    } else {
      _loadStaticRoute();
    }
  }

  Future<void> _fetchLiveRoute() async {
    final uri = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json'
      '?origin=${_currentLocation!.latitude},${_currentLocation!.longitude}'
      '&destination=${_destination!.latitude},${_destination!.longitude}'
      '&mode=driving'
      '&key=$_kGoogleApiKey',
    );

    final response = await http
        .get(uri)
        .timeout(
          const Duration(seconds: 15),
          onTimeout: () =>
              throw Exception('Request timed out. Check your connection.'),
        );

    if (response.statusCode != 200) {
      throw Exception(
        'HTTP Error ${response.statusCode}: Failed to fetch directions.',
      );
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final String status = data['status'] ?? 'UNKNOWN';

    if (status != 'OK') {
      throw Exception(_resolveApiStatus(status));
    }

    final route = data['routes'][0];
    final leg = route['legs'][0];
    final String distance = leg['distance']['text'];
    final String duration = leg['duration']['text'];
    final String encodedPoints = route['overview_polyline']['points'];
    final List<LatLng> routePoints = _decodePolyline(encodedPoints);

    setState(() {
      _distance = distance;
      _duration = duration;
      _polylines = {
        Polyline(
          polylineId: const PolylineId('route'),
          points: routePoints,
          width: 5,
          color: Colors.blue.shade700,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
        ),
      };
    });

    final controller = await _controllerCompleter.future;
    _fitCameraToBounds(controller, routePoints);
  }

  // Make this function async
  Future<void> _loadStaticRoute() async {
    if (_currentLocation == null) return;
    // ================== STATIC POINTS ==================
    final LatLng hyderabad = LatLng(17.3850, 78.4867);
    final LatLng waypoint1 = LatLng(22.7196, 75.8577); // Indore
    final LatLng waypoint2 = LatLng(24.5854, 80.8318); // Khajuraho
    final LatLng waypoint3 = LatLng(25.4358, 81.8463); // Prayagraj
    final LatLng varanasi = LatLng(25.3176, 82.9739);

    final List<LatLng> routePoints = [
      _currentLocation ?? hyderabad,
      waypoint1,
      waypoint2,
      waypoint3,
      varanasi,
    ];

    final List<String> titles = [
      "Hyderabad",
      "Indore",
      "Khajuraho",
      "Prayagraj",
      "Varanasi",
    ];

    // Clear previous
    setState(() {
      _markers.clear();
      _polylines.clear();
    });

    // ================== ADD MARKERS WITH RELIABLE IMAGES ==================
    for (int i = 0; i < routePoints.length; i++) {
      BitmapDescriptor customIcon = await _getNetworkMarkerIcon(
        _getImageUrlForPlace(titles[i]),
        size: i == 0 || i == routePoints.length - 1 ? 75 : 65,
      );

      _markers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: routePoints[i],

          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              _buildInfoCard(titles[i], i == 0),
              routePoints[i],
            );
          },
          // infoWindow: InfoWindow(
          //   title: titles[i],
          //   snippet: i == 0
          //       ? "Starting Point"
          //       : i == routePoints.length - 1
          //       ? "Destination"
          //       : "Stop ${i}",
          // ),
          icon: customIcon,
        ),
      );
    }

    // ================== POLYLINES (Straight + Curve) ==================
    final List<Polyline> newPolylines = [];

    for (int i = 0; i < routePoints.length - 1; i++) {
      final start = routePoints[i];
      final end = routePoints[i + 1];

      // Straight grey line
      newPolylines.add(
        Polyline(
          polylineId: PolylineId('straight_$i'),
          points: [start, end],
          width: 4,
          color: Colors.grey.shade400,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        ),
      );

      // Curved blue line
      final curvePoints = generateCurve(start, end);
      newPolylines.add(
        Polyline(
          polylineId: PolylineId('curve_$i'),
          points: curvePoints,
          width: 5,
          color: Colors.blueAccent,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          jointType: JointType.round,
        ),
      );
    }

    setState(() {
      _polylines = newPolylines.toSet();
    });

    _controllerCompleter.future.then(
      (controller) => _fitCameraToBounds(controller, routePoints),
    );
  }

  List<LatLng> generateCurve(LatLng start, LatLng end, {int points = 80}) {
    List<LatLng> curvePoints = [];
    final double lat1 = start.latitude;
    final double lon1 = start.longitude;
    final double lat2 = end.latitude;
    final double lon2 = end.longitude;

    final double distanceKm = _calculateDistance(start, end);

    double curveHeight = 0.08;

    if (distanceKm > 1500) {
      curveHeight = 0.22;
    } else if (distanceKm > 800) {
      curveHeight = 0.18;
    } else if (distanceKm > 400) {
      curveHeight = 0.14;
    } else if (distanceKm > 150) {
      curveHeight = 0.10;
    } else {
      curveHeight = 0.06;
    }

    for (int i = 0; i <= points; i++) {
      final double t = i / points;
      final double lat =
          lat1 * (1 - t) * (1 - t) +
          (lat1 + lat2) / 2 * (2 * (1 - t) * t) * (1 + curveHeight) +
          lat2 * t * t;
      final double lon =
          lon1 * (1 - t) * (1 - t) +
          (lon1 + lon2) / 2 * (2 * (1 - t) * t) +
          lon2 * t * t;
      curvePoints.add(LatLng(lat, lon));
    }
    return curvePoints;
  }

  double _calculateDistance(LatLng p1, LatLng p2) {
    const double earthRadiusKm = 6371.0; // Earth's radius in km
    final double dLat = _toRadians(p2.latitude - p1.latitude);
    final double dLon = _toRadians(p2.longitude - p1.longitude);
    final double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(p1.latitude)) *
            cos(_toRadians(p2.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusKm * c;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }

  String _resolveApiStatus(String status) {
    switch (status) {
      case 'REQUEST_DENIED':
        return 'API key is invalid or Directions API is not enabled.';
      case 'ZERO_RESULTS':
        return 'No route found between the two locations.';
      case 'NOT_FOUND':
        return 'Origin or destination not found.';
      case 'OVER_QUERY_LIMIT':
        return 'API query limit exceeded. Try again later.';
      default:
        return 'Directions API returned status: $status';
    }
  }

  List<LatLng> _decodePolyline(String poly) {
    final List<LatLng> points = [];
    int index = 0, lat = 0, lng = 0;
    while (index < poly.length) {
      int shift = 0, result = 0, b;
      do {
        b = poly.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      lat += (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      shift = 0;
      result = 0;
      do {
        b = poly.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      lng += (result & 1) != 0 ? ~(result >> 1) : (result >> 1);

      points.add(LatLng(lat / 1e5, lng / 1e5));
    }
    return points;
  }

  Future<void> _fitCameraToBounds(
    GoogleMapController controller,
    List<LatLng> points,
  ) async {
    if (points.isEmpty) return;
    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;
    for (var point in points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }
    final LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
    await controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 80));
  }

  Widget _buildInfoCard(String place, bool current) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280), // Flexible max width
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min, // Important
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _getImageUrlForPlace(place),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, error, stackTrace) => Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.location_on,
                      size: 26,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // Text Section
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      place,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text(
                      current ? "Current Location" : "Next Stop",
                      style: TextStyle(
                        fontSize: 10,
                        color: current ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Directions Symbol
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  current ? Icons.my_location : Icons.directions,
                  color: current ? Colors.green : Colors.blue,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (!_isLoading &&
                _errorMessage == null &&
                _currentLocation != null)
              Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 1,
                      tilt: 60,
                      bearing: 0,
                    ),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                    mapToolbarEnabled: true,
                    compassEnabled: true,
                    markers: _markers,
                    polylines: _polylines,
                    trafficEnabled: false,
                    buildingsEnabled: true,
                    indoorViewEnabled: true,

                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                      _controllerCompleter.complete(controller);

                      // 🔥 IMPORTANT
                      _customInfoWindowController.googleMapController =
                          controller;

                      _mapController?.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: _currentLocation!,
                            zoom: 19.5,
                            tilt: 60,
                            bearing: 0,
                          ),
                        ),
                      );
                    },

                    onTap: (_) {
                      _customInfoWindowController.hideInfoWindow!();
                    },

                    onCameraMove: (_) {
                      _customInfoWindowController.onCameraMove!();
                    },
                  ),

                  CustomInfoWindow(
                    controller: _customInfoWindowController,

                    width: 200,
                    offset: 50,
                  ),
                ],
              ),
            if (_isLoading)
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 12),
                    Text('Fetching route...'),
                  ],
                ),
              ),
            if (_errorMessage != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _initMap,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RouteUtils {
  static List<LatLng> generateUltraSmoothRoute(List<LatLng> points) {
    List<LatLng> result = [];

    for (int i = 0; i < points.length - 1; i++) {
      LatLng start = points[i];
      LatLng end = points[i + 1];

      result.add(start);

      for (int j = 1; j <= 6; j++) {
        double t = j / 7;
        double lat = start.latitude + (end.latitude - start.latitude) * t;
        double lng = start.longitude + (end.longitude - start.longitude) * t;
        result.add(LatLng(lat, lng));
      }
    }

    result.add(points.last);
    return result;
  }
}

String _getImageUrlForPlace(String placeName) {
  switch (placeName.toLowerCase()) {
    case "hyderabad":
      return "https://upload.wikimedia.org/wikipedia/commons/1/12/Charminar_of_Hyderabad_Telangana.jpg";
    case "indore":
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Rajwada_Palace%2C_Indore.jpg/800px-Rajwada_Palace%2C_Indore.jpg";
    case "khajuraho":
      return "https://upload.wikimedia.org/wikipedia/commons/4/43/Khajuraho.jpg";
    case "prayagraj":
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Triveni_Sangam_Prayagraj.jpg/800px-Triveni_Sangam_Prayagraj.jpg";
    case "varanasi":
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Ganges_at_Varanasi.jpg/800px-Ganges_at_Varanasi.jpg";
    default:
      return "https://upload.wikimedia.org/wikipedia/commons/4/43/Khajuraho.jpg";
  }
}

// Add this at the top of your StatefulWidget class
final Map<String, BitmapDescriptor> _markerCache = {};

Future<BitmapDescriptor> _getNetworkMarkerIcon(
  String imageUrl, {
  int size = 65,
}) async {
  // Use cache
  if (_markerCache.containsKey(imageUrl)) {
    return _markerCache[imageUrl]!;
  }

  try {
    final response = await http
        .get(
          Uri.parse(imageUrl),
          headers: {'User-Agent': 'Mozilla/5.0'}, // Helps avoid blocks
        )
        .timeout(const Duration(seconds: 12));

    if (response.statusCode == 200) {
      final Uint8List bytes = response.bodyBytes;

      final ui.Codec codec = await ui.instantiateImageCodec(
        bytes,
        targetWidth: size,
      );
      final ui.FrameInfo frameInfo = await codec.getNextFrame();

      final ByteData? resizedBytes = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(
        resizedBytes!.buffer.asUint8List(),
      );

      _markerCache[imageUrl] = bitmap;
      return bitmap;
    } else {
      print('Image load failed: ${response.statusCode} for $imageUrl');
    }
  } catch (e) {
    print('Error loading image $imageUrl: $e');
  }

  // Fallback marker if image fails to load
  return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
}
