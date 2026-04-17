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
        /// 🔤 LABEL
        Text(
          widget.label,
          style: AppTextStyles.label.copyWith(
            fontFamily: "Lato",
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 8),

        /// 🔲 FIELD
        AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.radiusInput + 6),
            border: _isFocused
                ? Border.all(
                    color: AppColors.inputBorder.withValues(alpha: 0.4),
                    width: 0.007.sh,
                  )
                : null,
          ),
          child: TextFormField(
            controller: widget.controller,
            initialValue: widget.initialValue,
            focusNode: _focusNode,

            /// 🔥 NEW FEATURES
            readOnly: widget.readOnly,
            onTap: widget.onTap,

            obscureText: widget.isPassword && _obscure,
            keyboardType: widget.keyboardType,
            enabled: widget.enabled,

            /// 🔥 EXPANDABLE SUPPORT
            maxLines: widget.isExpandable
                ? null
                : (widget.isPassword ? 1 : widget.maxLines),
            minLines: widget.isExpandable ? 3 : 1,

            maxLength: widget.maxLength,

            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus,

            validator: (value) {
              final error = widget.validator?.call(value);
              setState(() => _errorText = error);
              return null;
            },

            onChanged: (value) {
              final error = widget.validator?.call(value);
              setState(() => _errorText = error);
              widget.onChanged?.call(value);
            },

            onFieldSubmitted: widget.onSubmitted,

            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),

            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTextStyles.body.copyWith(
                color: AppColors.textSecondary,
              ),

              filled: true,
              fillColor: _isFocused ? Colors.white : AppColors.inputFill,

              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.sp,
                vertical: 10.sp,
              ),

              /// 🔥 PREFIX
              prefixIcon: widget.prefixImage != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _isFocused
                              ? AppColors.inputBorder
                              : AppColors.iconTint,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          widget.prefixImage!,
                          width: 20.w,
                          height: 20.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: _isFocused
                          ? AppColors.inputBorder
                          : AppColors.iconTint,
                      size: 20.h,
                    )
                  : null,

              /// 🔥 SUFFIX (UPDATED)
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.iconTint,
                        size: 20.h,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : widget.suffixWidget,

              /// 🔥 COUNTER CONTROL
              counterText: widget.showCounter ? null : "",

              /// BORDERS
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide(color: AppColors.inputFill, width: 2.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide(
                  color: AppColors.inputBorder,
                  width: 1.w,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide(color: AppColors.error, width: 1.8.w),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        /// 🔴 ERROR
        if (_errorText != null) ...[
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.error_outline, size: 14.sp, color: AppColors.error),
              SizedBox(width: 6.h),
              Expanded(
                child: Text(
                  _errorText!,
                  style: TextStyle(
                    color: AppColors.error,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
