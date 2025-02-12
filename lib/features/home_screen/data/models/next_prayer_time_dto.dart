import 'package:islami/features/home_screen/domain/entities/next_prayer_response_entity.dart';

/// code : 200
/// status : "OK"
/// data : {"timings":{"Fajr":"05:15"},"date":{"readable":"12 Feb 2025","timestamp":"1739336400","hijri":{"date":"13-08-1446","format":"DD-MM-YYYY","day":"13","weekday":{"en":"Al Arba'a","ar":"الاربعاء"},"month":{"number":8,"en":"Shaʿbān","ar":"شَعْبان","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":[],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"12-02-2025","format":"DD-MM-YYYY","day":"12","weekday":{"en":"Wednesday"},"month":{"number":2,"en":"February"},"year":"2025","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}},"meta":{"latitude":31.2156,"longitude":29.9553,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}}

class NextPrayerResponseDto extends NextPrayerResponseEntity {
  NextPrayerResponseDto({
    super.code,
    super.status,
    super.data,
  });

  NextPrayerResponseDto.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? DataDtoNextPrayerTime.fromJson(json['data']) : null;
  }
}

/// timings : {"Fajr":"05:15"}
/// date : {"readable":"12 Feb 2025","timestamp":"1739336400","hijri":{"date":"13-08-1446","format":"DD-MM-YYYY","day":"13","weekday":{"en":"Al Arba'a","ar":"الاربعاء"},"month":{"number":8,"en":"Shaʿbān","ar":"شَعْبان","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":[],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"12-02-2025","format":"DD-MM-YYYY","day":"12","weekday":{"en":"Wednesday"},"month":{"number":2,"en":"February"},"year":"2025","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}}
/// meta : {"latitude":31.2156,"longitude":29.9553,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}

class DataDtoNextPrayerTime extends DataEntityNextPrayerTime {
  DataDtoNextPrayerTime({
    super.date,
    super.meta,
  });

  DataDtoNextPrayerTime.fromJson(dynamic json) {
    date = json['date'] != null ? DateDto.fromJson(json['date']) : null;
    meta = json['meta'] != null ? MetaDto.fromJson(json['meta']) : null;
  }
}

/// latitude : 31.2156
/// longitude : 29.9553
/// timezone : "Africa/Cairo"
/// method : {"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}}
/// latitudeAdjustmentMethod : "ANGLE_BASED"
/// midnightMode : "STANDARD"
/// school : "STANDARD"
/// offset : {"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}

class MetaDto extends MetaEntity {
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

/// Imsak : 0
/// Fajr : 0
/// Sunrise : 0
/// Dhuhr : 0
/// Asr : 0
/// Maghrib : 0
/// Sunset : 0
/// Isha : 0
/// Midnight : 0

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

/// id : 5
/// name : "Egyptian General Authority of Survey"
/// params : {"Fajr":19.5,"Isha":17.5}
/// location : {"latitude":30.0444196,"longitude":31.2357116}

class MethodDto extends MethodEntity {
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
    location = json['location'] != null
        ? LocationDto.fromJson(json['location'])
        : null;
  }
}

/// latitude : 30.0444196
/// longitude : 31.2357116

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

/// Fajr : 19.5
/// Isha : 17.5

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

/// readable : "12 Feb 2025"
/// timestamp : "1739336400"
/// hijri : {"date":"13-08-1446","format":"DD-MM-YYYY","day":"13","weekday":{"en":"Al Arba'a","ar":"الاربعاء"},"month":{"number":8,"en":"Shaʿbān","ar":"شَعْبان","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":[],"adjustedHolidays":[],"method":"HJCoSA"}
/// gregorian : {"date":"12-02-2025","format":"DD-MM-YYYY","day":"12","weekday":{"en":"Wednesday"},"month":{"number":2,"en":"February"},"year":"2025","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}

class DateDto extends DateEntity {
  DateDto({
    super.readable,
    super.timestamp,
    super.gregorian,
  });

  DateDto.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = json['gregorian'] != null
        ? GregorianDto.fromJson(json['gregorian'])
        : null;
  }
}

/// date : "12-02-2025"
/// format : "DD-MM-YYYY"
/// day : "12"
/// weekday : {"en":"Wednesday"}
/// month : {"number":2,"en":"February"}
/// year : "2025"
/// designation : {"abbreviated":"AD","expanded":"Anno Domini"}
/// lunarSighting : false

class GregorianDto extends GregorianEntity {
  GregorianDto({
    super.date,
    super.format,
    super.day,
    super.year,
    super.lunarSighting,
  });

  GregorianDto.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    year = json['year'];
    lunarSighting = json['lunarSighting'];
  }
}

/// abbreviated : "AD"
/// expanded : "Anno Domini"
