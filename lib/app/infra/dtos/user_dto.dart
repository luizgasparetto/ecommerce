// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ecommerce/app/domain/entities/users_entity.dart';

class UserDTO extends UserEntity {
  final String username;
  final String password;
  final String profileImgUrl;

  UserDTO({required this.username, required this.password, required this.profileImgUrl})
      : super(username: username, password: password, profileImgUrl: profileImgUrl);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'profileImgUrl': profileImgUrl,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      profileImgUrl: map['profileImgUrl'] ?? '',
    );
  }
}
