class PrayerTimeResponseEntity {
  PrayerTimeResponseEntity({
    this.code, 
    this.status, 
    this.data,
  });


  num? code;
  String? status;
  DataEntity? data;


}

class DataEntity {
  DataEntity({
    this.timings, 
    this.date, 
    this.meta,
  });


  TimingsEntity? timings;
  DateEntity? date;
  MetaEntity? meta;


}

class TimingsEntity {
  TimingsEntity({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });



  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

}

class MetaEntity {
  MetaEntity({
    this.latitude, 
    this.longitude, 
    this.timezone, 
    this.method, 
    this.latitudeAdjustmentMethod, 
    this.midnightMode, 
    this.school, 
    this.offset,
  });


  num? latitude;
  num? longitude;
  String? timezone;
  MethodEntity? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  OffsetEntity? offset;


}

class OffsetEntity {
  OffsetEntity({
    this.imsak, 
    this.fajr, 
    this.sunrise, 
    this.dhuhr, 
    this.asr, 
    this.maghrib, 
    this.sunset, 
    this.isha, 
    this.midnight,
  });


  num? imsak;
  num? fajr;
  num? sunrise;
  num? dhuhr;
  num? asr;
  num? maghrib;
  num? sunset;
  num? isha;
  num? midnight;


}

class MethodEntity {
  MethodEntity({
    this.id, 
    this.name, 
    this.params, 
    this.location,
  });


  num? id;
  String? name;
  ParamsEntity? params;
  LocationEntity? location;


}

class LocationEntity {
  LocationEntity({
    this.latitude, 
    this.longitude,
  });


  num? latitude;
  num? longitude;


}

class ParamsEntity {
  ParamsEntity({
    this.fajr, 
    this.isha,
  });

  num? fajr;
  num? isha;


}

class DateEntity {
  DateEntity({
    this.readable, 
    this.timestamp, 
    this.hijri, 
    this.gregorian,
  });


  String? readable;
  String? timestamp;
  HijriEntity? hijri;
  GregorianEntity? gregorian;

}

class GregorianEntity {
  GregorianEntity({
    this.date, 
    this.format, 
    this.day, 
    this.weekday, 
    this.month, 
    this.year, 
    this.designation, 
    this.lunarSighting,
  });


  String? date;
  String? format;
  String? day;
  WeekdayEntity? weekday;
  MonthEntity? month;
  String? year;
  DesignationEntity? designation;
  bool? lunarSighting;

 
}

class DesignationEntity {
  DesignationEntity({
    this.abbreviated, 
    this.expanded,
  });


  String? abbreviated;
  String? expanded;


}

class MonthEntity {
  MonthEntity({
    this.number, 
    this.en,
  });


  num? number;
  String? en;


}

class WeekdayEntity {
  WeekdayEntity({
    this.en,
  });

  String? en;


}

class HijriEntity {
  HijriEntity({
    this.date, 
    this.format, 
    this.day, 
    this.weekday, 
    this.month, 
    this.year, 
    this.holidays
  });


  String? date;
  String? format;
  String? day;
  WeekdayEntity? weekday;
  MonthEntity? month;
  String? year;
  List<String>? holidays;

}
