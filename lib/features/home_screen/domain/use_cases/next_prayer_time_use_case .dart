import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/domain/entities/next_prayer_response_entity.dart';
import 'package:islami/features/home_screen/domain/repositories/prayer_time_repository.dart';

@injectable
class NextPrayerTimeUseCase {
  PrayerTimeRepository homeScreenRepository ;
  NextPrayerTimeUseCase({required this.homeScreenRepository});
    

    Future <Either<Failures , NextPrayerResponseEntity>> invoke(String latitude , String longitude, String date){
      return homeScreenRepository.NextprayerTime(latitude, longitude ,date);
    }
   
  }
