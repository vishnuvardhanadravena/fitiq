import 'package:fitiq/core/theame/app_theme.dart';
import 'package:fitiq/routes/app_router.dart'; // 🔥 your router file
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      // ✅ ONLY ONE (top level)
      child: MyApp(),
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
          // 🔥 IMPORTANT CHANGE
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,

          routerConfig: appRouter, 
        );
      },
    );
  }
}
