import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';
import 'package:talent_insider/utils/wave_notch_clipper.dart';

class DetailCourseContentCard extends StatelessWidget {
  final int index;
  final int chapterNumber;
  final String chapterTitle;
  final int lessonCount;
  final String duration;
  final List<CourseLesson> lessons;
  final bool isExpanded;
  final VoidCallback onExpand;

  const DetailCourseContentCard({
    super.key,
    required this.index,
    required this.chapterNumber,
    required this.chapterTitle,
    required this.lessonCount,
    required this.duration,
    required this.lessons,
    required this.isExpanded,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = index.isEven;
    final Color cardColor =
        isDark ? AppColors.backgroundCardDark : AppColors.backgroundCardGray;

    return Stack(
      children: [
        GestureDetector(
          onTap: onExpand,
          child: ClipPath(
            clipper: WaveNotchClipper(),
            child:
                // Card content
                Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TOP ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chapter $chapterNumber',
                        style: getPoppinsMediumStyle12(AppColors.white),
                      ),
                      Text(
                        '$lessonCount Lesson • $duration',
                        style: getPoppinsMediumStyle12(AppColors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // TITLE
                  Text(
                    chapterTitle,
                    style: getPoppinsMediumStyle16(AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Expandable lessons
                  if (isExpanded)
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lessons.length,
                      separatorBuilder: (_, __) => Container(
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
                      ),
                      itemBuilder: (_, index) {
                        final lesson = lessons[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          leading: Icon(
                            lesson.isPDF
                                ? Icons.picture_as_pdf
                                : Icons.play_circle_outline,
                            color:
                                lesson.isPDF ? Colors.green : AppColors.white,
                          ),
                          title: Text(
                            lesson.title,
                            style: getPoppinsMediumStyle14(AppColors.white),
                          ),
                          subtitle: lesson.duration != null
                              ? Text(
                                  lesson.duration!,
                                  style:
                                      getPoppinsRegularStyle12(AppColors.gray),
                                )
                              : null,
                          trailing: Icon(
                            lesson.isPDF ? Icons.download : Icons.play_arrow,
                            color: AppColors.white,
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),

        // Center notch bar
        Positioned(
          top: 8,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 36,
              height: 6,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CourseLesson {
  final String title;
  final String? duration;
  final bool isPDF;

  const CourseLesson({
    required this.title,
    this.duration,
    this.isPDF = false,
  });
}