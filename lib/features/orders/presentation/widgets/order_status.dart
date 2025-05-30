enum OrderStatus {
  ordered(label: 'Ordered', value: 'Pending'),
  received(label: 'Received', value: 'in Progress'),
  onTheWay(label: 'On the Way', value: 'Shipped'),
  delivered(label: 'Delivered', value: 'Delivered'),
  ;

  final String value;

  /// For displaying in the UI
  final String label;

  static OrderStatus fromValue(String code) {
    return OrderStatus.values.firstWhere(
      (status) => status.value == code,
      orElse: () => OrderStatus.ordered,
    );
  }

  const OrderStatus({required this.value, required this.label});
}
