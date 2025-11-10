import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';

class AppointmentsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'appointments';

  Future<void> addAppointment(AppointmentModel appointment) async {
    await _firestore
        .collection(_collection)
        .doc(appointment.id)
        .set(appointment.toMap());
  }

  Future<List<AppointmentModel>> getAppointmentsForUser(String userId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('userId', isEqualTo: userId)
        .orderBy('appointmentDate', descending: true)
        .get();

    List<AppointmentModel> userAppointments = snapshot.docs
        .map((doc) => AppointmentModel.fromMap(doc.data()))
        .toList();

    return userAppointments;
  }

  Future<List<AppointmentModel>> getAppointmentsForDoctor(
    String doctorId,
  ) async {
    final snapshot = await _firestore
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
    String newStatus,
  ) async {
    await _firestore.collection(_collection).doc(appointmentId).update({
      'status': newStatus,
    });
  }
}
