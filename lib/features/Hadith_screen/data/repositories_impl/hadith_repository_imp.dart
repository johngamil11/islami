import 'package:injectable/injectable.dart';
import 'package:islami/features/Hadith_screen/data/data_sources/local_data_source.dart';
@injectable
class HadithRepositoryImp {
  final HadithLocalDataSource localDataSource ; 
  HadithRepositoryImp({required this.localDataSource});

  Future<List<String>> getHadith() async {
    return await localDataSource.loadFile();
  }
 
}