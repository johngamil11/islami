import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/qiblah_screen/data/data_sources/imp/qibla_data_source_imp.dart';
import 'package:islami/features/qiblah_screen/data/repositories_impl/qibla_repository_imp.dart';
import 'package:islami/features/qiblah_screen/domain/use_cases/qiblah_use_case.dart';
import 'package:islami/features/qiblah_screen/presentation/blocs/cubit/qibla_cubit.dart';

class QiblahScreen extends StatelessWidget {
  const QiblahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QiblaCubit(
        qiblahUseCase: QiblahUseCase(
          qiblahRepository: QiblaRepositoryImp(
            qiblaDataSource: QiblaDataSourceImp(apiManager: ApiManager()),
          ),
        ),
      )..getQiblah(),
        
      child: Stack(
        children: [
            Image.asset(
                        'assets/images/qiblah.jpg', // صورة الخلفية
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(color: Colors.black.withOpacity(0.3)),
                      ),
            Scaffold(
              backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('اتجاة القبلة' , style: TextStyle(color: ColorManager.white), ),
              centerTitle: true,
                iconTheme: const IconThemeData(color: ColorManager.white), 

            ),
            body:
             Stack(
              children: [
              
                   Positioned(
                                  top: 160.h, 
                                  right: 155.w,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                ),
                Center(
                  child: BlocBuilder<QiblaCubit, QiblaState>(
                    builder: (context, state) {
                      if (state is QiblaLoading) {
                        return const CircularProgressIndicator(color: ColorManager.primary,);
                      } else if (state is QiblahLoaded ||
                          state is QiblahDirectionUpdated) {
                        final double qiblahDirection = state is QiblahLoaded
                            ? state.qiblah.data!.direction!.toDouble()
                            : (state as QiblahDirectionUpdated).qiblahDirection;
          
                        final double deviceDirection = state is QiblahLoaded
                            ? 0.0
                            : (state as QiblahDirectionUpdated).deviceDirection;
          
                        double adjustmentAngle = 0;
                        double rotation = ((qiblahDirection - deviceDirection) + adjustmentAngle) / 360;
          
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                          
                                AnimatedRotation(
                                  duration: const Duration(milliseconds: 500),
                                  turns: rotation,
                                  child: Image.asset(
                                    'assets/images/compass.png',
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
          
                               
                              ],
                            ),
          
                            const SizedBox(height: 20),
                            Text(
                              'اتجاه القبلة: ${qiblahDirection.toStringAsFixed(2)}°',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'خطأ في تحميل القبلة',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
       
        
        ],
      ),
    );
  }
}
