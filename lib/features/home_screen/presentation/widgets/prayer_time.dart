import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart';
import 'package:islami/features/home_screen/presentation/widgets/prayer_icon.dart';

class PrayerTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      bloc:
       BlocProvider.of<HomeScreenCubit>(context)..getPrayerTime(),
         buildWhen: (previous, current) => previous != current, // يمنع إعادة البناء إذا لم تتغير البيانات
      builder: (context, state) {
        if(state is HomeScreenLoading){
          return Center(child: CircularProgressIndicator(color: ColorManager.primary,));
        }
        else if (state is HomeScreenLoaded) {
            final cubit = HomeScreenCubit.get(context);

          String gregorianDay = convertNumberToArabic(state.prayerTime!.date!.gregorian!.day.toString());
          String gregorianYear = convertNumberToArabic(state.prayerTime!.date!.gregorian!.year.toString());
          String gregorianMonth = monthsArabic[state.prayerTime!.date!.gregorian!.month!.en] ?? '';

          String hijriDay = convertNumberToArabic(state.prayerTime!.date!.hijri!.day.toString());
          String hijriYear = convertNumberToArabic(state.prayerTime!.date!.hijri!.year.toString());
          String hijriMonth = state.prayerTime!.date!.hijri!.month!.ar ?? '';

          return Container(
            width: 320.w,
            height: 280.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: ColorManager.primary,
                  width: 4,
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ColorManager.primary,
                          ),
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Image.asset('assets/images/circle.png'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cubit.nextPrayerName ??'',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'بعد',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                  cubit.timeRemaining ?? '',
                                style: TextStyle(
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: ColorManager.primary,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                               "$gregorianDay $gregorianMonth $gregorianYear م",

                                  style: TextStyle(
                                      color: ColorManager.white,
                                      decoration: TextDecoration.none,
                                      fontSize: 16),
                                ),
                                Text(
                                "$hijriDay $hijriMonth $hijriYear هـ",
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      decoration: TextDecoration.none,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: ColorManager.primary,
                                )),
                            child: Text(
                              " الشروق : ${ convertNumberToArabic(state.prayerTime!.timings!.sunrise ??'')}",
                              style: TextStyle(
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),

                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrayerIcon(
                      image: 'assets/images/isha.png',
                      text: 'العشاء',
                      time: state.prayerTime!.timings!.isha ?? '',
                    ),
                    PrayerIcon(
                      image: 'assets/images/maghrib.png',
                      text: 'المغرب',
                      time: 
                      state.prayerTime!.timings!.maghrib ?? ''
                    ),
                    PrayerIcon(
                      image: 'assets/images/asr.png',
                      text: 'العصر',
                      time: state.prayerTime!.timings!.asr ?? '',
                    ),
                    PrayerIcon(
                      image: 'assets/images/dohor.png',
                      text: 'الظهر',
                      time: state.prayerTime!.timings!.dhuhr ?? '',
                    ),
                    PrayerIcon(
                      image: 'assets/images/fajr.png',
                      text: 'الفجر',
                      time: state.prayerTime!.timings!.fajr ?? '',
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Container(
          color: Colors.amber,
        );
      },
    ); 
  }
    final Map<String, String> monthsArabic = {
    "January": "يناير",
    "February": "فبراير",
    "March": "مارس",
    "April": "أبريل",
    "May": "مايو",
    "June": "يونيو",
    "July": "يوليو",
    "August": "أغسطس",
    "September": "سبتمبر",
    "October": "أكتوبر",
    "November": "نوفمبر",
    "December": "ديسمبر",
  };

    String convertNumberToArabic(String number) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number.split('').map((char) {
      if (RegExp(r'\d').hasMatch(char)) {
        return arabicNumbers[int.parse(char)];
      }
      return char;
    }).join();
  }

}
