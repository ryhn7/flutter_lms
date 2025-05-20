import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class LessonListItem extends StatelessWidget {
  final String title;
  final String type;
  final String duration;
  final bool isPlaying;
  final bool isCompleted;
  final VoidCallback? onTap;

  const LessonListItem({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    this.isPlaying = false,
    this.isCompleted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPDF = type == 'pdf';

    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.backgroundDark,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Thumbnail/Icon
            Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isPDF ? Colors.green : AppColors.backgroundDark,
                image: !isPDF
                    ? const DecorationImage(
                        image: AssetImage('assets/images/thumbnail.png'),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: isPDF
                  ? const Icon(Icons.download, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),

            // Text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isPDF ? 'PDF' : 'Lesson ${title.contains('Lesson') ? '' : ''}',
                    style: getPoppinsRegularStyle12(AppColors.gray),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: getPoppinsRegularStyle14(AppColors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Right-side info
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  duration.isNotEmpty ? duration : '-',
                  style: getPoppinsRegularStyle12(AppColors.gray),
                ),
                const SizedBox(height: 4),
                if (isCompleted)
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: AppColors.successGreen,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
