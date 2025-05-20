import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class HomeCircleItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const HomeCircleItem({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryRed,
            ),
            child: Center(
                child: Icon(
              icon,
              color: AppColors.white,
              size: 32,
            )),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: getPoppinsRegularStyle12(AppColors.white),
          ),
        ],
      ),
    );
  }
}
