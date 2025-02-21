import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/quran_screen/presentation/blocs/cubit/quran_cubit.dart';

class QuranDetailsScreen extends StatelessWidget {
  final String title;
  QuranDetailsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    final quranCubit = QuranCubit.get(context);
    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.primary),
        title: Text(
          title,
          style: TextStyle(color: ColorManager.primary),
        ),
        backgroundColor: ColorManager.black,
      ),
      body: Stack(
        children: [
          Positioned(left: 10.w, child: Image.asset('assets/images/mask1.png')),
          Positioned(right: 10.w, child: Image.asset('assets/images/mask2.png')),
          Positioned(
              bottom: 0.h,
              right: 0.w,
              left: 1.w,
              child: SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: Image.asset('assets/images/Mosque-down.png',
                      fit: BoxFit.cover))),
          BlocBuilder<QuranCubit, List<String>>(
            builder: (context, verses) {
              if (verses.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: ListView.builder(
                  itemCount: quranCubit.verses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: ColorManager.primary),
                          color: ColorManager.black.withOpacity(0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              convertToArabicNumber(index + 1), // تحويل الرقم للعربي
                              style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                quranCubit.verses[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// دالة لتحويل الأرقام إلى العربية
  String convertToArabicNumber(int number) {
    final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.toString().split('').map((e) => arabicNumbers[int.parse(e)]).join();
  }
}
