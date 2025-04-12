import 'package:flutter/material.dart';

import '../widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductDetailsScreenBody(),
    );
  }
}
