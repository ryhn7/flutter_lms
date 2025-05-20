import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class GlobalSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onFilterPressed;
  final ValueChanged<String>? onChanged;

  const GlobalSearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.onFilterPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: getPoppinsRegularStyle16(AppColors.gray),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.primaryRed),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.gray),
          suffixIcon: IconButton(
            icon: const Icon(Icons.filter_alt, color: AppColors.gray),
            onPressed: onFilterPressed,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
        ),
        style: getPoppinsRegularStyle16(AppColors.white),
        cursorColor: AppColors.primaryRed,
      ),
    );
  }
}
