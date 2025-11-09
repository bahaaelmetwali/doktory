import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

class FirestoreDoctorService {
  final FirebaseFirestore firestore;

  FirestoreDoctorService(this.firestore);

  Future<List<UserModel>> getDoctors() async {
    final snapshot = await firestore
        .collection('users')
        .where('role', isEqualTo: 'دكتور')
        .get();

    return snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
  }
}
