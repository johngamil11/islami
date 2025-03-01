part of 'qibla_cubit.dart';

@immutable
sealed class QiblaState {}

final class QiblaInitial extends QiblaState {}

final class QiblaLoading extends QiblaState {}

final class QiblahLoaded extends QiblaState {
  final QiblahResponseEntity qiblah;
  final double deviceDirection;

  QiblahLoaded(this.qiblah, this.deviceDirection);
}

final class QiblahDirectionUpdated extends QiblaState {
  final double qiblahDirection;
  final double deviceDirection;

  QiblahDirectionUpdated(this.qiblahDirection, this.deviceDirection);
}

final class QiblahError extends QiblaState {
  final String message;
  QiblahError(this.message);
}
