import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_radius.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';

// class FitiqPrimaryButton extends StatefulWidget {
//   final String label;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final IconData? leadingIcon;
//   final IconData? trailingIcon;
//   final double? width;
//   final double height;
//   final EdgeInsetsGeometry? padding;
//   final String? fontFamily;

//   const FitiqPrimaryButton({
//     super.key,
//     required this.label,
//     this.onPressed,
//     this.isLoading = false,
//     this.leadingIcon,
//     this.trailingIcon,
//     this.width,
//     this.height = 54,
//     this.padding,
//     this.fontFamily,
//   });

//   @override
//   State<FitiqPrimaryButton> createState() => _FitiqPrimaryButtonState();
// }

// class _FitiqPrimaryButtonState extends State<FitiqPrimaryButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _scaleController;
//   late Animation<double> _scale;

//   @override
//   void initState() {
//     super.initState();
//     _scaleController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//       lowerBound: 0.97,
//       upperBound: 1.0,
//       value: 1.0,
//     );
//     _scale = _scaleController;
//   }

//   @override
//   void dispose() {
//     _scaleController.dispose();
//     super.dispose();
//   }

//   void _onTapDown(_) => _scaleController.reverse();
//   void _onTapUp(_) => _scaleController.forward();
//   void _onTapCancel() => _scaleController.forward();

//   @override
//   Widget build(BuildContext context) {
//     final bool disabled = widget.onPressed == null || widget.isLoading;

//     return GestureDetector(
//       onTapDown: disabled ? null : _onTapDown,
//       onTapUp: disabled ? null : _onTapUp,
//       onTapCancel: disabled ? null : _onTapCancel,
//       onTap: disabled ? null : widget.onPressed,
//       child: ScaleTransition(
//         scale: _scale,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           width: widget.width ?? double.infinity,
//           height: widget.height,
//           padding: widget.padding,
//           decoration: BoxDecoration(
//             gradient: disabled
//                 ? LinearGradient(colors: [AppColors.primary, AppColors.primary])
//                 : const LinearGradient(
//                     colors: [AppColors.primary, AppColors.primary],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//             borderRadius: BorderRadius.circular(AppRadius.radiusButton),
//             // boxShadow: disabled
//             //     ? []
//             //     : [
//             //         BoxShadow(
//             //           color: AppColors.primary.withValues(alpha:0.4),
//             //           blurRadius: 16,
//             //           offset: const Offset(0, 6),
//             //         ),
//             //       ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (widget.leadingIcon != null && !widget.isLoading) ...[
//                 Icon(widget.leadingIcon, color: Colors.white, size: 20),
//                 const SizedBox(width: 8),
//               ],
//               if (widget.isLoading)
//                 const SizedBox(
//                   width: 22,
//                   height: 22,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2.5,
//                     valueColor: AlwaysStoppedAnimation(Colors.white),
//                   ),
//                 )
//               else
//                 Text(
//                   widget.label,
//                   style: AppTextStyles.buttonTextStyle.copyWith(
//                     fontFamily: widget.fontFamily,
//                   ),
//                 ),
//               if (widget.trailingIcon != null && !widget.isLoading) ...[
//                 const SizedBox(width: 8),
//                 Icon(widget.trailingIcon, color: Colors.white, size: 20),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class FitiqPrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  // ✅ New optional sizing parameters from parent
  final double? width;
  final double? height;
  final double? fontSize;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final String? fontFamily;

  const FitiqPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.height,
    this.fontSize,
    this.iconSize,
    this.padding,
    this.borderRadius,
    this.fontFamily,
  });

  @override
  State<FitiqPrimaryButton> createState() => _FitiqPrimaryButtonState();
}

class _FitiqPrimaryButtonState extends State<FitiqPrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.97,
      upperBound: 1.0,
      value: 1.0,
    );
    _scale = _scaleController;
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(_) => _scaleController.reverse();
  void _onTapUp(_) => _scaleController.forward();
  void _onTapCancel() => _scaleController.forward();

  @override
  Widget build(BuildContext context) {
    final bool disabled = widget.onPressed == null || widget.isLoading;

    return GestureDetector(
      onTapDown: disabled ? null : _onTapDown,
      onTapUp: disabled ? null : _onTapUp,
      onTapCancel: disabled ? null : _onTapCancel,
      onTap: disabled ? null : widget.onPressed,
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width ?? double.infinity,
          height: widget.height ?? 54,
          padding: widget.padding,
          decoration: BoxDecoration(
            gradient: disabled
                ? LinearGradient(colors: [AppColors.primary, AppColors.primary])
                : const LinearGradient(
                    colors: [AppColors.primary, AppColors.primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? AppRadius.radiusButton,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.leadingIcon != null && !widget.isLoading) ...[
                Icon(
                  widget.leadingIcon,
                  color: Colors.white,
                  size: widget.iconSize ?? 20,
                ),
                const SizedBox(width: 8),
              ],
              if (widget.isLoading)
                SizedBox(
                  width: widget.iconSize ?? 22,
                  height: widget.iconSize ?? 22,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                )
              else
                Text(
                  widget.label,
                  style: AppTextStyles.buttonTextStyle.copyWith(
                    fontFamily: widget.fontFamily,
                    fontSize: widget.fontSize,
                  ),
                ),
              if (widget.trailingIcon != null && !widget.isLoading) ...[
                const SizedBox(width: 8),
                Icon(
                  widget.trailingIcon,
                  color: Colors.white,
                  size: widget.iconSize ?? 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
