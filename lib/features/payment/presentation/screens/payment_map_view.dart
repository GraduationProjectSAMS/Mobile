import 'package:flutter/material.dart';

import '../../../../core/widgets/my_app_bar.dart';
import '../widgets/payment_map_view_body.dart';

class PaymentMapView extends StatelessWidget {
  const PaymentMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 10,
        title: const MyAppBar(title: 'Pick a Location'),
      ),
      body: const PaymentMapViewBody(),
    );
  }
}
