import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/arabic_function.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/sebha_screen/presentation/blocs/cubit/sebha_cubit.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SebhaCubit(),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/sebha_background.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'السبحة',
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
              body: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Image.asset('assets/images/Logo.png')),
                    Text(
                      'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                      style: TextStyle(
                          color: ColorManager.white,
                          fontFamily: 'NoorHuda',
                          fontSize: 45),
                    ),
                    BlocBuilder<SebhaCubit, SebhaState>(
                      builder: (context, state) {
                       final cubit = context.read<SebhaCubit>();

                        return Container(
                          height: 370.h,
                          width: 300.w,
                          // color: ColorManager.primary,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Positioned(
                                  top: 0.h,
                                  right: 88.w,
                                  child:
                                      Image.asset('assets/images/sebha 1.png')),
                              Positioned(
                                  top: 50.h,
                                  child: GestureDetector(
                                onTap: () {
                                  context.read<SebhaCubit>().rotateSebha();
                                },
                                
                                    child: AnimatedRotation(
                                      turns: state.angle / (2 * pi),
                                      duration: Duration(milliseconds:200 ),
                                      child: Image.asset(
                                        'assets/images/Sebha 2.png',
                                        height: 300.h,
                                        width: 300.w,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  )),
                              Text(
                               cubit.currentPhrase ,
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontFamily: 'NoorHuda',
                                    fontSize: 50),
                              ),
                              Positioned(
                                top: 200.h,
                                child: Text(
                                 ArabicFunction.convertToArabicNumber(state.counter),
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      // fontFamily: 'NoorHuda',
                                      fontSize: 50),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
