import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/home_screen/domain/entities/prayer_time_response_entity.dart';
import 'package:islami/features/home_screen/domain/use_cases/prayer_time_use_case.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  PrayerTimeUseCase prayerTimeUseCase;
  DataEntity? prayerTime;

  HomeScreenCubit({required this.prayerTimeUseCase})
      : super(HomeScreenLoading());

  void getPrayerTime() async {
    emit(HomeScreenLoading());
    var either = await prayerTimeUseCase.invoke();
    either.fold((error) {
      print(error.errorMessage);
      emit(HomeScreenError(failures: error));
    }, (response) {
      print(response.data);
      prayerTime = response.data;

      emit(HomeScreenLoaded(prayerTime: response.data));
    });
  }
}
