import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';

class PrayerIcon extends StatelessWidget {
  const PrayerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.all(2),
      height: 90.h,
      width: 57.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(141, 33, 33, 33),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: ColorManager.primary,
      )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('الفجر' , style: TextStyle(color: ColorManager.white , fontSize: 14 , decoration: TextDecoration.none,)),
          Text('05:09' , style: TextStyle(color: ColorManager.white , fontSize: 14 , decoration: TextDecoration.none,)),
        ],
      ),
     );
  }
}