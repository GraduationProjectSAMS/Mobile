class OrderLocationEntity {
  final String orderAddress;
  final String orderCity;
  final String orderStreetName;
  final String orderBuildingNo;
  final String orderFloorNo;
  final String orderApartmentNo;

  OrderLocationEntity(
      {required this.orderAddress,
      required this.orderCity,
      required this.orderStreetName,
      required this.orderBuildingNo,
      required this.orderFloorNo,
      required this.orderApartmentNo});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderLocationEntity &&
          runtimeType == other.runtimeType &&
          orderAddress == other.orderAddress &&
          orderCity == other.orderCity &&
          orderStreetName == other.orderStreetName &&
          orderBuildingNo == other.orderBuildingNo &&
          orderFloorNo == other.orderFloorNo &&
          orderApartmentNo == other.orderApartmentNo;

  @override
  int get hashCode =>
      orderAddress.hashCode ^
      orderCity.hashCode ^
      orderStreetName.hashCode ^
      orderBuildingNo.hashCode ^
      orderFloorNo.hashCode ^
      orderApartmentNo.hashCode;
}
