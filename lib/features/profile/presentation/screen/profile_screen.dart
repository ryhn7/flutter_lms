import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/di/injection_container.dart';
import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';
import 'package:talent_insider/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:talent_insider/router/app_router.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _showLogoutConfirmation() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.backgroundDark,
        title: Text(
          'Logout',
          style: getPoppinsSemiBoldStyle18(AppColors.white),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: getPoppinsRegularStyle14(AppColors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: getPoppinsMediumStyle14(AppColors.gray),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context
                  .read<AuthenticationBloc>()
                  .add(const AuthenticationEvent.logoutRequested());
              context.goNamed(AppRoutes.login);
            },
            child: Text(
              'Logout',
              style: getPoppinsMediumStyle14(AppColors.primaryRed),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = sl<UserDataStoreRepository>().currentUser;

    return Scaffold(
      backgroundColor: AppColors.backgroundBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile image
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade800,
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Name
                    Text(
                      "${user?.firstName} ${user?.lastName}",
                      style: getPoppinsSemiBoldStyle18(AppColors.white),
                    ),

                    const SizedBox(height: 8),

                    // Email
                    Text(
                      user?.email ?? '',
                      style: getPoppinsRegularStyle12(AppColors.gray),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Updated Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showLogoutConfirmation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: getPoppinsMediumStyle14(AppColors.white),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
