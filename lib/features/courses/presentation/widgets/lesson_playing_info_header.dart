import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class LessonInfoHeader extends StatelessWidget {
  final int lessonNumber;
  final String title;
  final String instructor;
  final String flag;

  const LessonInfoHeader({
    super.key,
    required this.lessonNumber,
    required this.title,
    required this.instructor,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBlack,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson number and title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lesson $lessonNumber',
                  style: getPoppinsMediumStyle14(AppColors.white),
                ),
                Text(
                  title,
                  style: getPoppinsSemiBoldStyle18(AppColors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Instructor and flag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Created by ",
                      style: getPoppinsRegularStyle14(AppColors.white),
                    ),
                    Text(
                      instructor,
                      style: getPoppinsMediumStyle14(AppColors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset(flag, width: 16, height: 16),
                    const SizedBox(width: 4),
                    Text(
                      'in Indonesia',
                      style: getPoppinsRegularStyle12(AppColors.gray),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
