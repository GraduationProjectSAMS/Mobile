enum OrderStatus {
  ordered(label: 'Ordered', value: 1),
  received(label: 'Received', value: 2),
  onTheWay(label: 'Out For Delivery', value: 3),
  delivered(label: 'Delivered', value: 4),
  ;

  final int value;

  /// For displaying in the UI
  final String label;

  static OrderStatus fromIndex(int code) {
    return OrderStatus.values.firstWhere(
      (status) => status.value == code,
      orElse: () => OrderStatus.ordered,
    );
  }

  const OrderStatus({required this.value, required this.label});
}
