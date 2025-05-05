import 'package:flutter/material.dart';

import '../widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaymentScreenBody(),
    );
  }
}
