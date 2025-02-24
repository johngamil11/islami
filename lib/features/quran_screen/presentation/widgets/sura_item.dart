import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';

class SuraItem extends StatelessWidget {
  final String suraName;
  final int number;
  final int verseCount; // عدد الآيات للسورة


  SuraItem({required this.suraName, required this.number , required this.verseCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w), // تباعد داخلي
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start, // لجعل العناصر تبدأ من اليمين
            children: [
              Expanded( // يجعل النصوص تأخذ مساحة مناسبة
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // توسيط النص
                  children: [
                    Text(
                      suraName,
                      style: TextStyle(
                        color: ColorManager.white,
                      fontFamily: 'QuranHadith',

                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "${convertToArabicNumber(verseCount)} آيات",
                      style: TextStyle(
                        color: ColorManager.white,
                        
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.w), // تباعد بين النص والعلامة
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Sura Number.png', width: 50.w, height: 50.h),
                  Positioned(
                    child: Text(
                      convertToArabicNumber(number),
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            color: ColorManager.primary,
            width: double.infinity,
            height: 2.h,
          ),
        ],
      ),
    );
  }

  String convertToArabicNumber(int number) {
    final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.toString().split('').map((e) => arabicNumbers[int.parse(e)]).join();
  }
}
