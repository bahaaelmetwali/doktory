import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserModel user);
  Future<void> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  });
  Future<UserModel?> getUser({required String uid});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> createUser(UserModel user) async {
    await firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  @override
  Future<void> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .set(data, SetOptions(merge: true));
  }

  @override
  Future<UserModel?> getUser({required String uid}) async {
    final doc = await firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromMap(doc.data()!);
  }
}
