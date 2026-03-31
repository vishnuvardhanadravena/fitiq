import 'package:flutter/material.dart';

enum ButtonVariant {
  primary,
  secondary,
  outline,
  ghost,
  danger,
  success,
  text,
}

enum ButtonSize {
  small,
  medium,
  large,
  extraLarge,
}

enum ButtonShape {
  rounded,
  pill,
  square,
}

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;

  // Style
  final ButtonVariant variant;
  final ButtonSize size;
  final ButtonShape shape;

  // Icons
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  // Loading
  final bool isLoading;
  final String? loadingText;
  final Widget? loadingWidget;

  // State
  final bool isDisabled;
  final bool isFullWidth;

  // Custom Colors (overrides variant)
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Gradient? gradient;

  // Typography
  final TextStyle? labelStyle;
  final double? letterSpacing;

  // Layout
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  // Effects
  final double? elevation;
  final List<BoxShadow>? boxShadow;
  final bool enableHaptic;
  final bool enableScaleAnimation;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.shape = ButtonShape.pill,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixWidget,
    this.suffixWidget,
    this.isLoading = false,
    this.loadingText,
    this.loadingWidget,
    this.isDisabled = false,
    this.isFullWidth = true,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.gradient,
    this.labelStyle,
    this.letterSpacing,
    this.width,
    this.height,
    this.padding,
    this.elevation,
    this.boxShadow,
    this.enableHaptic = true,
    this.enableScaleAnimation = true,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  // ─── Theme Tokens ───────────────────────────────────────────────
  static const Color _primaryColor = Color(0xFFE8175D);
  static const Color _primaryDark = Color(0xFFC4134F);
  static const Color _onPrimary = Colors.white;
  static const Color _surface = Colors.white;
  static const Color _onSurface = Color(0xFF1A1A2E);
  static const Color _borderColor = Color(0xFFE8175D);
  static const Color _dangerColor = Color(0xFFDC2626);
  static const Color _successColor = Color(0xFF16A34A);
  static const Color _disabledBg = Color(0xFFE5E7EB);
  static const Color _disabledFg = Color(0xFF9CA3AF);

  // ─── Size Configs ────────────────────────────────────────────────
  _SizeConfig get _sizeConfig {
    switch (widget.size) {
      case ButtonSize.small:
        return _SizeConfig(
          height: 38,
          fontSize: 13,
          iconSize: 16,
          horizontalPadding: 16,
          iconLabelSpacing: 6,
        );
      case ButtonSize.medium:
        return _SizeConfig(
          height: 50,
          fontSize: 15,
          iconSize: 18,
          horizontalPadding: 24,
          iconLabelSpacing: 8,
        );
      case ButtonSize.large:
        return _SizeConfig(
          height: 56,
          fontSize: 16,
          iconSize: 20,
          horizontalPadding: 28,
          iconLabelSpacing: 8,
        );
      case ButtonSize.extraLarge:
        return _SizeConfig(
          height: 64,
          fontSize: 18,
          iconSize: 22,
          horizontalPadding: 32,
          iconLabelSpacing: 10,
        );
    }
  }

  // ─── Variant Configs ─────────────────────────────────────────────
  _VariantConfig get _variantConfig {
    if (widget.isDisabled || widget.isLoading) {
      return _VariantConfig(
        background: _disabledBg,
        foreground: _disabledFg,
        border: Colors.transparent,
      );
    }
    switch (widget.variant) {
      case ButtonVariant.primary:
        return _VariantConfig(
          background: _primaryColor,
          foreground: _onPrimary,
          border: Colors.transparent,
          gradient: widget.gradient ??
              const LinearGradient(
                colors: [Color(0xFFE8175D), Color(0xFFC4134F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          shadow: [
            BoxShadow(
              color: _primaryColor.withValues(alpha: 0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        );
      case ButtonVariant.secondary:
        return _VariantConfig(
          background: const Color(0xFFFFF0F5),
          foreground: _primaryColor,
          border: Colors.transparent,
        );
      case ButtonVariant.outline:
        return _VariantConfig(
          background: Colors.transparent,
          foreground: _primaryColor,
          border: _primaryColor,
        );
      case ButtonVariant.ghost:
        return _VariantConfig(
          background: Colors.transparent,
          foreground: _primaryColor,
          border: Colors.transparent,
        );
      case ButtonVariant.danger:
        return _VariantConfig(
          background: _dangerColor,
          foreground: _onPrimary,
          border: Colors.transparent,
        );
      case ButtonVariant.success:
        return _VariantConfig(
          background: _successColor,
          foreground: _onPrimary,
          border: Colors.transparent,
        );
      case ButtonVariant.text:
        return _VariantConfig(
          background: Colors.transparent,
          foreground: _primaryColor,
          border: Colors.transparent,
          elevation: 0,
        );
    }
  }

  BorderRadius get _borderRadius {
    switch (widget.shape) {
      case ButtonShape.pill:
        return BorderRadius.circular(100);
      case ButtonShape.rounded:
        return BorderRadius.circular(12);
      case ButtonShape.square:
        return BorderRadius.circular(4);
    }
  }

  bool get _isInteractable => !widget.isDisabled && !widget.isLoading;

  void _onTapDown(TapDownDetails _) {
    if (!_isInteractable) return;
    setState(() => _isPressed = true);
    if (widget.enableScaleAnimation) _scaleController.forward();
  }

  void _onTapUp(TapUpDetails _) {
    if (!_isInteractable) return;
    setState(() => _isPressed = false);
    if (widget.enableScaleAnimation) _scaleController.reverse();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    if (widget.enableScaleAnimation) _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final sc = _sizeConfig;
    final vc = _variantConfig;

    final effectiveBg = widget.backgroundColor ?? vc.background;
    final effectiveFg = widget.foregroundColor ?? vc.foreground;
    final effectiveBorder = widget.borderColor ?? vc.border;
    final effectiveShadow = widget.boxShadow ?? vc.shadow ?? [];
    final effectiveGradient = widget.gradient ?? vc.gradient;
    final effectiveElevation = widget.elevation ?? vc.elevation ?? 0;

    Widget buttonChild = _buildContent(sc, effectiveFg);

    Widget button = AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.enableScaleAnimation ? _scaleAnimation.value : 1.0,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: _isInteractable ? widget.onPressed : null,
        child: IntrinsicWidth(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: widget.isFullWidth ? double.infinity : widget.width,
            height: widget.height ?? sc.height,
            padding: widget.padding ??
                EdgeInsets.symmetric(horizontal: sc.horizontalPadding),
            decoration: BoxDecoration(
              color: effectiveGradient == null ? effectiveBg : null,
              gradient: effectiveGradient,
              borderRadius: _borderRadius,
              border: effectiveBorder != Colors.transparent
                  ? Border.all(color: effectiveBorder, width: 1.5)
                  : null,
              boxShadow: _isPressed ? [] : effectiveShadow,
            ),
            child: buttonChild,
          ),
        ),
      ),
    );

    if (effectiveElevation > 0) {
      button = Material(
        elevation: effectiveElevation,
        borderRadius: _borderRadius,
        color: Colors.transparent,
        child: button,
      );
    }

    return button;
  }

  Widget _buildContent(_SizeConfig sc, Color fg) {
    if (widget.isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.loadingWidget ??
              SizedBox(
                width: sc.iconSize,
                height: sc.iconSize,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(fg),
                ),
              ),
          if (widget.loadingText != null) ...[
            SizedBox(width: sc.iconLabelSpacing),
            Text(
              widget.loadingText!,
              style: _labelStyle(sc, fg),
            ),
          ],
        ],
      );
    }

    final hasPrefix = widget.prefixIcon != null || widget.prefixWidget != null;
    final hasSuffix = widget.suffixIcon != null || widget.suffixWidget != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasPrefix) ...[
          widget.prefixWidget ??
              Icon(widget.prefixIcon, color: fg, size: sc.iconSize),
          SizedBox(width: sc.iconLabelSpacing),
        ],
        Text(
          widget.label,
          style: _labelStyle(sc, fg),
        ),
        if (hasSuffix) ...[
          SizedBox(width: sc.iconLabelSpacing),
          widget.suffixWidget ??
              Icon(widget.suffixIcon, color: fg, size: sc.iconSize),
        ],
      ],
    );
  }

  TextStyle _labelStyle(_SizeConfig sc, Color fg) {
    return (widget.labelStyle ?? const TextStyle()).copyWith(
      color: fg,
      fontSize: sc.fontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: widget.letterSpacing ?? 0.3,
    );
  }
}

// ─── Private Helpers ──────────────────────────────────────────────────────────

class _SizeConfig {
  final double height;
  final double fontSize;
  final double iconSize;
  final double horizontalPadding;
  final double iconLabelSpacing;

  const _SizeConfig({
    required this.height,
    required this.fontSize,
    required this.iconSize,
    required this.horizontalPadding,
    required this.iconLabelSpacing,
  });
}

class _VariantConfig {
  final Color background;
  final Color foreground;
  final Color border;
  final Gradient? gradient;
  final List<BoxShadow>? shadow;
  final double? elevation;

  const _VariantConfig({
    required this.background,
    required this.foreground,
    required this.border,
    this.gradient,
    this.shadow,
    this.elevation,
  });
}
