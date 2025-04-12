import 'package:flutter/material.dart';

class ProductColorSelector extends StatefulWidget {
  final List<Color> availableColors;
  final Color? initialColor;
  final ValueChanged<Color> onColorSelected;

  const ProductColorSelector({
    Key? key,
    required this.availableColors,
    this.initialColor,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  State<ProductColorSelector> createState() => _ProductColorSelectorState();
}

class _ProductColorSelectorState extends State<ProductColorSelector> {
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor ?? widget.availableColors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.availableColors.map((color) {
        final isSelected = color == selectedColor;
        return GestureDetector(
          onTap: () {
            setState(() => selectedColor = color);
            widget.onColorSelected(color);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Colors.brown.shade800, width: 2)
                  : null,
            ),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: color,
            ),
          ),
        );
      }).toList(),
    );
  }
}
