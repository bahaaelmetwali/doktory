import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  final String id;
  final String doctorId;
  final String userId;
  final String doctorName;
  final String? specialization;
  final DateTime appointmentDate;
  final String status;
  final DateTime createdAt;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.doctorName,
    required this.specialization,
    required this.appointmentDate,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'doctorId': doctorId,
      'userId': userId,
      'doctorName': doctorName,
      'specialization': specialization,
      'appointmentDate': appointmentDate,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] ?? '',
      doctorId: map['doctorId'] ?? '',
      userId: map['userId'] ?? '',
      doctorName: map['doctorName'] ?? '',
      specialization: map['specialization'],
      appointmentDate: (map['appointmentDate'] as Timestamp).toDate(),
      status: map['status'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
