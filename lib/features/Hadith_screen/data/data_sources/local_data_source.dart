import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class HadithLocalDataSource {
   
   Future<List<String>> loadFile() async {
    String hadithContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    return hadithContent.split("#\r\n"); 
  }


}
