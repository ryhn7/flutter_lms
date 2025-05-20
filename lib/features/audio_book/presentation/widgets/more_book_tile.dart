import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class MoreBookTile extends StatelessWidget {
  final String coverImage;
  final String title;
  final String author;
  final String chapters;
  final String duration;
  final bool isBookmarked;
  final VoidCallback? onTap;
  final VoidCallback? onBookmarkTap;

  const MoreBookTile({
    super.key,
    required this.coverImage,
    required this.title,
    required this.author,
    required this.chapters,
    required this.duration,
    this.isBookmarked = false,
    this.onTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Cover Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Book Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: getPoppinsSemiBoldStyle14(AppColors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'by $author',
                    style: getPoppinsRegularStyle12(AppColors.gray),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '$chapters Chapters',
                        style: getPoppinsRegularStyle12(AppColors.gray),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gray,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        duration,
                        style: getPoppinsRegularStyle12(AppColors.gray),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bookmark Icon
            IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                color: isBookmarked ? AppColors.primaryRed : AppColors.gray,
              ),
              onPressed: onBookmarkTap,
            ),
          ],
        ),
      ),
    );
  }
}
