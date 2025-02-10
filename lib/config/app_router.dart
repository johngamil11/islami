import 'package:flutter/material.dart';
import 'package:islami/config/routes.dart';
import 'package:islami/features/home_screen/presentation/pages/home_screen.dart';

class AppRouter {
 static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
