import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';

class PrayerTimeResponseDto extends PrayerTimeResponseEntity{
  PrayerTimeResponseDto({
    super.code, 
    super.status, 
    super.data,
  });

  PrayerTimeResponseDto.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }
 
}

class DataDto extends DataEntity{
  DataDto({
    super.timings, 
    super.date, 
    super.meta,
  });

  DataDto.fromJson(dynamic json) {
    timings = json['timings'] != null ? TimingsDto.fromJson(json['timings']) : null;
    date = json['date'] != null ? DateDto.fromJson(json['date']) : null;
    meta = json['meta'] != null ? MetaDto.fromJson(json['meta']) : null;
  }


}

class TimingsDto extends TimingsEntity {
  TimingsDto({
    super.fajr,
    super.dhuhr,
    super.asr,
    super.maghrib,
    super.isha,
  });

  TimingsDto.fromJson(dynamic json) {
    fajr = json['Fajr'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
  }


}

class MetaDto  extends MetaEntity{
  MetaDto({
    super.latitude, 
    super.longitude, 
    super.timezone, 
    super.method, 
    super.latitudeAdjustmentMethod, 
    super.midnightMode, 
    super.school, 
    super.offset,
  });

  MetaDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = json['method'] != null ? MethodDto.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = json['offset'] != null ? OffsetDto.fromJson(json['offset']) : null;
  }

}

class OffsetDto extends OffsetEntity {
  OffsetDto({
    super.imsak, 
    super.fajr, 
    super.sunrise, 
    super.dhuhr, 
    super.asr, 
    super.maghrib, 
    super.sunset, 
    super.isha, 
    super.midnight,
  });

  OffsetDto.fromJson(dynamic json) {
    imsak = json['Imsak'];
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    sunset = json['Sunset'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }
 
}

class MethodDto  extends MethodEntity{
  MethodDto({
    super.id, 
    super.name, 
    super.params, 
    super.location,
  });

  MethodDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? ParamsDto.fromJson(json['params']) : null;
    location = json['location'] != null ? LocationDto.fromJson(json['location']) : null;
  }


 
}

class LocationDto extends LocationEntity {
  LocationDto({
    super.latitude, 
    super.longitude,
  });

  LocationDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

}

class ParamsDto extends ParamsEntity {
  ParamsDto({
    super.fajr, 
    super.isha,
  });

  ParamsDto.fromJson(dynamic json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }
 
}

class DateDto extends DateEntity {
  DateDto({
    super.readable, 
    super.timestamp, 
    super.hijri, 
    super.gregorian,
  });

  DateDto.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? HijriDto.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null ? GregorianDto.fromJson(json['gregorian']) : null;
  }
 
}

class GregorianDto extends GregorianEntity{
  GregorianDto({
    super.date, 
    super.format, 
    super.day, 
    super.weekday, 
    super.month, 
    super.year, 
    super.designation, 
    super.lunarSighting,
  });

  GregorianDto.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null ? WeekdayDto.fromJson(json['weekday']) : null;
    month = json['month'] != null ? MonthDto.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null ? DesignationDto.fromJson(json['designation']) : null;
    lunarSighting = json['lunarSighting'];
  }
 
}

class DesignationDto extends DesignationEntity {
  DesignationDto({
    super.abbreviated, 
    super.expanded,
  });

  DesignationDto.fromJson(dynamic json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }
 
}

class MonthDto extends MonthEntity {
  MonthDto({
    super.number, 
    super.en,
  });

  MonthDto.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
  }

}

class WeekdayDto extends WeekdayEntity  {
  WeekdayDto({
    super.en,
  });

  WeekdayDto.fromJson(dynamic json) {
    en = json['en'];
  }


}

class HijriDto extends HijriEntity {
  HijriDto({
    super.date, 
    super.format, 
    super.day, 
    super.weekday, 
    super.month, 
    super.year, 
    super.holidays
  });

  HijriDto.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null ? WeekdayDto.fromJson(json['weekday']) : null;
    month = json['month'] != null ? MonthDto.fromJson(json['month']) : null;
    year = json['year'];
    holidays = json['holidays'] != null ? List<String>.from(json['holidays']) : [];
  }
  
}
