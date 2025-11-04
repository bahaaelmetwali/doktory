import 'package:doktory/features/auth/data/data_source/firestore_user_service.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';

class UserRemoteDataSource {
  final FirestoreUserService firestoreUserService;

  UserRemoteDataSource(this.firestoreUserService);

  Future<void> createUser(UserModel user) async {
    await firestoreUserService.createUser(user);
  }

  Future<void> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await firestoreUserService.updateUser(uid: uid, data: data);
  }

  Future<UserModel?> getUser(String uid) async {
    return await firestoreUserService.getUser(uid);
  }
}
