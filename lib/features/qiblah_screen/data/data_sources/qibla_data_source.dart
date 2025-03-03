import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/qiblah_screen/domain/entities/qiblah_entity.dart';

abstract class QiblaDataSource {
    Future <Either<Failures , QiblahResponseEntity>> qibla (double latitude, double longitude);

} 