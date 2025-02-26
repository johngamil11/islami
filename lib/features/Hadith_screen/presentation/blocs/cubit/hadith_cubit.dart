import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:islami/features/Hadith_screen/data/repositories_impl/hadith_repository_imp.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepositoryImp hadithRepository;
  late PageController pageController;
  double currentPage = 1;
  List<String> hadiths = []; // قائمة الأحاديث المحملة

  HadithCubit(this.hadithRepository) : super(HadithInitial()) {
    pageController = PageController(initialPage: 1, viewportFraction: 0.55);
    pageController.addListener(_updatePage);
    loadHadiths(); // تحميل الأحاديث تلقائيًا عند إنشاء الكيوبت
  }

  void _updatePage() {
    currentPage = pageController.page!;
    emit(HadithPageChanged(currentPage)); // إرسال رقم الصفحة الجديد
  }

  void onPageChanged(int index) {
    if (index == 0) {
      pageController.jumpToPage(hadiths.length);
    } else if (index == hadiths.length + 1) {
      pageController.jumpToPage(1);
    }
  }

  int getRealIndex(int index) {
    int realIndex = index - 1;
    if (realIndex < 0) return hadiths.length - 1;
    if (realIndex >= hadiths.length) return 0;
    return realIndex;
  }

  Future<void> loadHadiths() async {
    try {
      emit(HadithLoading());
      hadiths = await hadithRepository.getHadith();
      emit(HadithLoaded(hadiths));
    } catch (e) {
      emit(HadithError("Failed to load Hadiths"));
    }
  }

  @override
  Future<void> close() {
    pageController.removeListener(_updatePage);
    pageController.dispose();
    return super.close();
  }
}

// 🔹 تحديث الـ States
abstract class HadithState {}

class HadithInitial extends HadithState {}

class HadithLoading extends HadithState {}

class HadithPageChanged extends HadithState {
  final double currentPage;
  HadithPageChanged(this.currentPage);
}

class HadithLoaded extends HadithState {
  final List<String> hadith;
  HadithLoaded(this.hadith);
}

class HadithError extends HadithState {
  final String message;
  HadithError(this.message);
}
