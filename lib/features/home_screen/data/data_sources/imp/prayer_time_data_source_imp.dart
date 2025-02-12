import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/api/end_point.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/data/data_sources/prayer_time_data_source.dart';
import 'package:islami/features/home_screen/data/models/next_prayer_time_dto.dart';
import 'package:islami/features/home_screen/data/models/prayer_time_response_dto.dart';
import 'package:islami/features/home_screen/domain/entities/next_prayer_response_entity.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';

@Injectable(as: PrayerTimeDataSource)
class PrayerTimeDataSourceImp implements PrayerTimeDataSource {
  ApiManager apiManager;
  PrayerTimeDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failures, PrayerTimeResponseDto>> prayerTime(
      String city, String country) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData('${EndPoint.prayerTime}',
            city: city, country: country);
        print(response.data);

        var getPrayerTime = PrayerTimeResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getPrayerTime);
        } else {
          return Left(
              serverError(errorMessage: getPrayerTime.status.toString()));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, NextPrayerResponseDto>> NextPrayerTime(
      String latitude, String longitude , String date) async {
     try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
            String url = '${EndPoint.nextPrayerTime}?latitude=$latitude&longitude=$longitude&date=2024-07-16$date';
print('This is the URL: $url');
        var response = await apiManager.getData('${EndPoint.nextPrayerTime}',
           latitude: latitude, longitude: longitude , date: date );
        print(' this is link 2 : ${response}');

        var getNextPrayerTime = NextPrayerResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 404) {
          return Right(getNextPrayerTime);
        } else {
          return Left(
              serverError(errorMessage: getNextPrayerTime.status.toString()));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
