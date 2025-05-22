import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';

class AudioControlBar extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onForward;
  final VoidCallback onRewind;

  const AudioControlBar({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onForward,
    required this.onRewind,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          iconSize: 32,
          icon: const Icon(Icons.replay_10, color: AppColors.white),
          onPressed: onRewind,
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
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white),
            onPressed: onPlayPause,
          ),
        ),
        IconButton(
          iconSize: 32,
          icon: const Icon(Icons.forward_10, color: AppColors.white),
          onPressed: onForward,
        ),
      ],
    );
  }
}
