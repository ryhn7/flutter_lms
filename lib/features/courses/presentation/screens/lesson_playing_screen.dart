import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider/core/utils/navigation_utils.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_info_header.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_list_item.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_navigation_bar.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_video_section.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';
import 'package:video_player/video_player.dart';

class LessonPlayingScreen extends StatefulWidget {
  final String? lessonId;

  const LessonPlayingScreen({
    super.key,
    this.lessonId,
  });

  @override
  State<LessonPlayingScreen> createState() => _LessonPlayingScreenState();
}

class _LessonPlayingScreenState extends State<LessonPlayingScreen> {
  // Mock data for lesson list
  final List<Map<String, dynamic>> _lessons = [
    {
      'title': 'Introduction to UI Design',
      'type': 'video',
      'duration': '15:30',
      'isPlaying': true,
      'isCompleted': false,
    },
    {
      'title': 'Design Fundamentals',
      'type': 'video',
      'duration': '25:45',
      'isPlaying': false,
      'isCompleted': false,
    },
    {
      'title': 'Course Resources',
      'type': 'pdf',
      'duration': '',
      'isPlaying': false,
      'isCompleted': false,
    },
  ];

  // Video player variables
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isPlaying = false;
  double _videoProgress = 0.0;
  String _currentTime = '00:00';
  String _totalDuration = '00:00';
  Lesson? _currentLesson;

  @override
  void initState() {
    super.initState();
    _fetchLessonData();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _fetchLessonData() {
    if (widget.lessonId != null) {
      context
          .read<CoursesBloc>()
          .add(CoursesEvent.getLessonByIdRequested(widget.lessonId!));
    }
  }

  void _initializeVideoPlayer(String videoUrl) {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    _videoPlayerController!.initialize().then((_) {
      // Get total duration
      final duration = _videoPlayerController!.value.duration;
      _totalDuration = _formatDuration(duration);

      // Create chewie controller
      _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          autoPlay: true,
          looping: false,
          aspectRatio: 16 / 9,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(
                'Error loading video: $errorMessage',
                style: getPoppinsRegularStyle14(AppColors.white),
              ),
            );
          });

      // Add listener to update progress
      _videoPlayerController!.addListener(_videoPlayerListener);

      // Update UI
      setState(() {
        _isPlaying = true;
      });
    });
  }

  void _videoPlayerListener() {
    if (!mounted) return;

    final position = _videoPlayerController!.value.position;
    final duration = _videoPlayerController!.value.duration;

    if (duration.inMilliseconds > 0) {
      final progress = position.inMilliseconds / duration.inMilliseconds;

      setState(() {
        _videoProgress = progress;
        _currentTime = _formatDuration(position);
        _isPlaying = _videoPlayerController!.value.isPlaying;
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlack,
        title: Text(
          _currentLesson?.title ?? 'Lesson Playing',
          style: getPoppinsMediumStyle16(AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => NavigationUtils.safeBack(context),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<CoursesBloc, CoursesState>(
          listener: (context, state) {
            state.maybeWhen(
              lessonLoaded: (lesson) {
                setState(() {
                  _currentLesson = lesson;
                });

                // Initialize video player if there's a video URL available
                if (lesson.path.isNotEmpty) {
                  final safeUrl = Uri.parse(lesson.path[0].url).toString();
                  _initializeVideoPlayer(
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                }
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Error loading lesson: $message',
                      style: getPoppinsRegularStyle14(AppColors.white),
                    ),
                    backgroundColor: AppColors.primaryRed,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return _buildContent(state);
          },
        ),
      ),
    );
  }

  Widget _buildContent(CoursesState state) {
    return state.maybeWhen(
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primaryRed),
      ),
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline,
                size: 48, color: AppColors.primaryRed),
            const SizedBox(height: 16),
            Text('Failed to load lesson',
                style: getPoppinsMediumStyle16(AppColors.white)),
            const SizedBox(height: 8),
            Text(
              message,
              style: getPoppinsRegularStyle14(AppColors.gray),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchLessonData,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
      orElse: () => Container(
        color: AppColors.backgroundDark,
        child: Column(
          children: [
            // Video Player Section
            if (_chewieController != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(controller: _chewieController!),
              )
            else
              VideoPlayerSection(
                currentTime: _currentTime,
                totalDuration: _totalDuration,
                progress: _videoProgress,
                onPlayPause: () {
                  if (_videoPlayerController != null) {
                    if (_isPlaying) {
                      _videoPlayerController!.pause();
                    } else {
                      _videoPlayerController!.play();
                    }
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  }
                },
                onSettings: () {
                  // Handle settings
                },
                onFullscreen: () {
                  // Handle fullscreen
                },
              ),

            // Lesson Info Header
            LessonInfoHeader(
              lessonNumber: 1,
              title: _currentLesson?.title ?? 'Lesson Title',
              instructor: 'David Rockwell',
              flag: 'assets/images/flag_idn.png',
            ),

            // Lesson List
            Expanded(
              child: ListView.separated(
                itemCount: _lessons.length,
                separatorBuilder: (_, __) => Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.courseDividerTransparent,
                        AppColors.courseDivider,
                        AppColors.courseDividerTransparent,
                      ],
                    ),
                  ),
                ),
                itemBuilder: (context, index) {
                  final lesson = _lessons[index];
                  return LessonListItem(
                    title: lesson['title'],
                    type: lesson['type'],
                    duration: lesson['duration'],
                    isPlaying: lesson['isPlaying'],
                    isCompleted: lesson['isCompleted'],
                    onTap: () {
                      // Handle lesson selection
                      setState(() {
                        for (var i = 0; i < _lessons.length; i++) {
                          _lessons[i]['isPlaying'] = i == index;
                        }
                      });
                    },
                  );
                },
              ),
            ),

            // Navigation Bar
            ChapterNavigationBar(
              chapterNumber: 1,
              chapterTitle: 'Getting Started with UI Design',
              onPrevious: () {
                // Handle previous chapter
              },
              onNext: () {
                // Handle next chapter
              },
              hasNext: true,
            ),
          ],
        ),
      ),
    );
  }
}
