import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/Radio_screen/domain/entities/radio_response_entity.dart';

abstract class RadioRepository {
  Future <Either<Failures , RadioResponseEntity>> radio ();
  
}