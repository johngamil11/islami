import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/data/data_sources/prayer_time_data_source.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';
import 'package:islami/features/home_screen/domain/repositories/prayer_time_repository.dart';
@injectable
class PrayerTimeRepositoryImp implements PrayerTimeRepository {
  PrayerTimeDataSource prayerTimeDataSource ;
  PrayerTimeRepositoryImp({required this.prayerTimeDataSource});
  @override
  Future<Either<Failures, PrayerTimeResponseEntity>> prayerTime(String city , String country)async {
    var either = await prayerTimeDataSource.prayerTime(city , country);
    return either.fold((error)=> Left(error), (response)=>Right(response));
  }
  

}