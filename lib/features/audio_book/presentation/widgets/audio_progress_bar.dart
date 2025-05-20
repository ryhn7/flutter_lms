import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primaryRed,
              inactiveTrackColor: AppColors.gray.withOpacity(0.3),
              thumbColor: AppColors.primaryRed,
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 6,
              ),
            ),
            child: Slider(
              value: 0.7, // Sample progress
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2:19',
                  style: getPoppinsRegularStyle12(AppColors.gray),
                ),
                Text(
                  '-1:42',
                  style: getPoppinsRegularStyle12(AppColors.gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
