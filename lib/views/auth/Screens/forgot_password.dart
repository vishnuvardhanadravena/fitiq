import 'package:fitiq/core/constants/app_assets.dart';
import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/widgets/login_primary_button.dart';
import 'package:fitiq/core/widgets/text_felid.dart';
import 'package:fitiq/routes/route_constants.dart';
import 'package:fitiq/views/auth/Screens/login_screen.dart';
import 'package:fitiq/views/auth/helpers.dart';
import 'package:fitiq/views/auth/widgets/auth_footer.dart';
import 'package:fitiq/views/auth/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  bool _loading = false;
  String? _errorMessage;
  Future<void> _handleSendRestLink() async {
    // Trigger Flutter's form validation (shows custom errors via setState)
    _formKey.currentState?.validate();

    // Manually check field values since validator always returns null
    final emailError = validateEmail(_emailCtrl.text);

    if (emailError != null) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      // your auth logic...
      if (mounted) context.go(RouteList.login);
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FitiqPageHeader(
                  title: 'Forgot Password?',
                  subtitle: 'No worries. We’ll send you reset instructions.',
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
                      Text(
                        'Enter your email address below and we’ll send you instructions to reset your password.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.black,
                            ),
                      ),
                      SizedBox(height: 20.h),
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
                      SizedBox(height: 20.h),
                      FitiqPrimaryButton(
                        label: 'Sign In',
                        trailingIcon: Icons.arrow_forward,
                        onPressed: _handleSendRestLink,
                        isLoading: _loading,
                        fontFamily: "Oswald",
                      ),
                      SizedBox(height: 20.h),
                      FitiqAuthFooter(
                        onRegister: () {
                          context.goNamed(RouteList.login);
                        },
                        promptText: "Remember your password?",
                        registerText: "Back to Login",
                        registerTextStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
