/// code : 200
/// status : "OK"
/// data : {"timings":{"Fajr":"05:15"},"date":{"readable":"12 Feb 2025","timestamp":"1739336400",
/// "hijri":{"date":"13-08-1446","format":"DD-MM-YYYY","day":"13","weekday":{"en":"Al Arba'a","ar":"الاربعاء"},
/// "month":{"number":8,"en":"Shaʿbān","ar":"شَعْبان","days":29},"year":"1446","designation":{"abbreviated":"AH",
/// "expanded":"Anno Hegirae"},"holidays":[],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"12-02-2025","format":"DD-MM-YYYY","day":"12","weekday":{"en":"Wednesday"},"month":{"number":2,"en":"February"},"year":"2025","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}},"meta":{"latitude":31.2156,"longitude":29.9553,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}}

class NextPrayerResponseEntity {
  NextPrayerResponseEntity({
    this.code,
    this.status,
    this.data,
  });

  NextPrayerResponseEntity.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null
        ? DataEntityNextPrayerTime.fromJson(json['data'])
        : null;
  }
  num? code;
  String? status;
  DataEntityNextPrayerTime? data;
}

/// timings : {"Fajr":"05:15"}
/// date : {"readable":"12 Feb 2025","timestamp":"1739336400","hijri":{"date":"13-08-1446","format":"DD-MM-YYYY","day":"13","weekday":{"en":"Al Arba'a","ar":"الاربعاء"},"month":{"number":8,"en":"Shaʿbān","ar":"شَعْبان","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":[],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"12-02-2025","format":"DD-MM-YYYY","day":"12","weekday":{"en":"Wednesday"},"month":{"number":2,"en":"February"},"year":"2025","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}}
/// meta : {"latitude":31.2156,"longitude":29.9553,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}

class DataEntityNextPrayerTime {
  DataEntityNextPrayerTime({
    this.date,
    this.meta,
  });

  DataEntityNextPrayerTime.fromJson(dynamic json) {
    date = json['date'] != null ? DateEntity.fromJson(json['date']) : null;
    meta = json['meta'] != null ? MetaEntity.fromJson(json['meta']) : null;
  }
  DateEntity? date;
  MetaEntity? meta;
}

/// latitude : 31.2156
/// longitude : 29.9553
/// timezone : "Africa/Cairo"
/// method : {"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}}
/// latitudeAdjustmentMethod : "ANGLE_BASED"
/// midnightMode : "STANDARD"
/// school : "STANDARD"
/// offset : {"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}

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

  MetaEntity.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method =
        json['method'] != null ? MethodEntity.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset =
        json['offset'] != null ? OffsetEntity.fromJson(json['offset']) : null;
  }
  num? latitude;
  num? longitude;
  String? timezone;
  MethodEntity? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  OffsetEntity? offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['timezone'] = timezone;
    if (method != null) {
      map['method'] = method?.toJson();
    }
    map['latitudeAdjustmentMethod'] = latitudeAdjustmentMethod;
    map['midnightMode'] = midnightMode;
    map['school'] = school;
    if (offset != null) {
      map['offset'] = offset?.toJson();
    }
    return map;
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

  OffsetEntity.fromJson(dynamic json) {
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
  num? imsak;
  num? fajr;
  num? sunrise;
  num? dhuhr;
  num? asr;
  num? maghrib;
  num? sunset;
  num? isha;
  num? midnight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Imsak'] = imsak;
    map['Fajr'] = fajr;
    map['Sunrise'] = sunrise;
    map['Dhuhr'] = dhuhr;
    map['Asr'] = asr;
    map['Maghrib'] = maghrib;
    map['Sunset'] = sunset;
    map['Isha'] = isha;
    map['Midnight'] = midnight;
    return map;
  }
}

/// id : 5
/// name : "Egyptian General Authority of Survey"
/// params : {"Fajr":19.5,"Isha":17.5}
/// location : {"latitude":30.0444196,"longitude":31.2357116}

class MethodEntity {
  MethodEntity({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  MethodEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    params =
        json['params'] != null ? ParamsEntity.fromJson(json['params']) : null;
    location = json['location'] != null
        ? LocationEntity.fromJson(json['location'])
        : null;
  }
  num? id;
  String? name;
  ParamsEntity? params;
  LocationEntity? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }
}

/// latitude : 30.0444196
/// longitude : 31.2357116

class LocationEntity {
  LocationEntity({
    this.latitude,
    this.longitude,
  });

  LocationEntity.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  num? latitude;
  num? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}

/// Fajr : 19.5
/// Isha : 17.5

class ParamsEntity {
  ParamsEntity({
    this.fajr,
    this.isha,
  });

  ParamsEntity.fromJson(dynamic json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }
  num? fajr;
  num? isha;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fajr'] = fajr;
    map['Isha'] = isha;
    return map;
  }
}

/// readable : "12 Feb 2025"
/// timestamp : "1739336400"
/// hijri : {"date":"13-08-1446","format":"DD-MM-YYYY","day":"13","weekday":{"en":"Al Arba'a","ar":"الاربعاء"},"month":{"number":8,"en":"Shaʿbān","ar":"شَعْبان","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":[],"adjustedHolidays":[],"method":"HJCoSA"}
/// gregorian : {"date":"12-02-2025","format":"DD-MM-YYYY","day":"12","weekday":{"en":"Wednesday"},"month":{"number":2,"en":"February"},"year":"2025","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}

class DateEntity {
  DateEntity({
    this.readable,
    this.timestamp,
    this.gregorian,
  });

  DateEntity.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    gregorian = json['gregorian'] != null
        ? GregorianEntity.fromJson(json['gregorian'])
        : null;
  }
  String? readable;
  String? timestamp;
  GregorianEntity? gregorian;
}

/// date : "12-02-2025"
/// format : "DD-MM-YYYY"
/// day : "12"
/// weekday : {"en":"Wednesday"}
/// month : {"number":2,"en":"February"}
/// year : "2025"
/// designation : {"abbreviated":"AD","expanded":"Anno Domini"}
/// lunarSighting : false

class GregorianEntity {
  GregorianEntity({
    this.date,
    this.format,
    this.day,
    this.year,
    this.lunarSighting,
  });

  GregorianEntity.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    year = json['year'];
    lunarSighting = json['lunarSighting'];
  }
  String? date;
  String? format;
  String? day;
  String? year;
  bool? lunarSighting;
}

/// abbreviated : "AD"
/// expanded : "Anno Domini"
