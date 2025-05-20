import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class AudioInfoSection extends StatelessWidget {
  const AudioInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'The Psychology of Money',
            style: getPoppinsSemiBoldStyle20(AppColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Morgan Housel',
            style: getPoppinsRegularStyle14(AppColors.gray),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMetadataItem(Icons.headphones, '3.5h'),
              _buildDivider(),
              _buildMetadataItem(Icons.bookmark_border, '256'),
              _buildDivider(),
              _buildMetadataItem(Icons.share_outlined, '126'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetadataItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.gray, size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: getPoppinsRegularStyle12(AppColors.gray),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 4,
        width: 4,
        decoration: const BoxDecoration(
          color: AppColors.gray,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
