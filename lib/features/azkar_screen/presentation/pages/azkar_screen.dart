import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/core/utils/image_assets.dart';
import 'package:islami/features/azkar_screen/presentation/widgets/azkar_model.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/images/azkarr.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'الاذكار',
              style: TextStyle(
                color: ColorManager.logo,
                fontFamily: 'QuranHadith',
                fontSize: 18.sp,
              ),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: ColorManager.logo),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 200.w,
                    height: 80.h,
                    child: Image.asset(
                      ImageAssets.logo,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
               AzkarModel(fileNameOne: 'azkar_elmasaa', appBarNameOne: 'اذكار المساء',
                titleNameOnePartOne: 'اذكار', titleNameOnePartTwo: 'المساء',
                 fileNameTwo: 'azkar_elsabah', appBarNameTwo: 'اذكار الصباح',
                  titleNameTwoPartOne: 'اذكار', titleNameTwoPartTwo: 'الصباح'),
                             SizedBox(height: 10.h),
               AzkarModel(fileNameOne: 'تسابيح', appBarNameOne: 'تسابيح ',
                titleNameOnePartOne: 'تسابيح', titleNameOnePartTwo: '',
                 fileNameTwo: 'اذكار بعد الصلاة', appBarNameTwo: 'اذكار بعد الصلاة ',
                  titleNameTwoPartOne: 'اذكار', titleNameTwoPartTwo: 'بعد الصلاة'),
               
                SizedBox(height: 10.h),
                     
               AzkarModel(fileNameOne: 'اذكار الاستيقاظ', appBarNameOne: 'اذكار الاستيقاظ ',
                titleNameOnePartOne: 'اذكار', titleNameOnePartTwo: 'الاستيقاظ' ,
                 fileNameTwo: 'اذكار النوم', appBarNameTwo: 'اذكار النوم',
                  titleNameTwoPartOne: 'اذكار', titleNameTwoPartTwo: 'النوم'),
                SizedBox(height: 10.h),
                     
               AzkarModel(fileNameOne: 'جوامع الدعاء', appBarNameOne: 'جوامع الدعاء',
                titleNameOnePartOne: 'جوامع', titleNameOnePartTwo: 'الدعاء' ,
                 fileNameTwo: 'ادعية الصلاة', appBarNameTwo: 'ادعية الصلاة',
                  titleNameTwoPartOne: 'ادعية', titleNameTwoPartTwo: 'الصلاة'),
            
                SizedBox(height: 10.h),
                     
               AzkarModel(fileNameOne: 'ادعية نبوية', appBarNameOne: 'ادعية نبوية',
                titleNameOnePartOne: 'ادعية', titleNameOnePartTwo: 'نبوية' ,
                 fileNameTwo: 'ادعية قرأنية', appBarNameTwo: 'ادعية قرأنية',
                  titleNameTwoPartOne: 'ادعية', titleNameTwoPartTwo: 'قرأنية'),
            
              
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: 'اذكار متفرقة', appBarNameOne: 'اذكار متفرقة',
                titleNameOnePartOne: 'اذكار', titleNameOnePartTwo: 'متفرقة' ,
                 fileNameTwo: 'ادعية الانبياء', appBarNameTwo: 'ادعية الانبياء',
                  titleNameTwoPartOne: 'ادعية', titleNameTwoPartTwo: 'الانبياء'),
            
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: 'اذكار الاذان', appBarNameOne: 'اذكار الاذان',
                titleNameOnePartOne: 'اذكار', titleNameOnePartTwo: 'الاذان' ,
                 fileNameTwo: 'اذكار المسجد', appBarNameTwo: 'اذكار المسجد',
                  titleNameTwoPartOne: 'اذكار', titleNameTwoPartTwo: 'المسجد'),
            
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: 'اذكار الوضوء', appBarNameOne: 'اذكار الوضوء',
                titleNameOnePartOne: 'اذكار', titleNameOnePartTwo: 'الوضوء' ,
                 fileNameTwo: 'اذكار المنزل', appBarNameTwo: 'اذكار المنزل',
                  titleNameTwoPartOne: 'اذكار', titleNameTwoPartTwo: 'المنزل'),
            
              
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: "اذكار_الطعام_والشراب", appBarNameOne: 'اذكار الطعام والشراب',
                titleNameOnePartOne: 'اذكار', titleNameOnePartTwo: 'الطعام \n والشراب' ,
                 fileNameTwo: "اذكار_الحج_والعمرة", appBarNameTwo: 'اذكار الحج والعمرة',
                  titleNameTwoPartOne: 'اذكار', titleNameTwoPartTwo:  'الحج \n والعمرة'),
            
              
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: "ختم القران الكريم", appBarNameOne: "ختم القران الكريم",
                titleNameOnePartOne: 'ختم', titleNameOnePartTwo: 'القران \n الكريم' ,
                 fileNameTwo: "فضل الدعاء", appBarNameTwo: "فضل الدعاء",
                  titleNameTwoPartOne: 'فضل', titleNameTwoPartTwo:  "الدعاء"),
            
              
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: "فضل السور", appBarNameOne: "فضل السور",
                titleNameOnePartOne: 'فضل', titleNameOnePartTwo: 'السور ',
                 fileNameTwo: "فضل الذكر", appBarNameTwo: "فضل الذكر",
                  titleNameTwoPartOne: 'فضل', titleNameTwoPartTwo:  "الذكر"),
            
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: "فضل القران", appBarNameOne: "فضل القران",
                titleNameOnePartOne: 'فضل', titleNameOnePartTwo: 'القران ',
                  fileNameTwo: "اسماء الله الحسنى", appBarNameTwo: "اسماء الله الحسنى",
                  titleNameTwoPartOne: 'اسماء', titleNameTwoPartTwo:  'الله \n الحسنى'),
            
                SizedBox(height: 10.h),
               AzkarModel(fileNameOne: "ادعية للميت", appBarNameOne: "ادعية للميت",
                titleNameOnePartOne: 'ادعية', titleNameOnePartTwo: 'للميت ',
                  fileNameTwo: "الرقية الشرعية", appBarNameTwo: "الرقية الشرعية",
                  titleNameTwoPartOne: 'الرقية', titleNameTwoPartTwo:  "الشرعية"),
            
              
              ],
            ),
          ),
        ),
      ],
    );
  }
}
