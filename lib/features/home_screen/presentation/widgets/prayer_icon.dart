import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:intl/intl.dart'; 

class PrayerIcon extends StatelessWidget {
  String text;
  String time;
  String image;

  PrayerIcon({required this.text, required this.time, required this.image});

  String convertToArabicNumbers(String time) {
    return time.split('').map((e) {
      switch (e) {
        case '0':
          return '٠';
        case '1':
          return '١';
        case '2':
          return '٢';
        case '3':
          return '٣';
        case '4':
          return '٤';
        case '5':
          return '٥';
        case '6':
          return '٦';
        case '7':
          return '٧';
        case '8':
          return '٨';
        case '9':
          return '٩';
        default:
          return e;
      }
    }).join('');
  }

  String convertTo12HourFormat(String time24) {
    try {
      final DateFormat inputFormat = DateFormat("HH:mm");
      final DateFormat outputFormat = DateFormat("hh:mm");

      DateTime dateTime = inputFormat.parse(time24);
      String formattedTime = outputFormat.format(dateTime);

      return formattedTime;
    } catch (e) {
      return time24;
    }
  }

  @override
  Widget build(BuildContext context) {
    String convertedTime = convertTo12HourFormat(time);

    String arabicTime = convertToArabicNumbers(convertedTime);

    return Container(
      margin: EdgeInsets.all(2),
      height: 100.h,
      width: 57.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(141, 33, 33, 33),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ColorManager.primary,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 40.h, width: double.infinity, child: Image.asset(image)),
          Text(
            text,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            arabicTime,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
