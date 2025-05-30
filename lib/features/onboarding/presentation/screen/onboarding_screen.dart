import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/onboarding/data/models/onboarding_data.dart';
import 'package:talent_insider/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';
import 'package:talent_insider/di/injection_container.dart';
import 'package:talent_insider/features/authentication/domain/usecases/set_seen_onboarding_usecase.dart';
import 'package:talent_insider/router/app_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      imagePath: 'assets/images/first.png',
      title: 'Upgrade skills,\nShow off credentials!',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis accumsan.',
    ),
    OnboardingData(
      imagePath: 'assets/images/second.png',
      title: 'Gain Insights and read \nTrending Articles',
      subtitle: 'Practice hands-on projects and real-world tasks.',
    ),
    OnboardingData(
      imagePath: 'assets/images/third.png',
      title: 'Attend Events and \nExpand your network!',
      subtitle: 'Stay on track with guided learning paths.',
    ),
  ];

  void _onSkipOrNext() async {
    if (_currentPage == onboardingPages.length - 1) {
      // Complete onboarding and save that it's been seen
      final setSeenOnboarding = sl<SetSeenOnboardingUseCase>();
      await setSeenOnboarding(true);
      // Use GoRouter for navigation instead of Navigator
      if (!mounted) return;
      GoRouter.of(context).go(AppPaths.login);
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingPages.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final page = onboardingPages[index];
              return OnboardingPage(
                imagePath: page.imagePath,
                title: page.title,
                subtitle: page.subtitle,
                currentPage: _currentPage,
                totalPages: onboardingPages.length,
              );
            },
          ),
          Positioned(
            bottom: 32,
            right: 32,
            child: GestureDetector(
              onTap: _onSkipOrNext,
              child: Text(
                _currentPage == onboardingPages.length - 1 ? 'Done' : 'Skip',
                style: getPoppinsSemiBoldStyle16(AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
