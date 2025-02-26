import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaState(angle: 0, counter: 0, phraseIndex: 0));

  final List<String> phrases = [
    'سبحان الله ',
    'الحمد لله',
    'الله أكبر',
    'لا اله الا الله',
    
  ];

  void rotateSebha() {
    int newCounter = state.counter + 1;
    int newPhraseIndex = state.phraseIndex;

    if (newCounter > 33) {
      newCounter = 0;

      newPhraseIndex = (state.phraseIndex + 1) % phrases.length;
    }

    emit(SebhaState(
      angle: state.angle + pi /13 ,
      counter: newCounter,
      phraseIndex: newPhraseIndex,
    ));
  }

  String get currentPhrase => phrases[state.phraseIndex];
}

class SebhaState {
  final double angle;
  final int counter;
  final int phraseIndex;

  SebhaState({
    required this.angle,
    required this.counter,
    required this.phraseIndex,
  });
}
