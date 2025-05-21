
import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBlack,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(imagePath, height: 250),
          const SizedBox(height: 32),
          Text(title, style: getPoppinsBoldStyle24(AppColors.white), textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: getPoppinsRegularStyle14(AppColors.gray),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
