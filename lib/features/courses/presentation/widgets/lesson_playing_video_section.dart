import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class VideoPlayerSection extends StatelessWidget {
  final String? thumbnailPath;
  final String currentTime;
  final String totalDuration;
  final double progress;
  final VoidCallback onPlayPause;
  final VoidCallback onSettings;
  final VoidCallback onFullscreen;

  const VideoPlayerSection({
    super.key,
    this.thumbnailPath,
    required this.currentTime,
    required this.totalDuration,
    required this.progress,
    required this.onPlayPause,
    required this.onSettings,
    required this.onFullscreen,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Video/Thumbnail
          Container(
            color: AppColors.backgroundDark,
            child: thumbnailPath != null
                ? Image.asset(thumbnailPath!, fit: BoxFit.cover)
                : const Center(
                    child: Icon(Icons.play_circle_outline,
                        color: AppColors.white, size: 48),
                  ),
          ),

          // Controls overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          // Play/Pause Button
          Center(
            child: IconButton(
              icon: const Icon(Icons.play_arrow,
                  color: AppColors.white, size: 48),
              onPressed: onPlayPause,
            ),
          ),

          // Bottom controls
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Time and settings row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Time display
                      Text(
                        '$currentTime / $totalDuration',
                        style: getPoppinsRegularStyle12(AppColors.white),
                      ),
                      // Controls
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.settings,
                                color: AppColors.white),
                            onPressed: onSettings,
                          ),
                          IconButton(
                            icon: const Icon(Icons.fullscreen,
                                color: AppColors.white),
                            onPressed: onFullscreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Progress bar
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.gray.withOpacity(0.3),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
                  minHeight: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
