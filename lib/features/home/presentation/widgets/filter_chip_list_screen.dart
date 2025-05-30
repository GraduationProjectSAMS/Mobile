import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';

class FilterChipList extends StatefulWidget {
  /// The list of filter labels to display
  final List<String> filters;

  /// Callback triggered when the selected filter changes (or is cleared)
  final ValueChanged<String?> onSelectionChanged;

  /// Optional initial selected filter
  final String? initialSelected;

  const FilterChipList({
    super.key,
    required this.filters,
    required this.onSelectionChanged,
    this.initialSelected,
  });

  @override
  FilterChipListState createState() => FilterChipListState();
}

class FilterChipListState extends State<FilterChipList> {
  String? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.filters.map((filter) {
        final isSelected = _selectedFilter == filter;
        return FilterChip(
          label: Text(filter),
          showCheckmark: false,
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          labelStyle: AppStyles.textStyle15.copyWith(
            color: isSelected ? AppColors.white : AppColors.black,
          ),
          selected: isSelected,
          selectedColor: AppColors.primary,
          checkmarkColor: AppColors.white,
          onSelected: (bool selected) {
            setState(() {
              _selectedFilter = selected ? filter : null;
            });
            widget.onSelectionChanged(_selectedFilter);
          },
        );
      }).toList(),
    );
  }
}
