import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider/features/audio_book/data/model/audio.dart';
import 'package:talent_insider/features/audio_book/presentation/bloc/audio_book_bloc.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_app_bar.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_control_bar.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_cover_art.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_info_section.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/audio_progress_bar.dart';
import 'package:talent_insider/theme/colors.dart';

class DetailAudioBookScreen extends StatefulWidget {
  const DetailAudioBookScreen({super.key});

  @override
  State<DetailAudioBookScreen> createState() => _DetailAudioBookScreenState();
}

class _DetailAudioBookScreenState extends State<DetailAudioBookScreen> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  Audio? _audio;

  StreamSubscription<Duration>? _durationSub;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<PlayerState>? _stateSub;

  @override
  void initState() {
    super.initState();

    context.read<AudioBookBloc>().add(
        const AudioBookEvent.getAudioByIdRequested('682bef2f6d770267fe862bc4'));

    _durationSub = _player.onDurationChanged.listen((d) {
      if (mounted && d > Duration.zero) {
        setState(() => _duration = d);
      }
    });

    _positionSub = _player.onPositionChanged.listen((p) {
      if (mounted) setState(() => _position = p);
    });

    _stateSub = _player.onPlayerStateChanged.listen((s) {
      if (mounted) setState(() => _isPlaying = s == PlayerState.playing);
    });
  }

  @override
  void dispose() {
    _durationSub?.cancel();
    _positionSub?.cancel();
    _stateSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _player.pause();
    } else if (_audio != null) {
      await _player.play(UrlSource(Uri.encodeFull(_audio!.path.first.url)));

      // better to use this for checking audio
      // await _player.play(UrlSource(
      //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    }
  }

  void _skipForward() {
    final newPosition = _position + const Duration(seconds: 15);
    if (newPosition < _duration) _player.seek(newPosition);
  }

  void _skipBackward() {
    final newPosition = _position - const Duration(seconds: 15);
    _player.seek(newPosition > Duration.zero ? newPosition : Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: BlocBuilder<AudioBookBloc, AudioBookState>(
          builder: (context, state) {
            return Column(
              children: [
                const AudioAppBar(),
                Expanded(
                  child: state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (message) => Center(
                        child: Text(message,
                            style: const TextStyle(color: Colors.white))),
                    audioLoaded: (audio) {
                      _audio ??= audio;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            AudioCoverArt(
                                imageUrl: _audio!.thumbnail.first.url),
                            const SizedBox(height: 32),
                            AudioInfoSection(
                              title: _audio!.path.first.fileName,
                              artist: _audio!.artist,
                            ),
                            const SizedBox(height: 32),
                            AudioProgressBar(
                              position: _position,
                              duration: _duration,
                              onSeek: (value) => _player.seek(value),
                            ),
                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: AudioControlBar(
                                isPlaying: _isPlaying,
                                onPlayPause: _togglePlayPause,
                                onForward: _skipForward,
                                onRewind: _skipBackward,
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
