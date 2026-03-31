import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_radius.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FitiqTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final String? prefixImage;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final String? initialValue;

  const FitiqTextField({
    super.key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.autofocus = false,
    this.initialValue,
    this.prefixImage,
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
    _focusNode
        .addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
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
        Text(widget.label,
            style: AppTextStyles.label
                .copyWith(fontFamily: "Lato", fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.radiusInput + 5),
                border: _isFocused
                    ? Border.all(
                        color: AppColors.inputBorder.withValues(alpha: 0.4),
                        width: 4.5,
                      )
                    : null,

                // boxShadow: _isFocused
                //     ? [
                //         BoxShadow(
                //           color: AppColors.inputBorder.withOpacity(0.9),
                //           blurRadius: 18,
                //           spreadRadius: 0,
                //         ),
                //       ]
                //     : [],

                // /// ✅ SUBTLE BORDER BACKGROUND FIX
                // color: Colors.transparent,
              ),
              child: TextFormField(
                controller: widget.controller,
                initialValue: widget.initialValue,
                focusNode: _focusNode,
                obscureText: widget.isPassword && _obscure,
                keyboardType: widget.keyboardType,
                enabled: widget.enabled,
                maxLines: widget.isPassword ? 1 : widget.maxLines,
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                autofocus: widget.autofocus,
                validator: (value) {
                  final error = widget.validator?.call(value);
                  setState(() => _errorText = error);
                  return null; // 🔥 important → disables default error UI
                },
                onChanged: (value) {
                  final error = widget.validator?.call(value);
                  setState(() => _errorText = error);

                  widget.onChanged?.call(value);
                },
                onFieldSubmitted: widget.onSubmitted,
                style:
                    AppTextStyles.body.copyWith(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: AppTextStyles.body
                      .copyWith(color: AppColors.textSecondary),
                  filled: true,
                  fillColor: _isFocused ? Colors.white : AppColors.inputFill,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
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
                              width: 20,
                              height: 20,
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
                              size: 20,
                            )
                          : null,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            _obscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.iconTint,
                            size: 20,
                          ),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                    borderSide:
                        BorderSide(color: AppColors.inputFill, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                    borderSide: const BorderSide(
                      color: AppColors.inputBorder,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                    borderSide:
                        const BorderSide(color: AppColors.error, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                    borderSide:
                        const BorderSide(color: AppColors.error, width: 1.8),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusInput),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            if (_errorText != null) ...[
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 14,
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      _errorText!,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        )
      ],
    );
  }
}
