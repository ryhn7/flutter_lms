import 'package:flutter/material.dart';
import 'package:talent_insider/core/utils/navigation_utils.dart';
import 'package:talent_insider/router/app_router.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AudioAppBar extends StatelessWidget {
  const AudioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: AppColors.white),
                onPressed: () => NavigationUtils.safeBack(context,
                    fallbackRoute: AppPaths.audioBook),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: AppColors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'PLAYING FROM SEARCH',
            style: getPoppinsMediumStyle10(AppColors.gray),
          ),
        ],
      ),
    );
  }
}
