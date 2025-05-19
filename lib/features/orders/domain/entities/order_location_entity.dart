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
}
