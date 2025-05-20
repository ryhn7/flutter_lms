import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:talent_insider/features/authentication/presentation/widgets/auth_button.dart';
import 'package:talent_insider/features/authentication/presentation/widgets/auth_textfield.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';
import 'package:talent_insider/router/app_router.dart';

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
        const Center(
            child: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 240,
        )),
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
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticated: (user) {
            context.goNamed(AppRoutes.home);
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
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

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
                      enabled: !isLoading,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      labelText: 'Password',
                      controller: _passwordController,
                      obsecureText: true,
                      enabled: !isLoading,
                    ),
                    const SizedBox(height: 40),
                    if (isLoading)
                      const CircularProgressIndicator()
                    else
                      AuthButton(
                        labelText: 'Log In',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(
                                  AuthenticationEvent.loginRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
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
                        // make it snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('This feature is still under development'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
