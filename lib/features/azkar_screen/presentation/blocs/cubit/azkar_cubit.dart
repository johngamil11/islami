import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islami/features/azkar_screen/data/repositories_impl/azkar_repository_imp.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepositoryImp azkarRepositoryImp;

  List<String> azkar = []; 

  AzkarCubit(this.azkarRepositoryImp) : super(AzkarInitial()) {
     loadAzkar('azkar_elsabah');

  }


  static AzkarCubit get(context) => BlocProvider.of(context);

  Future<void> loadAzkar(String azkarName) async {
    try {
      emit(AzkarLoading());
      azkar = await azkarRepositoryImp.getazkar(azkarName);
      emit(AzkarLoaded(azkar));
    } catch (e) {
      emit(AzkarError("Failed to load azkar"));
    }
  }


}

abstract class AzkarState {}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}


class AzkarLoaded extends AzkarState {
  final List<String> azkar;
  AzkarLoaded(this.azkar);
}

class AzkarError extends AzkarState {
  final String message;
  AzkarError(this.message);
}
