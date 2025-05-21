import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/core/widgets/global_search_bar.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_event.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_state.dart';
import 'package:talent_insider/features/courses/presentation/widgets/course_card.dart';
import 'package:talent_insider/features/courses/presentation/widgets/course_chip_content.dart';
import 'package:talent_insider/router/app_router.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              color: AppColors.backgroundDark,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => context.pop(),
                    ),
                    Expanded(
                      child: Text(
                        'Courses',
                        style: getPoppinsMediumStyle16(AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Menu button pressed',
                                style:
                                    getPoppinsRegularStyle14(AppColors.white)),
                            duration: const Duration(seconds: 2),
                            backgroundColor: AppColors.backgroundCardDark,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: GlobalSearchBar(
                hintText: 'Title, mentor, or keywords...',
                onFilterPressed: () {
                  // Will implement filter later
                },
                onChanged: (value) {
                  // Will implement search later
                },
              ),
            ),

            // Chips Filter
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ChipContent(),
            ),

            // Course List
            Expanded(
              child: BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () {
                      context.read<CoursesBloc>().add(
                            const CoursesEvent.getCoursesRequested(),
                          );
                      return const Center(child: CircularProgressIndicator());
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
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
                                    const CoursesEvent.getCoursesRequested(),
                                  );
                            },
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    ),
                    coursesLoaded: (coursesResponse) {
                      if (coursesResponse.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.school_outlined,
                                  size: 48, color: AppColors.gray),
                              const SizedBox(height: 16),
                              Text(
                                'No Courses Found',
                                style: getPoppinsMediumStyle16(AppColors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try adjusting your filters or search',
                                style: getPoppinsRegularStyle14(AppColors.gray),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: coursesResponse.length,
                        itemBuilder: (context, index) {
                          final course = coursesResponse[index];
                          return CourseCard(
                            title: course.title,
                            instructor: course.author ?? 'John Doe',
                            description: course.description ??
                                'No description available',
                            level: course.level ?? 'All Levels',
                            tags: course.tags ?? const ['General'],
                            thumbnailPath: course.path[0].url,
                            instructorImagePath: course.instructorImageUrl ??
                                'assets/images/instructor_placeholder.png',
                            duration: course.duration ?? 'TBD',
                            isNew: course.isNew ?? false,
                            flag: course.instructorFlag ??
                                'assets/images/flag_idn.png',
                            lessonCount: course.chapter.length,
                            // onPressed: () => (),
                            onPressed: () => context.goNamed(
                              AppRoutes.detailCourse,
                              pathParameters: {'id': course.id},
                            ),
                          );
                        },
                      );
                    },
                    orElse: () => const Center(
                      child: Text('Something went wrong'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
