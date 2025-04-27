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
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? name;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserEntity get toEntity {
    return UserEntity(
      id: id?.toInt() ?? 0,
      name: name.toString(),
      email: email.toString(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/social-vape.appspot.com/o/r2eN3MVrYKZBLkIUq9529uAjHLm2%2FuserProfilePhoto%2Fimage_cropper_1692455002427.jpg?alt=media&token=8e2e1db9-de01-42ff-8e60-39e0d0a9abae',
    );
  }
}
