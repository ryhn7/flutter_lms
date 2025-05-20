import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:talent_insider/features/home/presentation/widgets/home_bottom_navbar.dart';
import 'package:talent_insider/features/home/presentation/widgets/home_circle_item.dart';
import 'package:talent_insider/features/home/presentation/widgets/search_bar_item.dart';
import 'package:talent_insider/router/app_router.dart';
import 'package:talent_insider/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    if (index == 2) {
      _showLogoutConfirmation();
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _performLogout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _performLogout() {
    context
        .read<AuthenticationBloc>()
        .add(const AuthenticationEvent.logoutRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () {
            context.goNamed(AppRoutes.login);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Content utama
            Column(
              children: [
                Container(
                  height: 148,
                  color: AppColors.primaryRed,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 44),
                  child: Image.asset(
                    'assets/images/talent_insider_learning.png',
                    height: 32,
                  ),
                ),
                const SizedBox(height: 44),
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

            const Positioned(
              top: 120,
              left: 16,
              right: 16,
              child: SearchBarItem(),
            ),
          ],
        ),
        bottomNavigationBar: HomeBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onNavTap,
        ),
      ),
    );
  }
}
