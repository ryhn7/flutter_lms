import 'package:flutter/material.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_app_bar.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_control_bar.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_cover_art.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_info_section.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_progress_bar.dart';
import 'package:talent_insider/theme/colors.dart';

class DetailAudioBookScreen extends StatelessWidget {
  const DetailAudioBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: Column(
          children: [
            AudioAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AudioCoverArt(),
                    SizedBox(height: 32),
                    AudioInfoSection(),
                    SizedBox(height: 32),
                    AudioProgressBar(),
                    SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AudioControlBar(),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
