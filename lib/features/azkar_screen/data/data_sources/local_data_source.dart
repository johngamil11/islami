import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class AzkarLocalDataSource {
   
   Future<List<String>> loadFile(String azkarName) async {
    String azkar = await rootBundle.loadString('assets/files/azkar/${azkarName}.txt');
return azkar.split(RegExp(r'#\r?\n'));
  }


}
