import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';

class AzkarIcon extends StatelessWidget {
  final String title;
  final String title2;

  AzkarIcon({required this.title, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.all(5.w),
      height: 120.h,
      width: 165.w,
      decoration: BoxDecoration(
        color: const Color.fromARGB(146, 33, 33, 33),
        border: Border.all(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/mandla.png',
       
          ),
          Expanded(
            child: Text(
              '$title\n$title2',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 19.sp,
                fontFamily: "QuranHadith",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
