/// code : 200
/// status : "OK"
/// data : {"latitude":31.2001,"longitude":29.9187,"direction":135.436957441117}

class QiblahResponseEntity {
  QiblahResponseEntity({
      this.code, 
      this.status, 
      this.data,});


  num? code;
  String? status;
  DataEntity? data;



}

/// latitude : 31.2001
/// longitude : 29.9187
/// direction : 135.436957441117

class DataEntity {
  DataEntity({
      this.latitude, 
      this.longitude, 
      this.direction,});

  num? latitude;
  num? longitude;
  num? direction;


}