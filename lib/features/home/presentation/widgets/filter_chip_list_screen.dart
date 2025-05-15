import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

class FilterChipListScreen extends StatefulWidget {
  const FilterChipListScreen({super.key});

  @override
  FilterChipListScreenState createState() => FilterChipListScreenState();
}

class FilterChipListScreenState extends State<FilterChipListScreen> {
  // List of all chip options
  final List<String> _filters = [
    'Living',
    'Office',
    'Tables',
    'Modern',
    'Classic',
    'Seats',
  ];

  // Set to hold selected filters
  final Set<String> _selectedFilters = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.sp,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = _selectedFilters.contains(filter);

          return FilterChip(
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
            label: Text(filter),
            labelStyle: AppStyles.textStyle15.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            selected: isSelected,
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  _selectedFilters.add(filter);
                } else {
                  _selectedFilters.remove(filter);
                }
              });
            },
            selectedColor: AppColors.primary,
            checkmarkColor: AppColors.white,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
