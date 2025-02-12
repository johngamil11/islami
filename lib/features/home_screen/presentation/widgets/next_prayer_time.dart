import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart';

class NextPrayerTime extends StatelessWidget {
  const NextPrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        print("Current state:::::::::: $state");
        if (state is NextPrayerTimeLoading) {
          return CircularProgressIndicator();
        } else if (state is NextPrayerTimeLoaded) {
          return Container(
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
                    'المغرب',
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
                    '04:15:07',
                    style: TextStyle(
                      color: ColorManager.white,
                      decoration: TextDecoration.none,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ]),
          );
        } else {
          return Container(child: Text( 'no'),);
        }
      },
    );
  }
}
