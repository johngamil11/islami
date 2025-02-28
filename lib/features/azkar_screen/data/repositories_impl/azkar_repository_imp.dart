import 'package:injectable/injectable.dart';
import 'package:islami/features/azkar_screen/data/data_sources/local_data_source.dart';
@injectable
class AzkarRepositoryImp {
  final AzkarLocalDataSource azkarLocalDataSource ; 
  AzkarRepositoryImp({required this.azkarLocalDataSource});

  Future<List<String>> getazkar(String azkarName) async {
    return await azkarLocalDataSource.loadFile(azkarName);
  }
 
}