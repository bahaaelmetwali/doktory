import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  final String id;
  final String doctorId;
  final String userId;
  final String doctorName;
  final String? userName;
  final DateTime appointmentDate;
  final String status;
  final DateTime createdAt;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.userId,
    required this.doctorName,
    this.userName,
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
      'userName': userName,
      'appointmentDate': appointmentDate,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'],
      doctorId: map['doctorId'],
      userId: map['userId'],
      doctorName: map['doctorName'],
      userName: map['userName'],
      appointmentDate: (map['appointmentDate'] as Timestamp).toDate(),
      status: map['status'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
