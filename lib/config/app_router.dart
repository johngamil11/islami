import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/config/routes.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/features/home_screen/data/data_sources/imp/prayer_time_data_source_imp.dart';
import 'package:islami/features/home_screen/data/data_sources/prayer_time_data_source.dart';
import 'package:islami/features/home_screen/data/repositories_impl/prayer_time_repository_imp.dart';
import 'package:islami/features/home_screen/domain/use_cases/prayer_time_use_case.dart';
import 'package:islami/features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart';
import 'package:islami/features/home_screen/presentation/pages/home_screen.dart';

class AppRouter {
  static late PrayerTimeUseCase prayerTimeUseCase;
  static late HomeScreenCubit homeScreenCubit;

  // تهيئة المتغيرات بشكل صحيح في AppRouter
  static void initialize() {
    prayerTimeUseCase = PrayerTimeUseCase(
        homeScreenRepository: PrayerTimeRepositoryImp(
            prayerTimeDataSource:
                PrayerTimeDataSourceImp(apiManager: ApiManager())));

    homeScreenCubit = HomeScreenCubit(prayerTimeUseCase: prayerTimeUseCase);
  }

  // دالة ثابتة لإرجاع المسار بناءً على المعلمات
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => homeScreenCubit,
                  child: HomeScreen(),
                ));

      default:
        return null;
    }
  }
}
