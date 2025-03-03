
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/utils/app_constans.dart';


@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

Future<Response> getData(String endPoint,
    {Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    String? city,
    String? country,
    String? query,
    String? latitude,
    String? longitude,
    String? date,
    String? language ,
    bool useRadioBaseUrl = false}) {  // إضافة هذا المتغير للتحكم في الـ baseUrl

  String todayDate = "${DateTime.now().day.toString().padLeft(2, '0')}-"
      "${DateTime.now().month.toString().padLeft(2, '0')}-"
      "${DateTime.now().year.toString().padLeft(2, '0')}";

  // تحديد الـ baseUrl المناسب
  String baseUrl = useRadioBaseUrl ? AppConstans.radioBaseUrl : AppConstans.baseUrl;
  String url = baseUrl + endPoint;

  if (endPoint.contains('timingsByCity')) {
    url = url + todayDate;
  }

  return dio.get(url,
    data: body,
    queryParameters: {
      'city': city ?? 'cairo',
      'country': country ?? 'egypt',
      'latitude': latitude,
      'longitude': longitude,
      'date': date ?? todayDate,
      'language' : language
    },
    options: Options(headers: headers, validateStatus: (status) => true),
  );
}


}

