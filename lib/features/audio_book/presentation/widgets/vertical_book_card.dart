import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class VerticalBookCard extends StatelessWidget {
  final String coverImage;
  final String title;
  final String author;
    final VoidCallback? onTap;

  const VerticalBookCard({
    super.key,
    required this.coverImage,
    required this.title,
    required this.author,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.3; 
    final imageHeight = cardWidth * 1.5; 

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Container(
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
      
            // Title
            Text(
              title,
              style: getPoppinsMediumStyle14(AppColors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
      
            // Author
            Text(
              author,
              style: getPoppinsRegularStyle12(AppColors.gray),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
