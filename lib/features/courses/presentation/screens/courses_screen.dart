import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/core/widgets/global_search_bar.dart';
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
                      onPressed: () => Navigator.pop(context),
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
                      onPressed: () {},
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
                  // Open filter dialog
                },
                onChanged: (value) {
                  // Handle live search
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
              child: ListView(
                children: [
                  CourseCard(
                    title: 'Figma UX Design UI Essential Course',
                    instructor: 'David Rockwell',
                    description:
                        "Sales Hacking: Essential sales skills, sales strategies and sales techniques to sell just about anything!",
                    level: 'Beginner',
                    tags: const ['Design'],
                    thumbnailPath: 'assets/images/card_img_placeholder.png',
                    instructorImagePath:
                        'assets/images/card_img_placeholder.png',
                    duration: '1:20:10',
                    isNew: true,
                    flag: 'assets/images/flag_idn.png',
                    lessonCount: 16,
                    onPressed: () => context.goNamed(AppRoutes.lessonPlaying),
                  ),
                  const CourseCard(
                    title:
                        'ChatGPT & Midjourney: 23 Ways of Earning Money with AI',
                    instructor: 'Diego Davila',
                    level: 'Intermediate',
                    tags: ['AI'],
                    // thumbnailPath: 'assets/images/course_ai.png',
                    duration: '30:15',
                    isNew: true,
                    // flag: 'assets/images/flag_spain.png',
                    lessonCount: 3,
                  ),
                  const CourseCard(
                    title: 'Sales Training: Practical Sales Techniques',
                    instructor: 'Chriss Crott',
                    level: 'Advanced',
                    tags: ['Sales'],
                    // thumbnailPath: 'assets/images/course_sales.png',
                    duration: '1:20:10',
                    // flag: 'assets/images/flag_indonesia.png',
                    lessonCount: 16,
                  ),
                  const CourseCard(
                    title: 'Membuat Toko Online dengan Laravel 10',
                    instructor: 'Binus University',
                    level: 'Beginner',
                    tags: ['Laravel'],
                    // thumbnailPath: 'assets/images/course_laravel.png',
                    duration: '1:20:10',
                    // flag: 'assets/images/flag_indonesia.png',
                    lessonCount: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
