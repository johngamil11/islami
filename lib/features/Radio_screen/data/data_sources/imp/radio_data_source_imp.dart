import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/api/end_point.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/Radio_screen/data/data_sources/radio_data_source.dart';
import 'package:islami/features/Radio_screen/data/models/radio_response_dto.dart';
@Injectable(as: RadioDataSource)
class RadioDataSourceImp implements RadioDataSource {
  ApiManager apiManager;

  RadioDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, RadioResponseDto>> radio () async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {

        var url = '${EndPoint.radio}';
        print('🔗 Request URL: $url');

        var response = await apiManager.getData(url , useRadioBaseUrl: true , language: 'ar');

        print('📥 Response Data: ${response.data}');

        var radio = RadioResponseDto.fromJson(response.data);

        if (response.statusCode == 200) {
          return Right(radio);
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

