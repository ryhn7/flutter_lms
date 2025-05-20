import 'package:flutter/material.dart';
import 'package:talent_insider/theme/colors.dart';
import 'package:talent_insider/theme/style.dart';

class ChipContent extends StatefulWidget {
  const ChipContent({super.key});

  @override
  State<ChipContent> createState() => _ChipContentState();
}

class _ChipContentState extends State<ChipContent> {
  int _selectedIndex = 0;
  final List<String> _filters = ['For You', 'Recent', 'Trending', 'Technology'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: List.generate(
          _filters.length,
          (index) => Padding(
            padding:
                EdgeInsets.only(right: index != _filters.length - 1 ? 8.0 : 0),
            child: FilterChip(
              selected: _selectedIndex == index,
              label: Text(_filters[index]),
              onSelected: (bool selected) {
                setState(() {
                  _selectedIndex = selected ? index : 0;
                });
              },
              backgroundColor: AppColors.searchBarDark,
              selectedColor: AppColors.primaryRed,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelStyle: _selectedIndex == index ? getPoppinsMediumStyle12(AppColors.white) : getPoppinsRegularStyle12(AppColors.white),
              showCheckmark: false,
              side: const BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
