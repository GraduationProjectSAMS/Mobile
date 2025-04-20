import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_bloc_builder.dart';

class DesktopBodyLayout extends StatelessWidget {
  const DesktopBodyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ProductBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
