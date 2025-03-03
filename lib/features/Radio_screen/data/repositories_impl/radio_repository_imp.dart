import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/Radio_screen/data/data_sources/radio_data_source.dart';
import 'package:islami/features/Radio_screen/domain/entities/radio_response_entity.dart';
import 'package:islami/features/Radio_screen/domain/repositories/radio_repository.dart';

@Injectable(as: RadioRepository)
class RadioRepositoryImp implements RadioRepository{
  RadioDataSource radioDataSource ; 
  RadioRepositoryImp({required this.radioDataSource});
  @override
  Future<Either<Failures, RadioResponseEntity>> radio ()async {
       var either = await radioDataSource.radio();
    return either.fold((error)=> Left(error), (response)=>Right(response));
  }
}