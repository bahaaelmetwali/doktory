import 'package:doktory/features/shared/auth/data/data_source/firestore_user_service.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

class UserRemoteDataSource {
  final FirestoreUserService firestoreUserService;

  UserRemoteDataSource({required this.firestoreUserService});

  Future<void> createUser(UserModel user) async {
    await firestoreUserService.createUser(user);
  }

  Future<void> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    await firestoreUserService.updateUser(uid: uid, data: data);
  }

  Future<UserModel?> getUser({required String uid}) async {
    return await firestoreUserService.getUser(uid: uid);
  }
}
