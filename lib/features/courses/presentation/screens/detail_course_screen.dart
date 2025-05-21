import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_event.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_state.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_content_card.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_continue_button.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_header.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_tab_bar.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class DetailCourseScreen extends StatefulWidget {
  final String courseId;

  const DetailCourseScreen({super.key, required this.courseId});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  int _selectedTabIndex = 0;
  int _expandedCardIndex = -1;
  Course? _course;

  final List<CourseLesson> _sampleLessons = const [
    CourseLesson(
      title: 'Introduction to UI Design',
      duration: '15:30',
    ),
    CourseLesson(
      title: 'Design Fundamentals',
      duration: '25:45',
    ),
    CourseLesson(
      title: 'Course Resources',
      isPDF: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Request course data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoursesBloc>().add(
            CoursesEvent.getCourseByIdRequested(widget.courseId),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: BlocConsumer<CoursesBloc, CoursesState>(
          listener: (context, state) {
            state.maybeWhen(
              courseLoaded: (course) {
                setState(() {
                  _course = course;
                });
              },
              chapterLoaded: (chapter) {
                // When a chapter is loaded, we could update UI to show lessons
                // but for now we'll just show a confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Chapter "${chapter.title}" loaded')),
                );

                // In a future implementation, we would update the lessons for this chapter
                // with the actual data from the API
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return Container(
              color: AppColors.backgroundDark,
              child: Column(
                children: [
                  Expanded(
                    child: state.maybeWhen(
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      courseLoaded: (course) => _buildCourseContent(),
                      error: (message) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline,
                                size: 48, color: AppColors.primaryRed),
                            const SizedBox(height: 16),
                            Text(
                              'Error',
                              style: getPoppinsMediumStyle16(AppColors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              message,
                              style: getPoppinsRegularStyle14(AppColors.gray),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<CoursesBloc>().add(
                                      CoursesEvent.getCourseByIdRequested(
                                          widget.courseId),
                                    );
                              },
                              child: const Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                      orElse: () => CustomScrollView(
                        slivers: [
                          // Back button and header
                          SliverAppBar(
                            backgroundColor: AppColors.backgroundBlack,
                            // pinned: true,
                            title: Text(
                              'Course Details',
                              style: getPoppinsMediumStyle16(AppColors.white),
                            ),
                            leading: IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: AppColors.white),
                              onPressed: () => context.pop(),
                            ),
                          ),

                          const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(32.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Continue Button is conditionally shown only when course is loaded
                  if (_course != null)
                    DetailCourseContinueButton(
                      onPressed: () {
                        // Handle continue learning
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCourseContent() {
    return CustomScrollView(
      slivers: [
        // Back button and header
        SliverAppBar(
          backgroundColor: AppColors.backgroundBlack,
          // pinned: true,
          title: Text(
            'Course Details',
            style: getPoppinsMediumStyle16(AppColors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () => context.pop(),
          ),
        ),

        // Thumbnail image
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: AppColors.searchBarDark,
              child: _course?.path != null && _course!.path.isNotEmpty
                  ? Image.network(
                      _course!.path[0].url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/thumbnail.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      'assets/images/thumbnail.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),

        // Course header section with padding
        SliverToBoxAdapter(
          child: DetailCourseHeader(
            title: _course?.title ?? 'Loading Course...',
            instructor: _course?.author ?? 'John Doe',
            instructorImagePath: _course?.instructorImageUrl ??
                'assets/images/card_img_placeholder.png',
            duration: _course?.duration ?? 'TBD',
            chapterCount: _course?.chapter.length ?? 0,
            lessonCount: 0, // We don't have this information directly
            flag: _course?.instructorFlag ?? 'assets/images/flag_idn.png',
            tags: _course?.tags ?? ['General'],
          ),
        ),

        // Tab Bar
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 48,
            maxHeight: 48,
            child: Container(
              color: AppColors.backgroundBlack,
              child: DetailCourseTabBar(
                tabs: const ['Overview', 'Contents', 'More Like This'],
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),
            ),
          ),
        ),

        // Tab content
        if (_selectedTabIndex == 1) ...[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // Check if course or chapters are available
                if (_course == null ||
                    _course!.chapter.isEmpty ||
                    index >= _course!.chapter.length) {
                  return const SizedBox.shrink();
                }

                final chapter = _course!.chapter[index];

                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 16),
                    DetailCourseContentCard(
                      index: index,
                      chapterNumber: index + 1,
                      chapterTitle: chapter.title,
                      lessonCount:
                          _sampleLessons.length, // Using sample count for now
                      duration: '18 min', // Placeholder duration
                      lessons: _sampleLessons, // Using sample lessons for now
                      isExpanded: _expandedCardIndex == index,
                      onExpand: () {
                        setState(() {
                          _expandedCardIndex =
                              _expandedCardIndex == index ? -1 : index;
                        });

                        // Optionally load chapter details when expanded
                        if (_expandedCardIndex == index) {
                          context.read<CoursesBloc>().add(
                                CoursesEvent.getChapterByIdRequested(
                                    chapter.id),
                              );
                        }
                      },
                    ),
                  ],
                );
              },
              childCount: _course?.chapter.length ?? 0,
            ),
          ),
        ],

        if (_selectedTabIndex != 1) ...[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.construction,
                    size: 64,
                    color: AppColors.gray,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Under Development',
                    style: getPoppinsMediumStyle16(AppColors.gray),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'This section is not yet available.',
                    style: getPoppinsRegularStyle14(AppColors.gray),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
