import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/qiblah_screen/data/data_sources/qibla_data_source.dart';
import 'package:islami/features/qiblah_screen/domain/entities/qiblah_entity.dart';
import 'package:islami/features/qiblah_screen/domain/repositories/qiblah_repository.dart';

@Injectable(as: QiblahRepository)
class QiblaRepositoryImp implements QiblahRepository{
  QiblaDataSource qiblaDataSource ; 
  QiblaRepositoryImp({required this.qiblaDataSource});
  @override
  Future<Either<Failures, QiblahResponseEntity>> qibla(double latitude, double longitude)async {
       var either = await qiblaDataSource.qibla(latitude, longitude);
    return either.fold((error)=> Left(error), (response)=>Right(response));
  }
}