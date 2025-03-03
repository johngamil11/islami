
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/Radio_screen/domain/entities/radio_response_entity.dart';
import 'package:islami/features/Radio_screen/domain/repositories/radio_repository.dart';

@injectable
class RadioUseCase {
  RadioRepository radioRepository ;
  RadioUseCase ({ required this.radioRepository});
  
  Future<Either <Failures , RadioResponseEntity>> invoke (){
    return radioRepository.radio();
  }
}