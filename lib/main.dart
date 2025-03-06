import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/config/app_router.dart';
import 'package:islami/config/routes.dart';
import 'package:islami/core/di/di.dart';
import 'package:islami/features/home_screen/presentation/pages/home_screen.dart';
import 'package:islami/my_bloc_observer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  AppRouter.initialize();
  AudioPlayer();

  final prefs = await SharedPreferences.getInstance();
  MyApp.showOnboarding = prefs.getBool('onboardingCompleted') == null || !prefs.getBool('onboardingCompleted')!;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool showOnboarding = true;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: showOnboarding ? Routes.startScreen : Routes.homeScreen,
        );
      },
    );
  }
}
