import 'package:islami/features/qiblah_screen/domain/entities/qiblah_entity.dart';

/// code : 200
/// status : "OK"
/// data : {"latitude":31.2001,"longitude":29.9187,"direction":135.436957441117}

class QiblahResponseDto extends QiblahResponseEntity {
  QiblahResponseDto({
      super.code, 
      super.status, 
      super.data,});

  QiblahResponseDto.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }



}

/// latitude : 31.2001
/// longitude : 29.9187
/// direction : 135.436957441117

class DataDto extends DataEntity {
  DataDto({
      super.latitude, 
      super.longitude, 
      super.direction,});

  DataDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    direction = json['direction'];
  }


}