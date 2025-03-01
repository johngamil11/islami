// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/azkar_screen/data/data_sources/local_data_source.dart'
    as _i125;
import '../../features/azkar_screen/data/repositories_impl/azkar_repository_imp.dart'
    as _i90;
import '../../features/Hadith_screen/data/data_sources/local_data_source.dart'
    as _i515;
import '../../features/Hadith_screen/data/repositories_impl/hadith_repository_imp.dart'
    as _i539;
import '../../features/home_screen/data/data_sources/imp/prayer_time_data_source_imp.dart'
    as _i288;
import '../../features/home_screen/data/data_sources/prayer_time_data_source.dart'
    as _i375;
import '../../features/home_screen/data/repositories_impl/prayer_time_repository_imp.dart'
    as _i827;
import '../../features/home_screen/domain/repositories/prayer_time_repository.dart'
    as _i302;
import '../../features/home_screen/domain/use_cases/next_prayer_time_use_case%20.dart'
    as _i683;
import '../../features/home_screen/domain/use_cases/prayer_time_use_case.dart'
    as _i830;
import '../../features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart'
    as _i282;
import '../../features/qiblah_screen/data/data_sources/imp/qibla_data_source_imp.dart'
    as _i143;
import '../../features/qiblah_screen/data/data_sources/qibla_data_source.dart'
    as _i490;
import '../../features/qiblah_screen/data/repositories_impl/qibla_repository_imp.dart'
    as _i716;
import '../../features/qiblah_screen/domain/repositories/qiblah_repository.dart'
    as _i104;
import '../../features/qiblah_screen/domain/use_cases/qiblah_use_case.dart'
    as _i959;
import '../../features/qiblah_screen/presentation/blocs/cubit/qibla_cubit.dart'
    as _i108;
import '../../features/quran_screen/data/data_sources/local_data_source.dart'
    as _i540;
import '../../features/quran_screen/data/repositories_impl/quran_repository_imp.dart'
    as _i166;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i515.HadithLocalDataSource>(
        () => _i515.HadithLocalDataSource());
    gh.factory<_i540.LocalDataSource>(() => _i540.LocalDataSource());
    gh.factory<_i125.AzkarLocalDataSource>(() => _i125.AzkarLocalDataSource());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i490.QiblaDataSource>(
        () => _i143.QiblaDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i90.AzkarRepositoryImp>(() => _i90.AzkarRepositoryImp(
        azkarLocalDataSource: gh<_i125.AzkarLocalDataSource>()));
    gh.factory<_i539.HadithRepositoryImp>(() => _i539.HadithRepositoryImp(
        localDataSource: gh<_i515.HadithLocalDataSource>()));
    gh.factory<_i375.PrayerTimeDataSource>(() =>
        _i288.PrayerTimeDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i683.NextPrayerTimeUseCase>(() => _i683.NextPrayerTimeUseCase(
        homeScreenRepository: gh<_i302.PrayerTimeRepository>()));
    gh.factory<_i830.PrayerTimeUseCase>(() => _i830.PrayerTimeUseCase(
        homeScreenRepository: gh<_i302.PrayerTimeRepository>()));
    gh.factory<_i104.QiblahRepository>(() =>
        _i716.QiblaRepositoryImp(qiblaDataSource: gh<_i490.QiblaDataSource>()));
    gh.factory<_i959.QiblahUseCase>(() =>
        _i959.QiblahUseCase(qiblahRepository: gh<_i104.QiblahRepository>()));
    gh.factory<_i282.HomeScreenCubit>(() => _i282.HomeScreenCubit(
          prayerTimeUseCase: gh<_i830.PrayerTimeUseCase>(),
          nextPrayerTimeUseCase: gh<_i683.NextPrayerTimeUseCase>(),
        ));
    gh.factory<_i166.QuranRepositoryImp>(() =>
        _i166.QuranRepositoryImp(localDataSource: gh<_i540.LocalDataSource>()));
    gh.factory<_i827.PrayerTimeRepositoryImp>(() =>
        _i827.PrayerTimeRepositoryImp(
            prayerTimeDataSource: gh<_i375.PrayerTimeDataSource>()));
    gh.factory<_i108.QiblaCubit>(
        () => _i108.QiblaCubit(qiblahUseCase: gh<_i959.QiblahUseCase>()));
    return this;
  }
}
