import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AuthButton extends StatelessWidget {
  final String labelText;
  final Color backgroundColor;
  final Color outlineColor;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AuthButton(
      {super.key,
      required this.labelText,
      this.onPressed,
      this.isLoading = false,
      this.backgroundColor = AppColors.primaryRed,
      this.outlineColor = AppColors.primaryRed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: outlineColor,
                width: 1,
              ),
            )),
        child: isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              )
            : Text(
                labelText,
                style: getPoppinsSemiBoldStyle16(AppColors.white),
              ),
      ),
    );
  }
}
