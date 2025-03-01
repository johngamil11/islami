import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/api/end_point.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/qiblah_screen/data/data_sources/qibla_data_source.dart';
import 'package:islami/features/qiblah_screen/data/models/qiblah_response_dto.dart';
@Injectable(as: QiblaDataSource )
@Injectable(as: QiblaDataSource)
class QiblaDataSourceImp implements QiblaDataSource {
  ApiManager apiManager;

  QiblaDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, QiblahResponseDto>> qibla(double latitude, double longitude) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {

        var url = '${EndPoint.qiblah}/$latitude/$longitude';
        print('🔗 Request URL: $url');

        var response = await apiManager.getData(url);

        print('📥 Response Data: ${response.data}');

        var qiblah = QiblahResponseDto.fromJson(response.data);

        if (response.statusCode == 200) {
          return Right(qiblah);
        } else {
        return Left(Failures(errorMessage: 'Server error: ${response.statusCode} - ${response.data}'));
        }
      } else {
        return Left(NetworkError(errorMessage: 'No internet connection, please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}

