import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/config/routes.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/features/Hadith_screen/data/repositories_impl/hadith_repository_imp.dart';
import 'package:islami/features/Hadith_screen/presentation/blocs/cubit/hadith_cubit.dart';
import 'package:islami/features/Hadith_screen/presentation/pages/Hadith_screen.dart';
import 'package:islami/features/home_screen/data/data_sources/imp/prayer_time_data_source_imp.dart';
import 'package:islami/features/home_screen/data/data_sources/prayer_time_data_source.dart';
import 'package:islami/features/home_screen/data/repositories_impl/prayer_time_repository_imp.dart';
import 'package:islami/features/home_screen/domain/use_cases/next_prayer_time_use_case%20.dart';
import 'package:islami/features/home_screen/domain/use_cases/prayer_time_use_case.dart';
import 'package:islami/features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart';
import 'package:islami/features/home_screen/presentation/pages/home_screen.dart';
import 'package:islami/features/quran_screen/data/data_sources/local_data_source.dart';
import 'package:islami/features/quran_screen/data/repositories_impl/quran_repository_imp.dart';
import 'package:islami/features/quran_screen/presentation/blocs/cubit/quran_cubit.dart';
import 'package:islami/features/quran_screen/presentation/pages/quran_screen.dart';
import 'package:islami/features/Hadith_screen/data/data_sources/local_data_source.dart';
import 'package:islami/features/sebha_screen/presentation/pages/sebha_screen.dart';

class AppRouter {
  static late PrayerTimeUseCase prayerTimeUseCase;
  static late HomeScreenCubit homeScreenCubit;
  static late NextPrayerTimeUseCase nextPrayerTimeUseCase;
  static void initialize() {
    prayerTimeUseCase = PrayerTimeUseCase(
        homeScreenRepository: PrayerTimeRepositoryImp(
            prayerTimeDataSource:
                PrayerTimeDataSourceImp(apiManager: ApiManager())));

    nextPrayerTimeUseCase = NextPrayerTimeUseCase(
        homeScreenRepository: PrayerTimeRepositoryImp(
            prayerTimeDataSource:
                PrayerTimeDataSourceImp(apiManager: ApiManager())));

    homeScreenCubit = HomeScreenCubit(
        prayerTimeUseCase: prayerTimeUseCase,
        nextPrayerTimeUseCase: nextPrayerTimeUseCase);
  }

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => homeScreenCubit,
                  child: HomeScreen(),
                ));
      case Routes.QuranScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => QuranCubit(
                      repository: QuranRepositoryImp(
                          localDataSource: LocalDataSource())),
                  child: QuranScreen(),
                ));
      case Routes.HadithScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HadithCubit(HadithRepositoryImp(localDataSource: HadithLocalDataSource()  )),
                  child: HadithScreen(),
                ));
      case Routes.sebhaScreen:
        return MaterialPageRoute(
            builder: (_) => SebhaScreen());

      default:
        return null;
    }
  }
}
