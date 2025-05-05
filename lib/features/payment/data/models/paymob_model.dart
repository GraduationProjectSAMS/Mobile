class PayMobRequestModel {
  final int amount;
  final String currency;
  final List<dynamic> paymentMethods;
  final BillingData billingData;

  PayMobRequestModel({
    required this.amount,
    required this.currency,
    required this.paymentMethods,
    required this.billingData,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'payment_methods': paymentMethods,
      'billing_data': billingData.toJson(),
    };
  }
}

class BillingData {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  BillingData({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }
}
