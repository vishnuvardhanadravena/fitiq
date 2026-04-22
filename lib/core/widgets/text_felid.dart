import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_radius.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitiqTextField extends StatefulWidget {
  final String label;
  final String? hint;

  /// Icons
  final IconData? prefixIcon;
  final String? prefixImage;
  final Widget? suffixWidget;

  /// Behavior
  final bool isPassword;
  final bool isExpandable;
  final bool readOnly;
  final VoidCallback? onTap;

  /// Controller
  final TextEditingController? controller;
  final String? initialValue;

  /// Input
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  /// State
  final bool enabled;
  final bool autofocus;
  final int? maxLines;
  final int? maxLength;
  final bool showCounter;

  /// Focus
  final FocusNode? focusNode;
  final String? forceErrorText;

  /// Callbacks
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const FitiqTextField({
    super.key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.prefixImage,
    this.suffixWidget,
    this.isPassword = false,
    this.isExpandable = false,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textInputAction,
    this.enabled = true,
    this.autofocus = false,
    this.maxLines = 1,
    this.maxLength,
    this.showCounter = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.forceErrorText,
  });

  @override
  State<FitiqTextField> createState() => _FitiqTextFieldState();
}

class _FitiqTextFieldState extends State<FitiqTextField> {
  bool _obscure = true;
  bool _isFocused = false;
  late FocusNode _focusNode;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(
      () => setState(() => _isFocused = _focusNode.hasFocus),
    );
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.label.copyWith(
            fontFamily: "Lato",
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.radiusInput + 6),
            // border: _isFocused
            //     ? Border.all(
            //         color: AppColors.inputBorder.withValues(alpha: 0.4),
            //         width: 0.007.sh,
            //       )
            //     : null,
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,

            readOnly: widget.readOnly,
            onTap: widget.onTap,

            obscureText: widget.isPassword && _obscure,
            keyboardType: widget.keyboardType,
            enabled: widget.enabled,

            maxLines: widget.isExpandable
                ? null
                : (widget.isPassword ? 1 : widget.maxLines),
            minLines: widget.isExpandable ? 3 : 1,

            maxLength: widget.maxLength,

            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus,

            // validator: (value) {
            //   final error = widget.validator?.call(value);
            //   setState(() => _errorText = error);
            //   return error;
            // },

            // onChanged: (value) {
            //   final error = widget.validator?.call(value);
            //   setState(() => _errorText = error);
            //   widget.onChanged?.call(value);
            // },
            onChanged: widget.onChanged,

            onFieldSubmitted: widget.onSubmitted,

            style: TextStyle(
              fontSize: safeSp(14),
              color: AppColors.textPrimary,
            ),

            strutStyle: StrutStyle(
              fontSize: safeSp(14),
              forceStrutHeight: true,
            ),
            forceErrorText: widget.forceErrorText,
            decoration: InputDecoration(
              hintText: widget.hint,

              hintStyle: TextStyle(
                fontSize: safeSp(14),
                color: AppColors.textSecondary,
              ),

              filled: true,
              fillColor: _isFocused ? Colors.white : AppColors.inputFill,

              contentPadding: EdgeInsets.symmetric(
                horizontal: safeSp(10),
                vertical: safeSp(10),
              ),

              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      size: safeSp(18),
                      color: AppColors.iconTint,
                    )
                  : null,

              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: safeSp(18),
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : widget.suffixWidget,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide(
                  color: AppColors.inputBorder.withValues(alpha: 0.4),
                  width: 0.007.sh,
                ),
              ),
            ),
          ),
        ),

        /// 🔴 ERROR
        // if (_errorText != null) ...[
        //   SizedBox(height: 6.h),
        //   Row(
        //     children: [
        //       Icon(
        //         Icons.error_outline,
        //         size: safeSp(14),
        //         color: AppColors.error,
        //       ),
        //       SizedBox(width: 6.h),
        //       Expanded(
        //         child: Text(
        //           _errorText!,
        //           style: TextStyle(
        //             color: AppColors.error,
        //             fontSize: safeSp(10),
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ],
      ],
    );
  }
}

double safeSp(double size) {
  try {
    final val = size.sp;

    if (val.isNaN || val <= 0) return size;

    return val;
  } catch (e) {
    return size;
  }
}
