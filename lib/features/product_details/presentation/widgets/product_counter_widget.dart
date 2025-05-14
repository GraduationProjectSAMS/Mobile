import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter({
    super.key,
    required this.title,
    required this.onAdd,
    required this.onRemove,
  });

  final String title;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconButton(Icons.remove, onRemove),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ),
          _buildIconButton(Icons.add, onAdd),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(icon, size: 17.sp),
        ),
      ),
    );
  }
}
