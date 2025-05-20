import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AuthTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obsecureText;
  final Widget? icon;
  final bool isEmail;

  const AuthTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obsecureText = false,
    this.icon,
    this.isEmail = false,
    this.enabled = true,
  });

  final bool enabled;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obsecureText;
  }

  String? _emailValidator(String? value) {
    // Regular expression for validating email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return '${widget.labelText} cannot be empty';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Returning null indicates that the input is valid.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: getPoppinsMediumStyle16(AppColors.white),
        ),
        const SizedBox(height: 8), // spasi antara label dan input
        TextFormField(
          controller: widget.controller,
          obscureText: _isObscure,
          enabled: widget.enabled,
          style: getPoppinsRegularStyle16(
              widget.enabled ? AppColors.white : AppColors.gray),
          validator: widget.isEmail
              ? _emailValidator
              : (value) {
                  if (value == null || value.isEmpty) {
                    return '${widget.labelText} cannot be empty';
                  }
                  return null;
                },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            hintText: widget.labelText == "Password"
                ? "********"
                : "john@talentinsider.com",
            hintStyle: getPoppinsRegularStyle16(AppColors.gray),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryRed),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryRed),
              borderRadius: BorderRadius.circular(8),
            ),
            errorStyle: getPoppinsRegularStyle14(AppColors.primaryRed),
            suffixIcon: widget.obsecureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.white,
                    ),
                  )
                : widget.icon,
          ),
        ),
      ],
    );
  }
}
