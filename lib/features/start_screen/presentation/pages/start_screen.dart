import 'package:flutter/material.dart';
import 'package:islami/config/app_router.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/start_screen/presentation/widgets/page_content.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentIndex = _controller.page?.round() ?? 0;
      });
    });
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    
    if (mounted) {
      Navigator.pushReplacementNamed(context, 'home_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  PageContent(image: 'assets/images/welcome.png', text: 'مرحبًا بك في إسلامي', text2: 'استعد لرحلة روحانية'),
                  PageContent(image: 'assets/images/quran.png', text: 'نور قلبك بذكر الله', text2: 'اقرأ القرآن، واستمع للتلاوات'),
                  PageContent(image: 'assets/images/prayertime.png', text: "إن الصلاة كانت على المؤمنين كتابًا موقوتًا", text2: 'اعرف مواعيد الصلاة'),
                  PageContent(image: 'assets/images/hadith.png', text: "خيركم من تعلم القرآن وعلمه", text2: 'تعلم حديث النبي ﷺ'),
                  PageContent(image: 'assets/images/sebha.png', text: 'سبحان الله، والحمد لله، ولا إله إلا الله، والله أكبر', text2: 'اجعل لسانك عامرًا بالذكر'),
                  PageContent(image: 'assets/images/azkar.png', text: "لا تتوقف عن التسبيح", text2: "اجعل التسبيح جزءًا من يومك"),
                  PageContent(image: 'assets/images/radio.png', text: "استمع للقرآن الكريم", text2: 'اجعل صوت القرآن يملأ يومك'),
                  PageContent(image: 'assets/images/kaaba.png', text: "حيثما كنت، القبلة في متناول يديك", text2: 'حدد اتجاه صلاتك بسهولة'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: currentIndex == 0
                        ? null
                        : () {
                            _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                    child: Text("السابق", style: TextStyle(color: ColorManager.logo)),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 8,
                    effect: ExpandingDotsEffect(
                      activeDotColor: ColorManager.logo,
                      dotColor: Colors.grey,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex == 7) {
                        _completeOnboarding();
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text("التالي", style: TextStyle(color: ColorManager.logo)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
