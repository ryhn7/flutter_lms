import 'package:flutter/material.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_content_card.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_continue_button.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_header.dart';
import 'package:talent_insider/features/courses/presentation/widgets/detail_course_tab_bar.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class DetailCourseScreen extends StatefulWidget {
  const DetailCourseScreen({super.key});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  int _selectedTabIndex = 0;
  int _expandedCardIndex = -1;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundDark,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
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
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    // Thumbnail image
                    SliverToBoxAdapter(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          color: AppColors.searchBarDark,
                          child: Image.asset(
                            'assets/images/thumbnail.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // Course header section with padding
                    const SliverToBoxAdapter(
                      child: DetailCourseHeader(
                        title: 'Figma UX Design UI Essential Course',
                        instructor: 'David Rockwell',
                        instructorImagePath:
                            'assets/images/card_img_placeholder.png',
                        duration: '10h 30m',
                        chapterCount: 10,
                        lessonCount: 48,
                        flag: 'assets/images/flag_idn.png',
                        tags: ['Design', 'Figma'],
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
                            tabs: const [
                              'Overview',
                              'Contents',
                              'More Like This'
                            ],
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

                    // SliverToBoxAdapter(
                    //   child: Container(
                    //     height: 12,
                    //     color: AppColors.backgroundCardDark,
                    //   ),
                    // ),

                    // Tab content
                    if (_selectedTabIndex == 1) ...[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              children: [
                                if (index == 0) const SizedBox(height: 16),
                                DetailCourseContentCard(
                                  index: index,
                                  chapterNumber: index + 1,
                                  chapterTitle:
                                      'Introduction to the ChatGPT & Midjourney Course',
                                  lessonCount: _sampleLessons.length,
                                  duration: '18 min',
                                  lessons: _sampleLessons,
                                  isExpanded: _expandedCardIndex == index,
                                  onExpand: () {
                                    setState(() {
                                      _expandedCardIndex =
                                          _expandedCardIndex == index
                                              ? -1
                                              : index;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                          childCount: 4,
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
                ),
              ),

              // Continue Button
              DetailCourseContinueButton(
                onPressed: () {
                  // Handle continue learning
                },
              ),
            ],
          ),
        ),
      ),
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
