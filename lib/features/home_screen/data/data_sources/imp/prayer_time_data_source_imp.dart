import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/api/end_point.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/data/data_sources/prayer_time_data_source.dart';
import 'package:islami/features/home_screen/data/models/prayer_time_response_dto.dart';

@Injectable(as: PrayerTimeDataSource)
class PrayerTimeDataSourceImp implements PrayerTimeDataSource {
  ApiManager apiManager;
  PrayerTimeDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failures, PrayerTimeResponseDto>> prayerTime() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData('${EndPoint.Mawaqit}');
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
}
