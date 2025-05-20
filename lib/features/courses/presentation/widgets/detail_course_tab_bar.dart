import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class DetailCourseTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const DetailCourseTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(tabs.length, (index) {
        final bool isSelected = index == selectedIndex;
    
        return GestureDetector(
          onTap: () => onTabSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            margin: EdgeInsets.only(right: index < tabs.length - 1 ? 16 : 0),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.backgroundDark : Colors.transparent,
              borderRadius: isSelected
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )
                  : BorderRadius.zero,
            ),
            child: Text(
              tabs[index],
              style: isSelected
                  ? getPoppinsSemiBoldStyle14(AppColors.white)
                  : getPoppinsMediumStyle14(AppColors.gray),
            ),
          ),
        );
      }),
    );
  }
}
