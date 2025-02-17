import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';

abstract class PrayerTimeRepository{
  Future <Either<Failures , PrayerTimeResponseEntity>> prayerTime(String city , String country);
}