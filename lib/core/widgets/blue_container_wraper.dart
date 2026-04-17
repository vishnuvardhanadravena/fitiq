import 'dart:io';
import 'package:flutter/material.dart';

/// A fully customizable background container widget.
/// Shows a gradient blue by default, or your image if passed.
class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.minHeight,
    this.maxWidth,
    this.imageAsset, // Asset image: 'assets/bg.jpg'
    this.imageNetwork, // Network URL: 'https://...'
    this.imageFile, // File from device
    this.imageProvider, // Any custom ImageProvider
    this.imageFit = BoxFit.cover,
    this.imageAlignment = Alignment.center,
    this.imageColorFilter, // e.g. tint the image
    this.gradient, // Custom gradient (overrides defaults)
    this.gradientColors, // Quick custom colors for gradient
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.backgroundColor,
    this.overlayColor, // e.g. Colors.black45
    this.overlayGradient, // e.g. fade from bottom
    this.borderRadius,
    this.borderRadiusValue = 24.0,
    this.border,
    this.boxShadow,
    this.showDefaultShadow = false,
    this.padding,
    this.margin,
    this.backgroundBlendMode,
    this.clipBehavior = Clip.antiAlias,
    this.opacity = 1.0,
    this.onTap,
  });

  // Content
  final Widget? child;

  // Size
  final double? width;
  final double? height;
  final double? minHeight;
  final double? maxWidth;

  // Image
  final String? imageAsset;
  final String? imageNetwork;
  final File? imageFile;
  final ImageProvider? imageProvider;
  final BoxFit imageFit;
  final Alignment imageAlignment;
  final ColorFilter? imageColorFilter;

  // Gradient
  final Gradient? gradient;
  final List<Color>? gradientColors;
  final Alignment gradientBegin;
  final Alignment gradientEnd;

  // Solid color
  final Color? backgroundColor;

  // Overlay
  final Color? overlayColor;
  final Gradient? overlayGradient;

  // Border
  final BorderRadius? borderRadius;
  final double borderRadiusValue;
  final BoxBorder? border;

  // Shadow
  final List<BoxShadow>? boxShadow;
  final bool showDefaultShadow;

  // Spacing
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  // Blend
  final BlendMode? backgroundBlendMode;

  // Clip
  final Clip clipBehavior;

  // Opacity
  final double opacity;

  // Tap
  final VoidCallback? onTap;

  // ── Resolve image provider ──────────────────────────
  ImageProvider? get _resolvedImageProvider {
    if (imageProvider != null) return imageProvider;
    if (imageAsset != null) return AssetImage(imageAsset!);
    if (imageNetwork != null) return NetworkImage(imageNetwork!);
    if (imageFile != null) return FileImage(imageFile!);
    return null;
  }

  // ── Resolve background decoration ──────────────────
  BoxDecoration get _decoration {
    final resolvedImage = _resolvedImageProvider;
    final resolvedRadius =
        borderRadius ?? BorderRadius.circular(borderRadiusValue);

    // Background: image > gradient > gradientColors > backgroundColor > default blue gradient
    DecorationImage? image;
    if (resolvedImage != null) {
      image = DecorationImage(
        image: resolvedImage,
        fit: imageFit,
        alignment: imageAlignment,
        colorFilter: imageColorFilter,
      );
    }

    Gradient? resolvedGradient;
    Color? resolvedColor;

    if (resolvedImage == null) {
      if (gradient != null) {
        resolvedGradient = gradient;
      } else if (gradientColors != null && gradientColors!.length >= 2) {
        resolvedGradient = LinearGradient(
          begin: gradientBegin,
          end: gradientEnd,
          colors: gradientColors!,
        );
      } else if (backgroundColor != null) {
        resolvedColor = backgroundColor;
      } else {
        resolvedGradient = LinearGradient(
          transform: GradientRotation(0.5),
          colors: [Color(0xFF2E3192), Color.fromARGB(255, 24, 224, 255)],
          stops: [0.0, 1.0],
        );
      }
    }

    return BoxDecoration(
      image: image,
      gradient: resolvedGradient,
      color: resolvedColor,
      borderRadius: resolvedRadius,
      border: border,
      boxShadow:
          boxShadow ??
          (showDefaultShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      width: width,
      margin: margin,
      constraints: BoxConstraints(
        minHeight: minHeight ?? 0,
        maxWidth: maxWidth ?? double.infinity,
      ),
      decoration: _decoration,
      clipBehavior: clipBehavior,
      child: Stack(
        children: [
          // Overlay layer (color or gradient)
          if (overlayColor != null || overlayGradient != null)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: overlayColor,
                  gradient: overlayGradient,
                ),
              ),
            ),

          // Content
          if (child != null)
            Padding(padding: padding ?? const EdgeInsets.all(24), child: child),
        ],
      ),
    );

    // Apply height if provided
    if (height != null) {
      container = SizedBox(height: height, child: container);
    }

    // Apply opacity
    if (opacity < 1.0) {
      container = Opacity(opacity: opacity, child: container);
    }

    // Apply tap
    if (onTap != null) {
      container = GestureDetector(onTap: onTap, child: container);
    }

    return container;
  }
}

// ════════════════════════════════════════════════════════════
//  USAGE EXAMPLES
// ════════════════════════════════════════════════════════════

class BackgroundContainerExamples extends StatelessWidget {
  const BackgroundContainerExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(title: const Text('BackgroundContainer — All Options')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _label('1. Default (blue gradient, no image)'),
          BackgroundContainer(height: 140, child: _content()),
          _label('2. Network image'),
          BackgroundContainer(
            height: 160,
            imageNetwork:
                'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800',
            imageFit: BoxFit.cover,
            overlayColor: Colors.black38,
            child: _content(),
          ),
          _label('3. Asset image'),
          BackgroundContainer(
            height: 160,
            imageAsset: 'assets/bg.jpg', // add to pubspec.yaml
            imageFit: BoxFit.cover,
            child: _content(),
          ),
          _label('4. Custom gradient colors'),
          BackgroundContainer(
            height: 140,
            gradientColors: [const Color(0xFFf7971e), const Color(0xFFffd200)],
            gradientBegin: Alignment.topLeft,
            gradientEnd: Alignment.bottomRight,
            child: _content(),
          ),
          _label('5. Custom gradient object (radial)'),
          BackgroundContainer(
            height: 140,
            gradient: const RadialGradient(
              center: Alignment.center,
              radius: 0.9,
              colors: [Color(0xFF43cea2), Color(0xFF185a9d)],
            ),
            child: _content(),
          ),
          _label('6. Solid background color'),
          BackgroundContainer(
            height: 140,
            backgroundColor: const Color(0xFF6C63FF),
            child: _content(),
          ),
          _label('7. With overlay gradient (fade from bottom)'),
          BackgroundContainer(
            height: 160,
            imageNetwork:
                'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=800',
            overlayGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
            ),
            child: _content(),
          ),
          _label('8. Custom border radius'),
          BackgroundContainer(
            height: 140,
            borderRadiusValue: 8,
            child: _content(),
          ),
          _label('9. With border'),
          BackgroundContainer(
            height: 140,
            border: Border.all(color: Colors.white54, width: 2),
            child: _content(),
          ),
          _label('10. With shadow'),
          BackgroundContainer(
            height: 140,
            showDefaultShadow: true,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: _content(),
          ),
          _label('11. Custom padding'),
          BackgroundContainer(
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
            child: _content(),
          ),
          _label('12. Semi-transparent (opacity)'),
          BackgroundContainer(height: 140, opacity: 0.6, child: _content()),
          _label('13. Image with color filter (tint)'),
          BackgroundContainer(
            height: 160,
            imageNetwork:
                'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800',
            imageColorFilter: const ColorFilter.mode(
              Colors.blue,
              BlendMode.color,
            ),
            child: _content(),
          ),
          _label('14. With onTap callback'),
          BackgroundContainer(
            height: 140,
            onTap: () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Tapped!'))),
            child: _content(subtitle: 'Tap me!'),
          ),
          _label('15. Fixed width + minHeight'),
          Center(
            child: BackgroundContainer(
              width: 220,
              minHeight: 100,
              borderRadiusValue: 16,
              child: _content(),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    ),
  );

  Widget _content({
    String subtitle =
        'Choose from expert-designed fitness,\nyoga, and nutrition plans.',
  }) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'Transform With Structured Programs',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.3,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white70,
          height: 1.5,
        ),
      ),
    ],
  );
}
