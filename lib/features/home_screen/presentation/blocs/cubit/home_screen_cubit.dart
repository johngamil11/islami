import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
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
  Month2Entity? date ;



  HomeScreenCubit({required this.prayerTimeUseCase})
      : super(HomeScreenLoading());

static HomeScreenCubit get(context) => BlocProvider.of(context);

Future<void> getPrayerTime() async {
  emit(HomeScreenLoading());

  try {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(HomeScreenError(failures: Failures(errorMessage: "Location permission denied")));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(HomeScreenError(failures: Failures(errorMessage: "Location permission permanently denied. Please enable it from settings.")));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    double latitude = position.latitude;
    double longitude = position.longitude;

    String locationUrl = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude';
    var locationResponse = await Dio().get(locationUrl);
    var locationData = locationResponse.data;

    String city = locationData['address']['city'] ?? locationData['address']['town'] ?? locationData['address']['village'];
    String country = locationData['address']['country'];

    var either = await prayerTimeUseCase.invoke( city, country);

    either.fold((error) {
      emit(HomeScreenError(failures: error));
    }, (response) {
      prayerTime = response.data;
      emit(HomeScreenLoaded(prayerTime: response.data));
    });

  } catch (e) {
    emit(HomeScreenError(failures: Failures(errorMessage: "Error: $e")));
  }
}
}
