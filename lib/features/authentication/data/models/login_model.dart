import 'package:graduation_project/features/authentication/domain/entity/login_entity.dart';

class LoginModel {
  LoginModel({
    this.data,
  });

  LoginModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;
}

class Data extends LoginEntity {
  Data({
    this.modeId,
    this.name,
    this.username,
    this.modelToken,
  }) : super(token: modelToken ?? '', id: modeId?.toInt() ?? 0);

  factory Data.fromJson(dynamic json) {
    return Data(
      modeId: json['id'],
      name: json['name'],
      username: json['username'],
      modelToken: json['token'],
    );
  }

  num? modeId;
  String? name;
  String? username;
  String? modelToken;
}
