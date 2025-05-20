import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class ChapterNavigationBar extends StatelessWidget {
  final String chapterTitle;
  final int chapterNumber;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool hasNext;

  const ChapterNavigationBar({
    super.key,
    required this.chapterTitle,
    required this.chapterNumber,
    required this.onPrevious,
    required this.onNext,
    required this.hasNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBlack,
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: const BoxDecoration(
            // color: AppColors.backgroundDark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              // Back Button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.searchBarDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.white),
                  onPressed: onPrevious,
                ),
              ),
              const SizedBox(width: 16),

              // Title
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Chapter $chapterNumber : ',
                        style: getPoppinsSemiBoldStyle16(AppColors.white),
                      ),
                      TextSpan(
                        text: chapterTitle,
                        style: getPoppinsRegularStyle16(AppColors.white),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(width: 16),

              // Next Button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: hasNext
                      ? AppColors.primaryRed
                      : AppColors.searchBarDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, size: 20),
                  color: AppColors.white,
                  onPressed: hasNext ? onNext : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
