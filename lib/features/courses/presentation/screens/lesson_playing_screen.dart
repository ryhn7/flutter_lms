import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_info_header.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_list_item.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_navigation_bar.dart';
import 'package:talent_insider/features/courses/presentation/widgets/lesson_playing_video_section.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class LessonPlayingScreen extends StatefulWidget {
  const LessonPlayingScreen({super.key});

  @override
  State<LessonPlayingScreen> createState() => _LessonPlayingScreenState();
}

class _LessonPlayingScreenState extends State<LessonPlayingScreen> {
  // Mock data
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
    // Add more lessons as needed
  ];

  bool _isPlaying = false;
  final double _videoProgress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlack,
        title: Text(
          'Lesson Playing',
          style: getPoppinsMediumStyle16(AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundDark,
          child: Column(
            children: [
              // Video Player Section
              VideoPlayerSection(
                thumbnailPath: 'assets/images/thumbnail.png',
                currentTime: '00:45',
                totalDuration: '15:30',
                progress: _videoProgress,
                onPlayPause: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
                onSettings: () {
                  // Handle settings
                },
                onFullscreen: () {
                  // Handle fullscreen
                },
              ),

              // Lesson Info Header
              const LessonInfoHeader(
                lessonNumber: 1,
                title: 'Introduction to UI Design',
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
      ),
    );
  }
}
