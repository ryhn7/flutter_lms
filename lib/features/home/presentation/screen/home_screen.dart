import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/home/presentation/widgets/home_bottom_navbar.dart';
import 'package:talent_insider/features/home/presentation/widgets/home_circle_item.dart';
import 'package:talent_insider/features/home/presentation/widgets/search_bar_item.dart';
import 'package:talent_insider/router/app_router.dart';
import 'package:talent_insider/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Content utama
          Column(
            children: [
              Container(
                height: 148, // termasuk ruang untuk search bar overlap
                color: AppColors.primaryRed,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 44),
                child: Image.asset(
                  'assets/images/talent_insider_learning.png',
                  height: 32,
                ),
              ),
              const SizedBox(height: 44), // jarak setelah search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    HomeCircleItem(
                      icon: Icons.subscriptions,
                      label: 'Courses',
                      onPressed: () {
                        context.goNamed(AppRoutes.courses);
                      },
                    ),
                    const SizedBox(width: 24),
                    HomeCircleItem(
                      icon: Icons.playlist_play,
                      label: 'Audio Book',
                      onPressed: () {
                        context.goNamed(AppRoutes.audioBook);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Search bar positioned mengambang
          const Positioned(
            top: 120, // posisi tepat di bawah AppBar (atau sesuaikan)
            left: 16,
            right: 16,
            child: SearchBarItem(),
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
