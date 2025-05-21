import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int currentPage;
  final int totalPages;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBlack,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Center(child: Image.asset(imagePath, height: 300)),
          const SizedBox(height: 64),
          Text(
            title,
            style: getPoppinsMediumStyle32(AppColors.white),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: getPoppinsRegularStyle18(AppColors.gray),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 24),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalPages, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primaryRed
                        : AppColors.gray,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

