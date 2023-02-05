import 'package:firebase_auth/firebase_auth.dart';
import 'package:improsso/domain/auth_domain/entities/id.dart';
import 'package:improsso/domain/auth_domain/entities/user.dart';

extension FirebaseUserMapper on User {
  CustomUser toDomain() {
    return CustomUser(id: UniqueID.fromUniqueString(uid));
  }
}
