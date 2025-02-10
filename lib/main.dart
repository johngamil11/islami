import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/config/app_router.dart';
import 'package:islami/config/routes.dart';
import 'package:islami/features/home_screen/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: Routes.homeScreen,
        );
      },
    );
  }
}