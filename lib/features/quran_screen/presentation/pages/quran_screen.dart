import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/core/utils/image_assets.dart';
import 'package:islami/features/quran_screen/presentation/blocs/cubit/quran_cubit.dart';
import 'package:islami/features/quran_screen/presentation/pages/quran_details_screen.dart';
import 'package:islami/features/quran_screen/presentation/widgets/sura_item.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Opacity(
        opacity: 0.3,
        child: Image.asset(
          'assets/images/quran_background.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'القرآن الكريم',
            style: TextStyle(color: ColorManager.logo),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorManager.logo),

          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
                child: Container(
                    width: 291.w,
                    height: 100.h,
                    child: Image.asset(
                      ImageAssets.logo,
                      fit: BoxFit.fitWidth,
                    ))),
            SizedBox(
              height: 8.h,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 390.w,
              height: 55.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: ColorManager.primary),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اسم السورة ',
                    style: TextStyle(color: ColorManager.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset('assets/images/search_icon.png'),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            //  Text('المعروض اخيراً  ' , style: TextStyle(color: ColorManager.white ,fontSize:18  ),),
            //  SizedBox(height: 10.h,),
            //  Center(
            //    child: Container(
            //     height: 100.h,
            //     width: 180.w,
            //     decoration: BoxDecoration(
            //       color: ColorManager.logo,
            //       borderRadius: BorderRadius.circular(15),

            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //           Text('الانبياء' ,
            //            style: TextStyle(
            //             color: ColorManager.black , fontSize: 26
            //           ),
            //           ),
            //           Text('112 اية' , style: TextStyle(
            //             color: ColorManager.black , fontSize: 26
            //           ),
            //           ),
            //         ],),
            //         SizedBox(
            //           width: 100.w,
            //           height: 100.h,
            //           child: Image.asset('assets/images/recently widget image.png'))
            //       ],
            //     ),
            //    ),
            //  ),
            //  Text(' قائمة السور  ' , style: TextStyle(color: ColorManager.white ,fontSize:18  ),),
            BlocBuilder<QuranCubit, List<String>>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.length,
                      padding: EdgeInsets.only(right: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                           onTap: () {
                  final quranCubit = QuranCubit.get(context);
                  quranCubit.loadSurahContent(index);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: quranCubit,
                        child: QuranDetailsScreen(
                          title: state[index],
                        ),
                      ),
                    ),
                  ).then((_) {
                    // عند الرجوع إلى الشاشة، استعد أسماء السور
                    quranCubit.resetToSurahNames();
                  });
                },
                              child: SuraItem(
                                suraName: state[index],
                                number: index +1 ,
                                  verseCount: QuranCubit.get(context).surahVersesCount[index], // عدد الآيات الصحيح
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
