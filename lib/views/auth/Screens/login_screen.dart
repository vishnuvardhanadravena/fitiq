import 'package:fitiq/core/constants/app_assets.dart';
import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_radius.dart';
import 'package:fitiq/core/theame/app_text_styles.dart';
import 'package:fitiq/core/theame/app_toast.dart';
import 'package:fitiq/core/widgets/divider.dart';
import 'package:fitiq/core/widgets/login_primary_button.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/auth/helpers.dart';
import 'package:fitiq/views/auth/widgets/auth_footer.dart';
import 'package:fitiq/views/auth/widgets/header_widget.dart';
import 'package:fitiq/views/auth/widgets/soicial_meida_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FitiqLogo extends StatelessWidget {
  final double size;
  final bool showWordmark;

  const FitiqLogo({
    super.key,
    this.size = 72,
    this.showWordmark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Diamond badge
        Padding(
          padding: const EdgeInsets.all(0),
          child: Image.asset(
            AppAssets.logowithtext,
            fit: BoxFit.cover,
          ),
        ),
        if (showWordmark) ...[
          SizedBox(height: 6.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'fit',
                  style: TextStyle(
                    fontSize: size * 0.32,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    letterSpacing: -1,
                  ),
                ),
                TextSpan(
                  text: 'iq',
                  style: TextStyle(
                    fontSize: size * 0.32,
                    fontWeight: FontWeight.w900,
                    color: AppColors.accent,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class FitiqSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final double? width;
  final double height;
  final Color? borderColor;
  final Color? textColor;

  const FitiqSecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.leadingIcon,
    this.width,
    this.height = 54,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: 1.8.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radiusButton),
          ),
          foregroundColor: textColor ?? AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[
              Icon(leadingIcon, size: 18.sp),
              SizedBox(width: 8.w),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: textColor ?? AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitiqSignInScreen extends StatefulWidget {
  const FitiqSignInScreen({super.key});

  @override
  State<FitiqSignInScreen> createState() => _FitiqSignInScreenState();
}

class _FitiqSignInScreenState extends State<FitiqSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    // Trigger Flutter's form validation (shows custom errors via setState)
    _formKey.currentState?.validate();

    // Manually check field values since validator always returns null
    final emailError = validateEmail(_emailCtrl.text);
    final passwordError = validatePassword(_passCtrl.text);

    if (emailError != null || passwordError != null) return; // ❌ Stop here

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      // your auth logic...
      if (mounted) context.go('/home');
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FitiqPageHeader(
                title: 'Sign In To FitIq',
                subtitle: 'Login to continue your wellness journey.',
                logo: FitiqLogo(
                  showWordmark: false,
                  size: MediaQuery.of(context).size.height * 0.01,
                ),
                height: MediaQuery.of(context).size.height * 0.32,
                backgroundImagePath: AppAssets.loginBackground,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    FitiqTextField(
                      label: 'Email Address',
                      hint: 'you@example.com',
                      prefixIcon: Icons.email_outlined,
                      // prefixImage: AppAssets.loginEmailicon,
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) => validateEmail(v ?? ''),
                    ),
                    const SizedBox(height: 16),
                    FitiqTextField(
                      label: 'Password',
                      hint: '••••••••••••',
                      prefixIcon: Icons.lock_outline,
                      // prefixImage: AppAssets.loginPasswordicon,
                      isPassword: true,
                      controller: _passCtrl,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _handleSignIn(),
                      validator: (v) => validatePassword(v ?? ''),
                    ),
                    if (_errorMessage != null) ...[
                      SizedBox(height: 10.h),
                      FitiqErrorBanner(message: _errorMessage!),
                    ],
                    SizedBox(height: 24.h),
                    FitiqPrimaryButton(
                      label: 'Sign In',
                      trailingIcon: Icons.arrow_forward,
                      onPressed: _handleSignIn,
                      isLoading: _loading,
                      fontFamily: "Oswald",
                    ),
                    SizedBox(height: 24.h),
                    FitiqDividerWithLabel(label: 'or continue with'),
                    SizedBox(height: 24.h),
                    FitiqSocialAuthRow(
                      onInstagram: () {
                        AppToast.info("Instagram login coming soon");
                      },
                      onFacebook: () {
                        AppToast.info("Facebook login coming soon");
                      },
                      onLinkedIn: () {
                        AppToast.info("LinkedIn login coming soon");
                      },
                    ),
                    SizedBox(height: 24.h),
                    FitiqAuthFooter(
                      onRegister: () {
                        context.pushNamed('/register');
                      },
                      promptText: "Don't have an account?",
                      registerText: "Register",
                      registerTextStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      forgotPasswordText: "Forgot Password?",
                      onForgotPassword: () {
                        context.push(RouteList.forgotPassword);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FitiqErrorBanner extends StatelessWidget {
  final String message;
  final bool isSuccess;

  const FitiqErrorBanner({
    super.key,
    required this.message,
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSuccess ? AppColors.success : AppColors.error;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(
            isSuccess ? Icons.check_circle_outline : Icons.error_outline,
            color: color,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 13, color: color, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class FitiqSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    bool isSuccess = false,
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final color = isSuccess
        ? AppColors.success
        : isError
            ? AppColors.error
            : AppColors.primary;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isSuccess
                  ? Icons.check_circle_outline
                  : isError
                      ? Icons.error_outline
                      : Icons.info_outline,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(message,
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: duration,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}

class FitiqLoadingOverlay extends StatelessWidget {
  final String? message;
  const FitiqLoadingOverlay({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.45),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 24,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primary),
                strokeWidth: 3,
              ),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(message!, style: AppTextStyles.bodyDark),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class FitiqCheckboxTile extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String label;
  final String? linkText;
  final VoidCallback? onLinkTap;

  const FitiqCheckboxTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.linkText,
    this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged?.call(!value),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: label, style: AppTextStyles.caption),
                  if (linkText != null)
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: onLinkTap,
                        child: Text(linkText!, style: AppTextStyles.link),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
