import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';

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
    await _firestore.collection('users').doc(uid).update(data);
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromMap(doc.data()!);
  }
}
