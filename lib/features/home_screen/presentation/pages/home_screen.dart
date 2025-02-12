import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/core/utils/image_assets.dart';
import 'package:islami/features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart';
import 'package:islami/features/home_screen/presentation/widgets/icon_view.dart';
import 'package:islami/features/home_screen/presentation/widgets/prayer_time.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit.get(context)..getPrayerTime()..getNextPrayerTime(),
      child: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                ImageAssets.mosqueBackGround,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Container(child: Image.asset(ImageAssets.logo))),
                  PrayerTime(), // widget of the bloc

                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconView(
                          text: 'سبحة',
                          image: 'assets/images/sebha.png',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconView(
                          text: 'حديث',
                          image: 'assets/images/hadith.png',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconView(
                          text: 'قران',
                          image: 'assets/images/quran.png',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconView(
                          text: 'القبلة',
                          image: 'assets/images/kaaba.png',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconView(
                          text: 'الاذكار',
                          image: 'assets/images/azkar.png',
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconView(
                          text: 'راديو',
                          image: 'assets/images/radio.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
