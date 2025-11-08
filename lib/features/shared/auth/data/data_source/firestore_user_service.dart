import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

class FirestoreUserService {
  final FirebaseFirestore _firestore;
  FirestoreUserService(this._firestore);

  Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<void> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .set(data, SetOptions(merge: true));
  }

  Future<UserModel?> getUser({required String uid}) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromMap(doc.data()!);
  }
}
