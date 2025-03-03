part of 'radio_cubit.dart';

@immutable
sealed class RadioState {}

final class RadioInitial extends RadioState {}

final class RadioLoading extends RadioState {}

final class RadioLoadedState extends RadioState {
  final List<RadiosEntity> radio;
  final String? playingUrl; // الراديو المشغل حاليًا

  RadioLoadedState({required this.radio, this.playingUrl});
}

final class RadioErrorState extends RadioState {
  final Failures failures;
  RadioErrorState({required this.failures});
}
