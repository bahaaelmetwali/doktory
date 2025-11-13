import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String? phone;
  final String? governorate;
  final String? image;
  final String? role;
  final String? specialization;
  final String? address;
  final double? latitude;
  final double? longitude;

  const UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.phone,
    this.governorate,
    this.image,
    this.role,
    this.specialization,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(uid: user.uid, email: user.email ?? '');
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'governorate': governorate,
      'image': image,
      'role': role,
      'specialization': specialization,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': DateTime.now(),
    };
    data.removeWhere((key, value) => value == null);

    return data;
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
      specialization: map['specialization'],
      address: map['address'],
      latitude: map['latitude'] != null ? map['latitude'] * 1.0 : null,
      longitude: map['longitude'] != null ? map['longitude'] * 1.0 : null,
    );
  }
}
