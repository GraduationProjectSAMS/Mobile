import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

class UserModel {
  UserModel({
    this.message,
    this.data,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? message;
  Data? data;
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['photo_url'];
  }

  num? id;
  String? name;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? image;

  UserEntity get toEntity {
    return UserEntity(
      id: id?.toInt() ?? 0,
      name: name.toString(),
      email: email.toString(),
      image: image ??
          'https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-1906669723.jpg',
    );
  }
}
