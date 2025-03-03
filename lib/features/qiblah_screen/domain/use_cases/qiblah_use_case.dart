
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/qiblah_screen/domain/entities/qiblah_entity.dart';
import 'package:islami/features/qiblah_screen/domain/repositories/qiblah_repository.dart';

@injectable
class QiblahUseCase {
  QiblahRepository qiblahRepository ;
  QiblahUseCase ({ required this.qiblahRepository});
  
  Future<Either <Failures , QiblahResponseEntity>> invoke (double latitude, double longitude){
    return qiblahRepository.qibla(latitude, longitude);
  }
}