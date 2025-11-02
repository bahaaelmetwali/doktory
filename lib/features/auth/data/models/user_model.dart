import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String? phone;
  final String? governorate;
  final String? image;
  final String? role;

  UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.phone,
    this.governorate,
    this.image,
    this.role,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name ?? '',
      'phone': phone ?? '',
      'governorate': governorate ?? '',
      'image': image ?? '',
      'role': role ?? '',
      'createdAt': DateTime.now(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'],
      phone: map['phone'],
      governorate: map['governorate'],
      image: map['image'],
      role: map['role'],
    );
  }
}