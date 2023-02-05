import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:improsso/domain/auth_domain/entities/id.dart';

class UserEntity {
  final UniqueID id;
  final String username;
  final String email;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
  });

  factory UserEntity.empty() {
    return UserEntity(
      id: UniqueID(),
      username: "",
      email: "",
    );
  }

  UserEntity copyWith({
    UniqueID? id,
    String? username,
    String? email,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}
