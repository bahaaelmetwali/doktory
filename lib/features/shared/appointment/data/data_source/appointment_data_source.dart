import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';

abstract class AppointmentsRemoteDataSource {
  Future<void> addAppointment(AppointmentModel appointment);
  Future<List<AppointmentModel>> getAppointmentsForUser(String userId);
  Future<List<AppointmentModel>> getAppointmentsForDoctor(String doctorId);
  Future<void> updateAppointmentStatus(
    String appointmentId,
    String newStatus, {
    String? rejectionReason,
  });
}

class AppointmentsRemoteDataSourceImpl implements AppointmentsRemoteDataSource {
  final FirebaseFirestore firestore;
  final String _collection = 'appointments';

  AppointmentsRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> addAppointment(AppointmentModel appointment) async {
    await firestore
        .collection(_collection)
        .doc(appointment.id)
        .set(appointment.toMap());
  }

  @override
  Future<List<AppointmentModel>> getAppointmentsForUser(String userId) async {
    final snapshot = await firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('appointmentDate', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => AppointmentModel.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<List<AppointmentModel>> getAppointmentsForDoctor(
    String doctorId,
  ) async {
    final snapshot = await firestore
        .collection(_collection)
        .where('doctorId', isEqualTo: doctorId)
        .orderBy('appointmentDate', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => AppointmentModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> updateAppointmentStatus(
    String appointmentId,
    String newStatus, {
    String? rejectionReason,
  }) async {
    final data = {'status': newStatus};

    if (newStatus == 'مرفوض' && rejectionReason != null) {
      data['rejectionReason'] = rejectionReason;
    }

    await FirebaseFirestore.instance
        .collection('appointments')
        .doc(appointmentId)
        .update(data);
  }
}
