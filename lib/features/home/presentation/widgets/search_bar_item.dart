import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundDark,
        hintText: 'Courses, Insights or Events',
        hintStyle: getPoppinsRegularStyle16(AppColors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.white),
      ),
    );
  }
}
