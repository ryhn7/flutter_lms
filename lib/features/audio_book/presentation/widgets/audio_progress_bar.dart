import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AudioProgressBar extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final Function(Duration) onSeek;

  const AudioProgressBar({
    super.key,
    required this.position,
    required this.duration,
    required this.onSeek,
  });

  String _format(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final formattedPosition = _format(position);
    final remaining = duration - position;
    final formattedRemaining =
        duration == Duration.zero ? '--:--' : _format(remaining);

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
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.clamp(0, duration.inSeconds).toDouble(),
              onChanged: (value) => onSeek(Duration(seconds: value.toInt())),
              activeColor: AppColors.primaryRed,
              inactiveColor: AppColors.gray.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formattedPosition,
                    style: getPoppinsRegularStyle12(AppColors.gray)),
                Text('-$formattedRemaining',
                    style: getPoppinsRegularStyle12(AppColors.gray)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
