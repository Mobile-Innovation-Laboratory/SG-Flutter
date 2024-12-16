import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_group_flutter/common/theme/app_theme.dart';
import 'package:study_group_flutter/pages/dashboard_page.dart';
import 'package:study_group_flutter/pages/detail_product_page.dart';
import 'package:study_group_flutter/pages/login_page.dart';
import 'package:study_group_flutter/pages/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/dashboard': (context) => const DashboardPage(),
            '/product-detail': (context) => const DetailProductPage(),
          },
        );
      },
    );
  }
}
