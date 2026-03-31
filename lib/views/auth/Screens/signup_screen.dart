import 'package:fitiq/core/constants/app_assets.dart';
import 'package:fitiq/core/theame/app_colors.dart';
import 'package:fitiq/core/theame/app_toast.dart';
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

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _loading = false;
  String? _errorMessage;
  Future<void> _handleSignup() async {
    _formKey.currentState?.validate();

    final nameError = validateName(_fullnameCtrl.text);
    final emailError = validateEmail(_emailCtrl.text);
    final phoneError = validatePhone(_phoneCtrl.text);
    final passError = validatePassword(_passCtrl.text);

    if (nameError != null ||
        emailError != null ||
        phoneError != null ||
        passError != null) {
      return; // ❌ stop
    }

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      /// 👉 API call here
      // await AuthService.signup(...);

      if (mounted) {
        context.go('/home');
      }
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
        child: Column(
          children: [
            FitiqPageHeader(
              title: 'Create Your Account',
              subtitle:
                  'Start your personalized fitness and nutrition journey today.',
              logo: const FitiqLogo(showWordmark: false,),
              height: MediaQuery.of(context).size.height * 0.32,
              backgroundImagePath: AppAssets.loginBackground,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  FitiqTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    // prefixIcon: Icons.email_outlined,
                    // prefixImage: AppAssets.loginEmailicon,
                    controller: _fullnameCtrl,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (v) => validateName(v ?? ''),
                  ),
                  SizedBox(height: 16.h),
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
                  SizedBox(height: 16.h),
                  FitiqTextField(
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    // prefixIcon: Icons.email_outlined,
                    // prefixImage: AppAssets.loginEmailicon,
                    controller: _phoneCtrl,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (v) => validatePhone(v ?? ''),
                  ),
                  SizedBox(height: 16.h),
                  FitiqTextField(
                    label: 'Password',
                    hint: '••••••••••••',
                    prefixIcon: Icons.lock_outline,
                    // prefixImage: AppAssets.loginPasswordicon,
                    isPassword: true,
                    controller: _passCtrl,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {},
                    validator: (v) => validatePassword(v ?? ''),
                  ),
                  if (_errorMessage != null) ...[
                    SizedBox(height: 10.h),
                    FitiqErrorBanner(message: _errorMessage!),
                  ],
                  SizedBox(height: 24.h),
                  FitiqPrimaryButton(
                    label: 'Create Account',
                    trailingIcon: Icons.arrow_forward,
                    onPressed: _handleSignup,
                    isLoading: _loading,
                    fontFamily: "Oswald",
                  ),
                  SizedBox(height: 16.h),
                  FitiqAuthFooter(
                    promptText: "By creating an account, you agree to our ",
                    registerText: "Terms & Privacy Policy",
                    registerTextStyle: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentCyan,
                    ),
                    // forgotPasswordText: "Privacy Policy",
                    onRegister: () {
                      AppToast.info("Terms & Privacy Policy coming soon!");
                    },
                  ),
                  FitiqAuthFooter(
                    promptText: "Already have an account?",
                    registerText: "Login",
                    registerTextStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    onRegister: () {
                      context.goNamed(RouteList.login);
                    },
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
