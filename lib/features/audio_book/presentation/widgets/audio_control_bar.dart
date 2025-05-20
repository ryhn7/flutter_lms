import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';

class AudioControlBar extends StatelessWidget {
  const AudioControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          iconSize: 32,
          icon: const Icon(Icons.shuffle, color: AppColors.gray),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.skip_previous, color: AppColors.white),
          onPressed: () {},
        ),
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(
            color: AppColors.primaryRed,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 40,
            icon: const Icon(Icons.pause, color: AppColors.white),
            onPressed: () {},
          ),
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.skip_next, color: AppColors.white),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 32,
          icon: const Icon(Icons.repeat, color: AppColors.gray),
          onPressed: () {},
        ),
      ],
    );
  }
}
