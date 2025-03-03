import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/Radio_screen/data/data_sources/imp/radio_data_source_imp.dart';
import 'package:islami/features/Radio_screen/data/repositories_impl/radio_repository_imp.dart';
import 'package:islami/features/Radio_screen/domain/use_cases/radio_use_case.dart';
import 'package:islami/features/Radio_screen/presentation/blocs/cubit/radio_cubit.dart';
import 'package:islami/features/Radio_screen/presentation/widgets/RadioWidget.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit(
        radioUseCase: RadioUseCase(
          radioRepository: RadioRepositoryImp(
            radioDataSource: RadioDataSourceImp(apiManager: ApiManager()),
          ),
        ),
      )..getRadio(),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/radio_background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
              top: 15.h,
              right: 35.w,
              child: Image.asset('assets/images/Logo.png')),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "الراديو",
                style: TextStyle(color: ColorManager.white),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: ColorManager.white),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 65.h,
                ),
                Expanded(child: BlocBuilder<RadioCubit, RadioState>(
                  builder: (context, state) {
                    if (state is RadioLoading) {
                      return Center(
                          child:
                              CircularProgressIndicator(
                                color: ColorManager.primary,
                              )); 
                    } else if (state is RadioLoadedState) {
                      return ListView.builder(
                        itemCount: state.radio?.length ?? 0,
                        itemBuilder: (context, index) {
                          return RadioWidget(
                              name: state.radio?[index].name ?? '' , 
                              url: state.radio?[index].url ?? '',);
                        },
                      );
                    } else if (state is RadioErrorState) {
                      return Center(
                          child:
                              Text(' Error: ${state.failures.errorMessage}'));
                    } else {
                      return Center(child: Text('لا توجد بيانات متاحة '));
                    }
                  },
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
