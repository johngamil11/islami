import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/core/utils/image_assets.dart';
import 'package:islami/features/Hadith_screen/data/data_sources/local_data_source.dart';
import 'package:islami/features/Hadith_screen/data/repositories_impl/hadith_repository_imp.dart';
import 'package:islami/features/Hadith_screen/presentation/blocs/cubit/hadith_cubit.dart';
import 'package:islami/features/Hadith_screen/presentation/pages/Hadith_screen.dart';
import 'package:islami/features/azkar_screen/presentation/pages/azkar_screen.dart';
import 'package:islami/features/home_screen/presentation/blocs/cubit/home_screen_cubit.dart';
import 'package:islami/features/home_screen/presentation/widgets/icon_view.dart';
import 'package:islami/features/home_screen/presentation/widgets/prayer_time.dart';
import 'package:islami/features/qiblah_screen/data/data_sources/imp/qibla_data_source_imp.dart';
import 'package:islami/features/qiblah_screen/data/repositories_impl/qibla_repository_imp.dart';
import 'package:islami/features/qiblah_screen/domain/use_cases/qiblah_use_case.dart';
import 'package:islami/features/qiblah_screen/presentation/blocs/cubit/qibla_cubit.dart';
import 'package:islami/features/qiblah_screen/presentation/pages/qiblah_screen.dart';
import 'package:islami/features/quran_screen/data/data_sources/local_data_source.dart';
import 'package:islami/features/quran_screen/data/repositories_impl/quran_repository_imp.dart';
import 'package:islami/features/quran_screen/presentation/blocs/cubit/quran_cubit.dart';
import 'package:islami/features/quran_screen/presentation/pages/quran_screen.dart';
import 'package:islami/features/sebha_screen/presentation/pages/sebha_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeScreenCubit.get(context)..getPrayerTime();
      },
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
                  PrayerTime(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SebhaScreen()));
                            },
                            child: IconView(
                              text: 'سبحة',
                              image: 'assets/images/sebha.png',
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) => HadithCubit(HadithRepositoryImp(localDataSource: HadithLocalDataSource()  )),
                                            child: HadithScreen(),
                                          )));
                            },
                            child: IconView(
                              text: 'حديث',
                              image: 'assets/images/hadith.png',
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => QuranCubit(
                                    repository: QuranRepositoryImp(
                                        localDataSource: LocalDataSource()),
                                  ),
                                  child: QuranScreen(),
                                ),
                              ));
                            },
                            child: IconView(
                              text: 'القرآن الكريم',
                              image: 'assets/images/quran.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                     color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => QiblaCubit(
        qiblahUseCase: QiblahUseCase(
          qiblahRepository: QiblaRepositoryImp(
            qiblaDataSource: QiblaDataSourceImp(apiManager: ApiManager()),
          ),
        ),
      ),
      child: QiblahScreen(),
    ),
  ),
);

                            },
                            child: IconView(
                              text: 'القبلة',
                              image: 'assets/images/kaaba.png',
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              AzkarScreen()));
                            },
                            child: IconView(
                              text: 'الاذكار',
                              image: 'assets/images/azkar.png',
                            ),
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