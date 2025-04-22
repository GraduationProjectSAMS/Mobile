import 'package:flutter/material.dart';
import 'package:graduation_project/features/product_details/presentation/widgets/product_details_screen_body_desktop.dart';

import '../../../../core/widgets/app_adaptive_lay_out.dart';
import '../widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AppAdaptiveLayOut(
        mobileLayOut: (BuildContext context) => const ProductDetailsScreenBody(),
        desktopLayOut: (BuildContext context) => const ProductDetailsScreenBodyDesktop(),
      ),
    );
  }
}
