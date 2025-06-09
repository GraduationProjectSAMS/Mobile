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

class Data {
  Data({
    this.modeId,
    this.name,
    this.username,
    this.modelToken,
    this.roleName,
  });

  factory Data.fromJson(dynamic json) {
    return Data(
      modeId: json['id'],
      name: json['name'],
      username: json['username'],
      modelToken: json['token'],
      roleName: json['role_name'],
    );
  }

  LoginEntity get toEntity {
    return LoginEntity(
      token: modelToken ?? '',
      id: modeId?.toInt() ?? 0,
      roleName: roleName ?? '',
    );
  }

  num? modeId;
  String? name;
  String? username;
  String? modelToken;
  String? roleName;
}
