import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/data/models/id_title.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_event.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_state.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_content_card.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_continue_button.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_header.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_tab_bar.dart';
import 'package:talent_insider/router/app_router.dart';
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
  final Map<String, List<IdTitle>> _chapterLessons = {};
  final Set<String> _loadingChapters = {};

  @override
  void initState() {
    super.initState();
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
                debugPrint('Chapter loaded: ${chapter.title}');
                debugPrint('Lesson count: ${chapter.lesson.length}');
                debugPrint('Chapter ID: ${chapter.id}');
                debugPrint('Loading chapters before: $_loadingChapters');

                setState(() {
                  _chapterLessons[chapter.id] = chapter.lesson;
                  _loadingChapters.remove(chapter.id);
                });

                // Force a rebuild after state update
                debugPrint('Loading chapters after: $_loadingChapters');
                debugPrint('Available lessons: ${_chapterLessons.keys}');
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
            // Log the current state for debugging
            debugPrint('Current state: ${state.toString()}');

            return Container(
              color: AppColors.backgroundDark,
              child: Column(
                children: [
                  Expanded(
                    // IMPORTANT: Always show course content once we have a course,
                    // regardless of the current state
                    child: _course != null
                        ? _buildCourseContent()
                        : state.maybeWhen(
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (message) => _buildError(message),
                            orElse: () => const Center(
                                child: CircularProgressIndicator()),
                          ),
                  ),
                  if (_course != null)
                    DetailCourseContinueButton(
                      onPressed: () {
                        // TODO: Handle continue learning
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

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline,
              size: 48, color: AppColors.primaryRed),
          const SizedBox(height: 16),
          Text('Error', style: getPoppinsMediumStyle16(AppColors.white)),
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
                    CoursesEvent.getCourseByIdRequested(widget.courseId),
                  );
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseContent() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.backgroundBlack,
          title: Text('Course Details',
              style: getPoppinsMediumStyle16(AppColors.white)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () => context.pop(),
          ),
        ),
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: AppColors.searchBarDark,
              child: _course?.path.isNotEmpty == true
                  ? Image.network(
                      _course!.path[0].url,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                          'assets/images/thumbnail.png',
                          fit: BoxFit.cover),
                    )
                  : Image.asset('assets/images/thumbnail.png',
                      fit: BoxFit.cover),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: DetailCourseHeader(
            title: _course?.title ?? 'Loading...',
            instructor: _course?.author ?? 'Unknown',
            instructorImagePath: _course?.instructorImageUrl ??
                'assets/images/card_img_placeholder.png',
            duration: _course?.duration ?? 'TBD',
            chapterCount: _course?.chapter.length ?? 0,
            lessonCount:
                _calculateTotalLessonCount(), // Replace hardcoded 0 with this method
            flag: _course?.instructorFlag ?? 'assets/images/flag_idn.png',
            tags: _course?.tags ?? [],
          ),
        ),
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
        if (_selectedTabIndex == 1)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (_course == null || index >= _course!.chapter.length) {
                  return const SizedBox.shrink();
                }
                final chapter = _course!.chapter[index];
                final lessons = _chapterLessons[chapter.id] ?? [];

                // Add debug prints to track the rendering state
                final bool isLoading = _loadingChapters.contains(chapter.id);
                debugPrint(
                    'Rendering card for chapter ${chapter.id}, isLoading: $isLoading, lessons: ${lessons.length}');

                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 16),
                    // Add a ValueKey to force rebuild when loading state changes
                    DetailCourseContentCard(
                      key: ValueKey(
                          '${chapter.id}_${isLoading}_${lessons.length}'),
                      index: index,
                      chapterNumber: index + 1,
                      chapterTitle: chapter.title,
                      lessonCount: lessons.length,
                      duration: 'TBD',
                      lessons: lessons,
                      isExpanded: _expandedCardIndex == index,
                      isLoading: isLoading,
                      onPressed: () {
                        // Handle lesson tap
                        if (_expandedCardIndex >= 0 && lessons.isNotEmpty) {
                          context.goNamed(
                              AppRoutes.lessonPlaying,
                              pathParameters: {'id': lessons[0].id},
                            );
                        }
                      },
                      onExpand: () {
                        final bool wasExpanded = _expandedCardIndex == index;

                        // Execute in the next frame to avoid build conflicts
                        Future.microtask(() {
                          setState(() {
                            _expandedCardIndex = wasExpanded ? -1 : index;
                          });

                          if (!wasExpanded &&
                              !_chapterLessons.containsKey(chapter.id)) {
                            debugPrint('Requesting chapter: ${chapter.id}');

                            setState(() {
                              _loadingChapters.add(chapter.id);
                            });

                            context.read<CoursesBloc>().add(
                                  CoursesEvent.getChapterByIdRequested(
                                      chapter.id),
                                );
                          }
                        });
                      },
                    ),
                  ],
                );
              },
              childCount: _course?.chapter.length ?? 0,
            ),
          ),
        if (_selectedTabIndex != 1)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.construction,
                      size: 64, color: AppColors.gray),
                  const SizedBox(height: 16),
                  Text('Under Development',
                      style: getPoppinsMediumStyle16(AppColors.gray)),
                  const SizedBox(height: 4),
                  Text('This section is not yet available.',
                      style: getPoppinsRegularStyle14(AppColors.gray)),
                ],
              ),
            ),
          ),
      ],
    );
  }

  int _calculateTotalLessonCount() {
    // Calculate the total number of lessons across all chapters
    if (_course == null) return 0;
    
    int total = 0;
    for (var chapter in _course!.chapter) {
      // Use _chapterLessons map to get lesson count if available
      // Otherwise default to 0
      total += _chapterLessons[chapter.id]?.length ?? 0;
    }
    return total;
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
