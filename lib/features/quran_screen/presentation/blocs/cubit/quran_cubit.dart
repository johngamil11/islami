import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/quran_screen/data/repositories_impl/quran_repository_imp.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum QuranViewMode { mode1, mode2 }

class QuranCubit extends Cubit<List<String>> {
  
  final QuranRepositoryImp repository;
  List<String> surahNames = [];
  List<String> verses = [];
  List<String> filteredSurahNames = []; 

  QuranViewMode currentMode = QuranViewMode.mode1;

  final List<int> surahVersesCount = [
    7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111, 43, 52, 99, 128, 111, 110, 98, 135, 
    112, 78, 118, 64, 77, 227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75, 85, 
    54, 53, 89, 59, 37, 35, 38, 29, 18, 45, 60, 49, 62, 55, 78, 96, 29, 22, 24, 13, 
    14, 11, 11, 18, 12, 12, 30, 52, 52, 44, 28, 28, 20, 56, 40, 31, 50, 40, 46, 42, 
    29, 19, 36, 25, 22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8, 19, 5, 8, 8, 11, 
    11, 8, 3, 9, 5, 4, 7, 3, 6, 3, 5, 4, 5, 6
  ];

  QuranCubit({required this.repository}) : super([]) {
    loadSurahName();
    _loadSavedMode();
  }

  static QuranCubit get(context) => BlocProvider.of(context);

void loadSurahName() {
  if (surahNames.isEmpty) {
    surahNames = repository.getSurahNames();
  }
  emit(surahNames);
}


void loadSurahContent(int index) async {
  emit([]); 
  await Future.microtask(() async {
    verses = await repository.getSurahContent(index);
    emit(verses);
  });
}


  void resetToSurahNames() {
    verses.clear();
    filteredSurahNames = List.from(surahNames); 
    emit(surahNames); 
  }

  void toggleViewMode() async {
    currentMode = currentMode == QuranViewMode.mode1 ? QuranViewMode.mode2 : QuranViewMode.mode1;
    await _saveMode(currentMode);
    emit(List.from(state));
  }


void searchSurah(String query) {
  if (query.isEmpty) {
    filteredSurahNames = List.from(surahNames);
  } else {
    String normalizedQuery = removeDiacritics(query).trim();
    filteredSurahNames = surahNames
        .where((surah) => removeDiacritics(surah).contains(normalizedQuery))
        .toList();
  }
  emit(List.from(filteredSurahNames));
}


  Future<void> _saveMode(QuranViewMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quran_view_mode', mode.index);
  }

  Future<void> _loadSavedMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIndex = prefs.getInt('quran_view_mode') ?? 0;
    currentMode = QuranViewMode.values[savedIndex];
  }

String removeDiacritics(String text) {
  return text.replaceAll(RegExp(r'[\u064B-\u065F]'), '');
}
  
}
