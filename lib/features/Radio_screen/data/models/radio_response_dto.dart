
import 'package:islami/features/Radio_screen/domain/entities/radio_response_entity.dart';

class RadioResponseDto extends RadioResponseEntity {
  RadioResponseDto({
      super.radios,});

  RadioResponseDto.fromJson(dynamic json) {
    if (json['radios'] != null) {
      radios = [];
      json['radios'].forEach((v) {
        radios?.add(RadiosData.fromJson(v));
      });
    }
  }


}

/// id : 1
/// name : "إبراهيم الأخضر"
/// url : "https://backup.qurango.net/radio/ibrahim_alakdar"
/// recent_date : "2019-02-02 13:40:34"

class RadiosData extends RadiosEntity {
  RadiosData({
      super.id, 
      super.name, 
      super.url, 
      super.recentDate,});

  RadiosData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }




}