import 'package:fitiq/core/providers/shared_prefs_provider.dart';
import 'package:fitiq/core/storage/secure_storage.dart';
import 'package:fitiq/core/theame/app_theme.dart';
import 'package:fitiq/routes/app_router.dart'; // 🔥 your router file
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFirstTime', true);
  await prefs.setString('appVersion', '1.0.0');
  final secureStorage = AppSecureStorage(const FlutterSecureStorage());
  await secureStorage.writeString('token', '123');  
  await prefs.setBool('isFirstTime', false);
  await prefs.setBool('isLoggedIn', true);
  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        secureStorageProvider.overrideWithValue(secureStorage),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: appRouter,
        );
      },
    );
  }
}
