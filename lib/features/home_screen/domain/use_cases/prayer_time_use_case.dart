import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';
import 'package:islami/features/home_screen/domain/repositories/prayer_time_repository.dart';

@injectable
class PrayerTimeUseCase {
  PrayerTimeRepository homeScreenRepository ;
  PrayerTimeUseCase({required this.homeScreenRepository});
    

    Future <Either<Failures , PrayerTimeResponseEntity>> invoke(String city , String country){
      return homeScreenRepository.prayerTime(city , country);
    }
   
  }
