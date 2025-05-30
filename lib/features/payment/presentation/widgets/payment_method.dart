import 'package:flutter/material.dart';

enum PaymentMethod {
  cash(
    value: 'COD',
    label: 'Cash on Delivery',
    icon: Icons.payments,
  ),
  visa(
    value: 'CC',
    label: 'Credit Card',
    icon: Icons.credit_card,
  );

  final String value;

  /// For displaying in the UI
  final String label;

  /// Icon to show alongside the option
  final IconData icon;

  const PaymentMethod({
    required this.value,
    required this.label,
    required this.icon,
  });

  /// Reverse‐lookup by stored code, with a sensible default
  static PaymentMethod fromValue(String code) {
    return PaymentMethod.values.firstWhere(
      (m) => m.value == code,
      orElse: () => PaymentMethod.cash,
    );
  }

  /// Reverse‐lookup by index (if you really need it)
  static PaymentMethod fromIndex(int index) {
    if (index < 0 || index >= PaymentMethod.values.length) {
      return PaymentMethod.cash;
    }
    return PaymentMethod.values[index];
  }
}
