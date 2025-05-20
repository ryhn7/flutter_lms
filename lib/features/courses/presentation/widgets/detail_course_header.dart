import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class DetailCourseHeader extends StatelessWidget {
  final String title;
  final String instructor;
  final String? instructorImagePath;
  final String duration;
  final int chapterCount;
  final int lessonCount;
  final String flag;
  final List<String> tags;

  const DetailCourseHeader({
    super.key,
    required this.title,
    required this.instructor,
    this.instructorImagePath,
    required this.duration,
    required this.chapterCount,
    required this.lessonCount,
    required this.flag,
    required this.tags,
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
            // Title
            Text(
              title,
              style: getPoppinsSemiBoldStyle20(AppColors.white),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                ...tags.map((tag) => Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.searchBarDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        tag,
                        style: getPoppinsMediumStyle12(AppColors.white),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 16),
            // Instructor row
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
            const SizedBox(height: 16),
            // Course metadata
            Text(
              '$chapterCount Chapters • $lessonCount Lessons • $duration Total Length',
              style: getPoppinsRegularStyle12(AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
