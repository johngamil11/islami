import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/core/utils/image_assets.dart';
import 'package:islami/features/Hadith_screen/data/data_sources/local_data_source.dart';
import 'package:islami/features/Hadith_screen/data/repositories_impl/hadith_repository_imp.dart';
import 'package:islami/features/Hadith_screen/presentation/blocs/cubit/hadith_cubit.dart';
import 'package:islami/features/Hadith_screen/presentation/widgets/hadith_view.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/images/hadith background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'الحديث',
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
          body: BlocBuilder<HadithCubit, HadithState>(
            builder: (context, state) {
              if(state is HadithLoaded){
                 return Column(
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
                    SizedBox(height: 25.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 1 ,childAspectRatio: 6/3 , crossAxisSpacing: 10 , mainAxisSpacing: 10),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(10),

                        itemCount: state.hadith.length,
                        itemBuilder: (context, index){
                         return HadithView( title: state.hadith[index].split("\n").first , content: state.hadith[index].split('\n').skip(1).join('\n'),);
                        }),
                    ),
                    ],
                );
              
              } else {
                return Container();
              }
    
               
              }
           
          ),
        ),
      ],
    );
  

  }
}
