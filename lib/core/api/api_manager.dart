
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
    {Map<String, dynamic>? headers, Map<String, dynamic>? body, String? city, String? country, String? query, String? latitude, String? longitude, String? date}) {

  String todayDate = "${DateTime.now().day.toString().padLeft(2, '0')}-"
      "${DateTime.now().month.toString().padLeft(2, '0')}-"
      "${DateTime.now().year.toString().padLeft(2, '0')}";

  // تحديد إذا كان التاريخ يجب أن يكون جزءًا من الرابط أو جزءًا من الـ query
  String url = AppConstans.baseUrl + endPoint;

  if (endPoint.contains('timingsByCity')) {
    // إذا كان الـ endpoint هو nextPrayer، أضف التاريخ إلى الرابط
    url = url + todayDate;
  }

  return dio.get(url,
    data: body,
    queryParameters: {
      'city' : city ?? 'cairo',
      'country' : country ?? 'egypt',
      'latitude' : latitude,
      'longitude' : longitude,
      'date' : date ?? todayDate, // تأكد من إرسال التاريخ في الـ queryParameter
    },
    options: Options(headers: headers, validateStatus: (status) => true),
  );
}


}

