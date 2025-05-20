import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String? instructorImagePath;
  final String? description;
  final String level;
  final List<String> tags;
  final String? thumbnailPath;
  final String duration;
  final bool isNew;
  final String? flag;
  final int lessonCount;
  final VoidCallback? onPressed;

  const CourseCard({
    super.key,
    required this.title,
    required this.instructor,
    this.instructorImagePath,
    this.description,
    required this.level,
    required this.tags,
    this.thumbnailPath,
    required this.duration,
    this.isNew = false,
    this.flag = 'assets/images/flag_idn.png',
    required this.lessonCount,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail with "New" badge
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: thumbnailPath != null
                          ? Image.asset(
                              thumbnailPath!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 120,
                              height: 120,
                              color: AppColors.backgroundDark.withOpacity(0.5),
                              child: const Icon(
                                Icons.image,
                                color: AppColors.gray,
                                size: 32,
                              ),
                            ),
                    ),
                    if (isNew)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'New',
                            style: getPoppinsMediumStyle10(AppColors.black),
                          ),
                        ),
                      ),
                  ],
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: getPoppinsMediumStyle14(AppColors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Instructor, Level, and Flag
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                instructorImagePath != null
                                    ? Image.asset(
                                        instructorImagePath!,
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.transparent,
                                        child: const Icon(
                                          Icons.image,
                                          color: AppColors.gray,
                                          size: 20,
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    instructor,
                                    style:
                                        getPoppinsMediumStyle12(AppColors.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: AppColors.chipNew,
                                    ),
                                  ),
                                  child: Text(
                                    level,
                                    style: getPoppinsRegularStyle10(
                                        AppColors.chipNew),
                                  ),
                                ),
                                if (flag != null) ...[
                                  const SizedBox(width: 8),
                                  Image.asset(flag!, width: 16, height: 16),
                                ],
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
      
                        // Description
                        if (description != null) ...[
                          Text(
                            description!,
                            style: getPoppinsMediumStyle12(AppColors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                        ],
      
                        // Tags
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: [
                                ...tags.map((tag) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.searchBarDark,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        tag,
                                        style: getPoppinsRegularStyle10(
                                            AppColors.white),
                                      ),
                                    )),
                              ],
                            ),
                            // Duration and lessons
                            Row(
                              children: [
                                Text(
                                  lessonCount.toString(),
                                  style: getPoppinsMediumStyle12(AppColors.white),
                                ),
                                const SizedBox(width: 2),
                                const Icon(
                                  Icons.access_time,
                                  size: 12,
                                  color: AppColors.gray,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  duration,
                                  style: getPoppinsMediumStyle12(AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.courseDividerTransparent,
                    AppColors.courseDivider,
                    AppColors.courseDividerTransparent,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
