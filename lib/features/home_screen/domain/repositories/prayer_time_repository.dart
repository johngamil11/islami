import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/domain/entities/next_prayer_response_entity.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';

abstract class PrayerTimeRepository{
  Future <Either<Failures , PrayerTimeResponseEntity>> prayerTime(String city , String country);
  Future <Either<Failures , NextPrayerResponseEntity>> NextprayerTime(String latitude , String longitude , String date );
}