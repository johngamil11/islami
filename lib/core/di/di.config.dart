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
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i375.PrayerTimeDataSource>(() =>
        _i288.PrayerTimeDataSourceImp(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i683.NextPrayerTimeUseCase>(() => _i683.NextPrayerTimeUseCase(
        homeScreenRepository: gh<_i302.PrayerTimeRepository>()));
    gh.factory<_i830.PrayerTimeUseCase>(() => _i830.PrayerTimeUseCase(
        homeScreenRepository: gh<_i302.PrayerTimeRepository>()));
    gh.factory<_i282.HomeScreenCubit>(() => _i282.HomeScreenCubit(
          prayerTimeUseCase: gh<_i830.PrayerTimeUseCase>(),
          nextPrayerTimeUseCase: gh<_i683.NextPrayerTimeUseCase>(),
        ));
    gh.factory<_i827.PrayerTimeRepositoryImp>(() =>
        _i827.PrayerTimeRepositoryImp(
            prayerTimeDataSource: gh<_i375.PrayerTimeDataSource>()));
    return this;
  }
}
