import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/authentication/presentation/widgets/auth_button.dart';
import 'package:talent_insider/features/authentication/presentation/widgets/auth_textfield.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

import '../../../../router/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {}
  }

  Widget _buildDividerLoginAlternate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: AppColors.divider,
            height: 1,
            thickness: 1,
            indent: 16,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          "Or",
          style: getPoppinsRegularStyle14(AppColors.white),
        ),
        const SizedBox(width: 12),
        const Flexible(
          child: Divider(
            color: AppColors.divider,
            height: 1,
            thickness: 1,
            endIndent: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: Image(image: AssetImage('assets/images/logo.png'), width: 240,)),
        const SizedBox(height: 104),
        Text(
          "Welcome Back!",
          style: getPoppinsMediumStyle32(AppColors.white),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 8),
        Text(
          "Login to your account",
          style: getPoppinslightStyle18(AppColors.gray),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                AuthTextField(
                  labelText: 'E-mail',
                  controller: _emailController,
                  isEmail: true,
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obsecureText: true,
                ),
                const SizedBox(height: 40),
                AuthButton(
                  labelText: 'Log In',
                  onPressed: () {
                    context.goNamed(AppRoutes.home);
                  },
                ),
                const SizedBox(height: 16),
                _buildDividerLoginAlternate(),
                const SizedBox(height: 16),
                AuthButton(
                  labelText: 'Explore without login',
                  backgroundColor: Colors.transparent,
                  outlineColor: AppColors.white,
                  onPressed: () {
                    context.goNamed(AppRoutes.home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
