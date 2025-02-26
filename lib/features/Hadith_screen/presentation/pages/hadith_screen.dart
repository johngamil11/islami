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
                    // Expanded(
                    //   child: GridView.builder(
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                    //     (crossAxisCount: 1 ,childAspectRatio: 6/3 , crossAxisSpacing: 10 , mainAxisSpacing: 10),
                    //     scrollDirection: Axis.horizontal,
                    //     padding: EdgeInsets.all(10),

                    //     itemCount: 20,
                    //     itemBuilder: (context, index){
                    //      return HadithView();
                    //     }),
                    // ),
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
  
    // return BlocProvider(
    //   create: (context) => HadithCubit(HadithRepositoryImp(localDataSource: LocalDataSource()  )),
    //   child: Stack(
    //     children: [
    //       Opacity(
    //         opacity: 0.3,
    //         child: Image.asset(
    //           'assets/images/quran_background.png',
    //           fit: BoxFit.cover,
    //           height: double.infinity,
    //           width: double.infinity,
    //         ),
    //       ),
    //       Scaffold(
    //         backgroundColor: Colors.transparent,
    //         appBar: AppBar(
    //           title: Text(
    //             'الحديث',
    //             style: TextStyle(
    //               color: ColorManager.logo,
    //               fontFamily: 'QuranHadith',
    //               fontSize: 18.sp,
    //             ),
    //           ),
    //           centerTitle: true,
    //           iconTheme: IconThemeData(color: ColorManager.logo),
    //           backgroundColor: Colors.transparent,
    //         ),
    //         body: BlocBuilder<HadithCubit, HadithState>(
    //           builder: (context, state) {
    //             if (state is HadithLoading) {
    //               return const Center(child: CircularProgressIndicator());
    //             } else if (state is HadithError) {
    //               return Center(child: Text(state.message));
    //             } else if (state is HadithLoaded) {
    //               final cubit = context.read<HadithCubit>();

    //               return Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Center(
    //                     child: Container(
    //                       width: 200.w,
    //                       height: 80.h,
    //                       child: Image.asset(
    //                         ImageAssets.logo,
    //                         fit: BoxFit.fitWidth,
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 10.h),
    //                   SizedBox(
    //                     height: 450.h,
    //                     width: 450.w,
    //                     child: PageView.builder(
    //                       controller: cubit.pageController,
    //                       itemCount: cubit.hadiths.length + 2,
    //                       scrollDirection: Axis.horizontal,
    //                       onPageChanged: cubit.onPageChanged,
    //                       itemBuilder: (context, index) {
    //                         final realIndex = cubit.getRealIndex(index);
    //                         final difference = (cubit.currentPage - index).abs();
    //                         final scale = lerpDouble(0.9, 1.0, (1 - difference).clamp(0, 1))!;
    //                         final opacity = lerpDouble(0.5, 1, (1 - difference).clamp(0, 1))!;
    //                         final borderRadius = lerpDouble(10, 15, (1 - difference).clamp(0, 1))!;

    //                         return Transform.scale(
    //                           scale: scale,
    //                           child: Opacity(
    //                             opacity: opacity,
    //                             child: Padding(
    //                               padding: EdgeInsets.symmetric(horizontal: 1.w),
    //                               child: ClipRRect(
    //                                 borderRadius: BorderRadius.circular(borderRadius),
    //                                 child: Container(
    //                                   width: 300.w,
    //                                   height: 200.h,
    //                                   decoration: BoxDecoration(
    //                                     color: ColorManager.logo,
    //                                     borderRadius: BorderRadius.circular(borderRadius),
    //                                     border: Border.all(
    //                                       color: ColorManager.black,
    //                                       width: 0.5,
    //                                     ),
    //                                     boxShadow: [
    //                                       if (difference < 0.5)
    //                                         BoxShadow(
    //                                           color: Colors.black.withOpacity(0.1),
    //                                           blurRadius: 4,
    //                                           spreadRadius: 0.5,
    //                                         ),
    //                                     ],
    //                                   ),
    //                                   child: Padding(
    //                                     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
    //                                     child: Column(
    //                                       crossAxisAlignment: CrossAxisAlignment.center,
    //                                       children: [
    //                                         // Text(
    //                                         //   'الحديث رقم ${realIndex + 1}',
    //                                         //   style: TextStyle(
    //                                         //     color: ColorManager.black,
    //                                         //     fontSize: 14.sp,
    //                                         //     fontWeight: FontWeight.bold,
    //                                         //   ),
    //                                         // ),
    //                                         // Divider(color: ColorManager.black, thickness: 0.8),
    //                                         // SizedBox(height: 2.h),
    //                                         Expanded(
    //                                           child: Text(
    //                                             cubit.hadiths[realIndex],
    //                                              // عرض الحديث الفعلي
    //                                             textAlign: TextAlign.center,
    //                                             style: TextStyle(
    //                                               color: ColorManager.black,
    //                                               fontSize: 11.sp,
    //                                               height: 1.3,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                 ],
    //               );
    //             }
    //             return Container();
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  
  }
}
