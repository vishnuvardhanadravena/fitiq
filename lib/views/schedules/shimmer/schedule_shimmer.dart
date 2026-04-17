import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _bone(width: 140, height: 22, radius: 8),
                        const SizedBox(height: 7),
                        _bone(width: 200, height: 12),
                      ],
                    ),
                  ),
                  _bone(width: 95, height: 30, radius: 20),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ── Week Strip ──
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Color(0xFFF0F0F0), width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (_) {
                  return Column(
                    children: [
                      _bone(width: 22, height: 11),
                      const SizedBox(height: 6),
                      _bone(width: 34, height: 34, radius: 17),
                      const SizedBox(height: 6),
                      _bone(width: 6, height: 6, radius: 3),
                    ],
                  );
                }),
              ),
            ),

            SizedBox(height: 20.h),

            // ── Today Section ──
            _bone(width: 60, height: 14),
            const SizedBox(height: 12),

            // Today Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF0F0F0)),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // image
                  Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _bone(width: 170, height: 16),
                                  const SizedBox(height: 7),
                                  _bone(width: 110, height: 12),
                                ],
                              ),
                            ),
                            _bone(width: 80, height: 36, radius: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _bone(width: 60, height: 11),
                            const SizedBox(width: 12),
                            _bone(width: 50, height: 11),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // ── Upcoming Section ──
            _bone(width: 80, height: 14),
            const SizedBox(height: 14),
            ...List.generate(3, (_) => _SessionRowSkeleton()),

            SizedBox(height: 20.h),

            // ── Past Sessions Section ──
            _bone(width: 100, height: 14),
            const SizedBox(height: 14),
            ...List.generate(2, (_) => _SessionRowSkeleton()),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _bone({
    required double width,
    required double height,
    double radius = 4,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

// Shared row skeleton for both Upcoming and Past sections
class _SessionRowSkeleton extends StatelessWidget {
  const _SessionRowSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFF5F5F5), width: 0.5),
          ),
        ),
        child: Row(
          children: [
            // Day label + number
            Column(
              children: [
                _bone(width: 24, height: 11),
                const SizedBox(height: 4),
                _bone(width: 28, height: 16),
              ],
            ),
            const SizedBox(width: 12),
            // Thumbnail
            _bone(width: 52, height: 52, radius: 10),
            const SizedBox(width: 12),
            // Title + host
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bone(width: double.infinity, height: 14),
                  const SizedBox(height: 7),
                  _bone(width: 120, height: 11),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Action button (notify bell / play button)
            _bone(width: 32, height: 32, radius: 16),
          ],
        ),
      ),
    );
  }

  static Widget _bone({
    required double width,
    required double height,
    double radius = 4,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
