import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/core/utils/navigation_utils.dart';
import 'package:talent_insider/core/widgets/global_search_bar.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/more_book_tile.dart';
import 'package:talent_insider/features/audio_book/presentation/widgets/vertical_book_card.dart';
import 'package:talent_insider/router/app_router.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AudioBookScreen extends StatelessWidget {
  const AudioBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Container(
              color: AppColors.backgroundCardDark,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => NavigationUtils.safeBack(context,
                          fallbackRoute: AppPaths.home),
                    ),
                    Expanded(
                      child: Text(
                        'Audio Book',
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
                hintText: 'Search keywords...',
                onFilterPressed: () {
                  // Open filter dialog
                },
                onChanged: (value) {
                  // Handle live search
                },
              ),
            ),
            const SizedBox(height: 24),

            // Best-sellers section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Best-sellers',
                style: getPoppinsSemiBoldStyle18(AppColors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Horizontal list of vertical book cards
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.3 * 1.5 + 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  VerticalBookCard(
                    coverImage: 'assets/images/thumbnail.png',
                    title: 'The Power of Habit',
                    author: 'Kev Freeman',
                    onTap: () {
                      context.pushNamed(AppRoutes.detailAudioBook);
                    },
                  ),
                  VerticalBookCard(
                    coverImage: 'assets/images/thumbnail.png',
                    title: '5 Types of Psychological Manipulation',
                    author: 'Meg Mason',
                    onTap: () {
                      context.pushNamed(AppRoutes.detailAudioBook);
                    },
                  ),
                  VerticalBookCard(
                    coverImage: 'assets/images/thumbnail.png',
                    title: 'The Swallow',
                    author: 'Lisa Lutz',
                    onTap: () {
                      context.pushNamed(AppRoutes.detailAudioBook);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // More Books section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'More Books',
                style: getPoppinsSemiBoldStyle18(AppColors.white),
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView.separated(
                itemCount: 3,
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
                  final items = [
                    MoreBookTile(
                      coverImage: 'assets/images/thumbnail.png',
                      title: 'Good to Great',
                      author: 'Deena Roberts',
                      chapters: '16',
                      duration: '45 min',
                      onTap: () {
                        context.pushNamed(AppRoutes.detailAudioBook);
                      },
                    ),
                    MoreBookTile(
                      coverImage: 'assets/images/thumbnail.png',
                      title: 'The Ninth Life',
                      author: 'Taylor B. Barton',
                      chapters: '16',
                      duration: '45 min',
                      onTap: () {
                        context.pushNamed(AppRoutes.detailAudioBook);
                      },
                    ),
                    MoreBookTile(
                      coverImage: 'assets/images/thumbnail.png',
                      title: 'Nobody Knows But You',
                      author: 'Anica Mrose Rissi',
                      chapters: '16',
                      duration: '45 min',
                      isBookmarked: true,
                      onTap: () {
                        context.pushNamed(AppRoutes.detailAudioBook);
                      },
                    ),
                  ];

                  return items[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
