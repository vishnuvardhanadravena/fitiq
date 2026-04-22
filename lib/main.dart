// import 'package:fitiq/core/providers/shared_prefs_provider.dart';
// import 'package:fitiq/core/storage/secure_storage.dart';
// import 'package:fitiq/core/theame/app_theme.dart';
// import 'package:fitiq/routes/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final overrides = await _buildOverrides();
//   await ScreenUtil.ensureScreenSize();
//   await Future.wait([
//     _initMediaKit(),
//     // _initSystemUI()
//   ]);

//   runApp(ProviderScope(overrides: overrides, child: const MyApp()));
// }

// Future<void> _initMediaKit() async {
//   MediaKit.ensureInitialized();
// }

// Future<void> _initSystemUI() async {
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarIconBrightness: Brightness.dark,
//     ),
//   );
// }

// Future<List<Override>> _buildOverrides() async {
//   final prefs = await SharedPreferences.getInstance();
//   final secureStorage = AppSecureStorage(const FlutterSecureStorage());
//   final isFirstTime = prefs.getBool('isFirstTime');
//   if (isFirstTime == null) {
//     await prefs.setBool('isFirstTime', true);
//     await prefs.setString('appVersion', '1.0.0');
//   }

//   return [
//     sharedPrefsProvider.overrideWithValue(prefs),
//     secureStorageProvider.overrideWithValue(secureStorage),
//   ];
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (ctx, child) => MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme.lightTheme,
//         routerConfig: appRouter,
//         builder: (context, child) => _AppShell(child: child),
//       ),
//     );
//   }
// }

// class _AppShell extends StatefulWidget {
//   final Widget? child;
//   const _AppShell({this.child});

//   @override
//   State<_AppShell> createState() => _AppShellState();
// }

// class _AppShellState extends State<_AppShell> with WidgetsBindingObserver {
//   bool _showPermissionBanner = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);

//     _checkPermanentDenials(); // ✅ ONLY check, no request
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
// void didChangeAppLifecycleState(AppLifecycleState state) {
//   if (state == AppLifecycleState.resumed) {
//     // 🔥 FIX: force rebuild after resume
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) setState(() {});
//     });

//     _checkPermanentDenials();
//   }
// }

//   Future<void> _checkPermanentDenials() async {
//     final critical = [
//       Permission.camera,
//       Permission.storage,
//       Permission.microphone,
//     ];

//     bool anyPermanent = false;

//     for (final p in critical) {
//       if (await p.isPermanentlyDenied) {
//         anyPermanent = true;
//         break;
//       }
//     }

//     if (mounted) {
//       setState(() => _showPermissionBanner = anyPermanent);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (_showPermissionBanner)
//           _PermissionBanner(
//             onOpenSettings: () async {
//               await openAppSettings();
//             },
//           ),
//         Expanded(child: widget.child ?? const SizedBox.shrink()),
//       ],
//     );
//   }
// }
import 'package:fitiq/core/providers/shared_prefs_provider.dart';
import 'package:fitiq/core/storage/secure_storage.dart';
import 'package:fitiq/core/theame/app_theme.dart';
import 'package:fitiq/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:media_kit/media_kit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final overrides = await _buildOverrides();
  await ScreenUtil.ensureScreenSize();
  await Future.wait([_initMediaKit()]);

  runApp(ProviderScope(overrides: overrides, child: const MyApp()));
}

Future<void> _initMediaKit() async {
  MediaKit.ensureInitialized();
}

Future<void> _initSystemUI() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

Future<List<Override>> _buildOverrides() async {
  final prefs = await SharedPreferences.getInstance();
  final secureStorage = AppSecureStorage(const FlutterSecureStorage());
  final isFirstTime = prefs.getBool('isFirstTime');
  if (isFirstTime == null) {
    await prefs.setBool('isFirstTime', true);
    await prefs.setString('appVersion', '1.0.0');
  }

  return [
    sharedPrefsProvider.overrideWithValue(prefs),
    secureStorageProvider.overrideWithValue(secureStorage),
  ];
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
        builder: (context, child) => _AppShell(child: child),
      ),
    );
  }
}


class _AppShell extends StatefulWidget {
  final Widget? child;
  const _AppShell({this.child});

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> with WidgetsBindingObserver {
  bool _showPermissionBanner = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _checkPermanentDenials();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _checkPermanentDenials();
      });
    }
  }

  Future<void> _checkPermanentDenials() async {
    final critical = [
      Permission.camera,
      Permission.storage,
      Permission.microphone,
    ];

    bool anyPermanent = false;

    for (final p in critical) {
      if (await p.isPermanentlyDenied) {
        anyPermanent = true;
        break;
      }
    }

    if (mounted) {
      setState(() => _showPermissionBanner = anyPermanent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_showPermissionBanner)
          _PermissionBanner(
            onOpenSettings: () async {
              await openAppSettings();
            },
          ),
        Expanded(child: widget.child ?? const SizedBox.shrink()),
      ],
    );
  }
}


class _PermissionBanner extends StatelessWidget {
  final VoidCallback onOpenSettings;

  const _PermissionBanner({required this.onOpenSettings});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFF3CD),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFF856404),
                size: 18,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Some permissions are disabled. Tap to enable in Settings.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF856404)),
                ),
              ),
              GestureDetector(
                onTap: onOpenSettings,
                child: const Text(
                  'Open',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF856404),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
