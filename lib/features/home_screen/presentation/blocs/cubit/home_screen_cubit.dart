import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';
import 'package:islami/features/home_screen/domain/use_cases/next_prayer_time_use_case%20.dart';
import 'package:islami/features/home_screen/domain/use_cases/prayer_time_use_case.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  PrayerTimeUseCase prayerTimeUseCase;
  NextPrayerTimeUseCase nextPrayerTimeUseCase;
  DataEntity? prayerTime;
  String? nextPrayerName;
String? timeRemaining;
Timer? _timer;


  HomeScreenCubit(
      {required this.prayerTimeUseCase, required this.nextPrayerTimeUseCase})
      : super(HomeScreenLoading());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

Future<void> getPrayerTime() async {
  emit(HomeScreenLoading());

  try {
    // 1️⃣ التحقق من صلاحيات الموقع
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(HomeScreenError(
            failures: Failures(errorMessage: "تم رفض إذن الموقع")));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(HomeScreenError(
          failures: Failures(
              errorMessage:
                  "تم رفض إذن الموقع نهائيًا، قم بتفعيله من الإعدادات.")));
      return;
    }

    // 2️⃣ جلب إحداثيات الموقع الحالي
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double latitude = position.latitude;
    double longitude = position.longitude;

    // 3️⃣ تحويل الإحداثيات إلى اسم المحافظة والدولة باستخدام Nominatim API
    String locationUrl =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&accept-language=en';
    
    var locationResponse = await Dio().get(locationUrl);
    var locationData = locationResponse.data;

    // استخراج اسم المحافظة والدولة باللغة الإنجليزية
    String? state = locationData['address']['state']; // المحافظة
    String? country = locationData['address']['country']; // الدولة

    // ✅ التحقق من نجاح الحصول على البيانات
    if (state == null || country == null) {
      emit(HomeScreenError(
          failures: Failures(
              errorMessage: "تعذر تحديد الموقع. تأكد من تشغيل GPS")));
      return;
    }

    print("📍 الموقع المحدد: $state - $country");

    // 4️⃣ استخدام اسم المحافظة والدولة لجلب مواقيت الصلاة
    var either = await prayerTimeUseCase.invoke(state, country);

    either.fold((error) {
      emit(HomeScreenError(failures: error));
    }, (response) {
      prayerTime = response.data;
      calculateNextPrayer();
      emit(HomeScreenLoaded(prayerTime: response.data));
    });
  } catch (e) {
    emit(HomeScreenError(failures: Failures(errorMessage: "خطأ: $e")));
  }
}

  // Future<void> getPrayerTime() async {
  //   emit(HomeScreenLoading());

  //   try {
  //     LocationPermission permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       if (permission == LocationPermission.denied) {
  //         emit(HomeScreenError(
  //             failures: Failures(errorMessage: "Location permission denied")));
  //         return;
  //       }
  //     }

  //     if (permission == LocationPermission.deniedForever) {
  //       emit(HomeScreenError(
  //           failures: Failures(
  //               errorMessage:
  //                   "Location permission permanently denied. Please enable it from settings.")));
  //       return;
  //     }

  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //     double latitude = position.latitude;
  //     double longitude = position.longitude;

  //     String locationUrl =
  //         'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude';
  //     var locationResponse = await Dio().get(locationUrl);
  //     var locationData = locationResponse.data;

  //     String city = locationData['address']['city'] ??
  //         locationData['address']['town'] ??
  //         locationData['address']['village'];
  //     String country = locationData['address']['country'];

  //     var either = await prayerTimeUseCase.invoke(city, country);

  //     either.fold((error) {
  //       emit(HomeScreenError(failures: error));
  //     }, (response) {
  //       prayerTime = response.data;
  //        calculateNextPrayer();
  //       emit(HomeScreenLoaded(prayerTime: response.data));
  //     });
  //   } catch (e) {
  //     emit(HomeScreenError(failures: Failures(errorMessage: "Error: $e")));
  //   }
  // }

void calculateNextPrayer() {
  final now = DateTime.now();
  final timings = prayerTime!.timings!;

  final Map<String, String> prayerTimes = {
    'الفجر': timings.fajr ?? '',
    'الظهر': timings.dhuhr ?? '',
    'العصر': timings.asr ?? '',
    'المغرب': timings.maghrib ?? '',
    'العشاء': timings.isha ?? '',
  };

  DateTime? nextPrayerTime;

  for (var entry in prayerTimes.entries) {
    final timeParts = entry.value.split(':');
    if (timeParts.length != 2) continue;

    final prayerDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );

    if (prayerDateTime.isAfter(now)) {
      nextPrayerTime = prayerDateTime;
      nextPrayerName = entry.key;
      break;
    }
  }

  if (nextPrayerTime == null) {
    final fajrParts = timings.fajr!.split(':');
    nextPrayerTime = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajrParts[0]),
      int.parse(fajrParts[1]),
    );
    nextPrayerName = 'الفجر';
  }

  final duration = nextPrayerTime.difference(now);
  timeRemaining =
      "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
startCountdown();
  emit(HomeScreenLoaded(prayerTime: prayerTime)); 
}

void startCountdown() {
  _timer?.cancel();

  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (timeRemaining == null) return;

    final parts = timeRemaining!.split(':');
    var duration = Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
      seconds: int.parse(parts[2]),
    );

    duration -= Duration(seconds: 1);

    if (duration.isNegative || duration.inSeconds == 0) {
      _timer?.cancel();
      calculateNextPrayer(); 
      return;
    }

    timeRemaining =
        "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
    emit(HomeScreenLoaded(prayerTime: prayerTime)); 
  });
}
}
