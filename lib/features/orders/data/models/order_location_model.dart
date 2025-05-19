import '../../domain/entities/order_location_entity.dart';

class OrderLocationModel {
  OrderLocationModel({
    this.phoneNo,
    this.location,
    this.address,
    this.city,
    this.buildingNo,
    this.floorNo,
    this.apartmentNo,
    this.streetName,
  });

  OrderLocationModel.fromJson(dynamic json) {
    json ??= {};
    phoneNo = json['phone_no'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address = json['address'];
    city = json['city'];
    buildingNo = json['building_no'];
    floorNo = json['floor_no'];
    apartmentNo = json['apartment_no'];
    streetName = json['street_name'];
  }

  String? phoneNo;
  Location? location;
  String? address;
  String? city;
  String? buildingNo;
  String? floorNo;
  String? apartmentNo;
  String? streetName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_no'] = phoneNo;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['address'] = address;
    map['city'] = city;
    map['building_no'] = buildingNo;
    map['floor_no'] = floorNo;
    map['apartment_no'] = apartmentNo;
    map['street_name'] = streetName;
    return map;
  }

  OrderLocationEntity get toEntity {
    return OrderLocationEntity(
      orderAddress: address ?? '',
      orderCity: city ?? '',
      orderStreetName: streetName ?? '',
      orderBuildingNo: buildingNo ?? '',
      orderFloorNo: floorNo ?? '',
      orderApartmentNo: apartmentNo ?? '',
    );
  }
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  num? lat;
  num? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
