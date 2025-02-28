import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/azkar_screen/presentation/blocs/cubit/azkar_cubit.dart';

class AzkarDetailsScreen extends StatelessWidget {
  final String title;

  AzkarDetailsScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/azkarr.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: ColorManager.primary),
                title: Text(
                  title,
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontFamily: 'QuranHadith',
                  ),
                ),
              ),

              Expanded(
                child: BlocBuilder<AzkarCubit, AzkarState>(
                  builder: (context, state) {
                    if (state is AzkarLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AzkarLoaded) {
                      return Padding(
                        padding: EdgeInsets.all(16.w),
                        child: ListView.builder(
                          itemCount: state.azkar.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: ColorManager.black.withOpacity(0.5),
                              child: Padding(
                                padding: EdgeInsets.all(12.w),
                                child: Text(
                                  state.azkar[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: 'QuranHadith',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          
                          },
                        ),
                      );
                    } else if (state is AzkarError) {
                      return Center(
                        child: Text(
                          "حدث خطأ أثناء تحميل الأذكار!",
                          style: TextStyle(color: Colors.red, fontSize: 18.sp),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
