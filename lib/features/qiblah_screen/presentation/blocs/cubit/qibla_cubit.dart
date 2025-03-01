import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/qiblah_screen/domain/entities/qiblah_entity.dart';
import 'package:islami/features/qiblah_screen/domain/use_cases/qiblah_use_case.dart';
import 'package:meta/meta.dart';

part 'qibla_state.dart';

@injectable
class QiblaCubit extends Cubit<QiblaState> {
  final QiblahUseCase qiblahUseCase;
  StreamSubscription? _compassSubscription;
  double _deviceDirection = 0.0;
  double _qiblahDirection = 0.0;
  

  QiblaCubit({required this.qiblahUseCase}) : super(QiblaInitial());

  static QiblaCubit get(context) => BlocProvider.of(context);

  Future<void> getQiblah() async {
    emit(QiblaLoading());

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(QiblahError("تم رفض إذن الموقع"));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(QiblahError("إذن الموقع مرفوض دائمًا، قم بتمكينه من الإعدادات"));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double latitude = position.latitude;
      double longitude = position.longitude;

      Either<Failures, QiblahResponseEntity> result =
          await qiblahUseCase.invoke(latitude, longitude);

      result.fold(
        (failure) => emit(QiblahError(failure.errorMessage)),
        (qiblah) {
          _qiblahDirection = qiblah.data!.direction!.toDouble();
          emit(QiblahLoaded(qiblah, _deviceDirection));
          _startCompassListener();
        },
      );
    } catch (e) {
      emit(QiblahError("حدث خطأ أثناء جلب الموقع: $e"));
    }
  }

  void _startCompassListener() {
    _compassSubscription?.cancel();
    _compassSubscription = FlutterCompass.events?.listen((event) {
      if (event != null) {
        _deviceDirection = event.heading ?? 0.0;
        emit(QiblahDirectionUpdated(_qiblahDirection, _deviceDirection));
      }
    });
  }

  @override
  Future<void> close() {
    _compassSubscription?.cancel();
    return super.close();
  }
}
