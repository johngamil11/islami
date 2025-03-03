import 'package:bloc/bloc.dart';
import 'package:islami/core/errors/failurs.dart';
import 'package:islami/features/Radio_screen/domain/entities/radio_response_entity.dart';
import 'package:islami/features/Radio_screen/domain/use_cases/radio_use_case.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioUseCase radioUseCase;
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<RadiosEntity>? radio;

  RadioCubit({required this.radioUseCase}) : super(RadioInitial());

  void getRadio() async {
    emit(RadioLoading());
    var either = await radioUseCase.invoke();
    either.fold(
      (error) => emit(RadioErrorState(failures: error)),
      (response) {
        radio = response.radios;
        emit(RadioLoadedState(radio: radio!, playingUrl: null));
      },
    );
  }

  /// **تشغيل أو إيقاف الراديو**
Future<void> toggleRadio(String url) async {
  if (state is RadioLoadedState) {
    final currentState = state as RadioLoadedState;

    if (currentState.playingUrl == url) {
      emit(RadioLoadedState(radio: radio!, playingUrl: null)); // تحديث UI أولاً
      await _audioPlayer.stop();
    } else {
      emit(RadioLoadedState(radio: radio!, playingUrl: url)); // تحديث UI أولاً
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    }
  }
}

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}

