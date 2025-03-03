import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/Radio_screen/presentation/blocs/cubit/radio_cubit.dart';

class RadioWidget extends StatelessWidget {
  final String name;
  final String url;

  const RadioWidget({required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        bool isPlaying = false;

        if (state is RadioLoadedState) {
          isPlaying = state.playingUrl == url;
        }

        return Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(20),
          height: 141.h,
          width: 320.w,
          decoration: BoxDecoration(
            color: ColorManager.logo,
            border: Border.all(
              color: ColorManager.primary,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/Mosque-down.png',
                      width: 320.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name, overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                          style: TextStyle(fontSize: 25, fontFamily: 'QuranHadith')),
                      SizedBox(height: 25.w),
                      GestureDetector(
                        onTap: () => context.read<RadioCubit>().toggleRadio(url),
                        child: Image.asset(
                          isPlaying
                              ? 'assets/images/pause.png'
                              : 'assets/images/play.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
