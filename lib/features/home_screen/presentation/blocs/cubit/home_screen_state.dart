part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenLoaded extends HomeScreenState {
  DataEntity? prayerTime;
  HomeScreenLoaded({required this.prayerTime});
}

final class HomeScreenError extends HomeScreenState {
  Failures failures;
  HomeScreenError({required this.failures});
}


final class NextPrayerTimeError extends HomeScreenState {
  Failures failures;
  NextPrayerTimeError({required this.failures});
}

final class NextPrayerTimeLoading extends HomeScreenState {}

final class NextPrayerTimeLoaded extends HomeScreenState {
  DataEntityNextPrayerTime? dataEntityNextPrayerTime;
  NextPrayerTimeLoaded({required this.dataEntityNextPrayerTime});
}

