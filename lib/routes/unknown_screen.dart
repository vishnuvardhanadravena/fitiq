import 'package:flutter/material.dart';

// import 'package:your_app/routes/route_list.dart';

class UnknownRouteScreen extends StatefulWidget {
  const UnknownRouteScreen({super.key});

  @override
  State<UnknownRouteScreen> createState() => _UnknownRouteScreenState();
}

class _UnknownRouteScreenState extends State<UnknownRouteScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _bounceAnim = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bouncing dumbbell
            AnimatedBuilder(
              animation: _bounceAnim,
              builder: (_, __) => Transform.translate(
                offset: Offset(0, _bounceAnim.value),
                child: const Icon(
                  Icons.fitness_center_rounded,
                  size: 72,
                  color: Color(0xFF4CAF50),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 404
            const Text(
              '404',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                color: Color(0xFF212121),
                letterSpacing: -2,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212121),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Looks like this route skipped training.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),

            const SizedBox(height: 36),

            // Go Home button
            ElevatedButton.icon(
              onPressed: () {
                // context.go(RouteList.home);
              },
              icon: const Icon(Icons.home_rounded),
              label: const Text('Go Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: Text(
                'Go Back',
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
