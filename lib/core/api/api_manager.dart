
import 'package:dio/dio.dart';
import 'package:islami/core/utils/app_constans.dart';


// @singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body , String? query , String? language}) {
       String todayDate = "${DateTime.now().day.toString().padLeft(2, '0')}-"
    "${DateTime.now().month.toString().padLeft(2, '0')}-"
    "${DateTime.now().year.toString().padLeft(2, '0')}";
    return dio.get(AppConstans.baseUrl + endPoint + todayDate ,
        data: body,
        queryParameters: {
          'city' : 'cairo',
          'country' : 'egypt'
        }, 
        options: Options(headers: headers, validateStatus: (status) => true));
  }

}

