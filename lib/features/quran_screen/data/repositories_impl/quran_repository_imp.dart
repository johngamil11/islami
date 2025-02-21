import 'package:injectable/injectable.dart';
import 'package:islami/features/quran_screen/data/data_sources/local_data_source.dart';
@injectable
class QuranRepositoryImp {
  final LocalDataSource localDataSource ; 
  QuranRepositoryImp({required this.localDataSource});

  List<String> getSurahNames (){
    return localDataSource.getSurahNames();
  }
   Future<List<String>> getSurahContent(int index) async {
    return await localDataSource.loadFile(index);
  }
}