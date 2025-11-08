import 'dart:io';
import 'package:doktory/features/shared/auth/data/data_source/firestore_user_service.dart';
import 'package:doktory/features/shared/auth/data/data_source/firebase_storage_service.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

class UserRemoteDataSource {
  final FirestoreUserService firestoreUserService;
  final FirebaseStorageService firebaseStorageService;

  UserRemoteDataSource({
    required this.firestoreUserService,
    required this.firebaseStorageService,
  });

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

  Future<String> uploadProfileImage({
    required String uid,
    required File imageFile,
  }) async {
    return await firebaseStorageService.uploadProfileImage(
      uid: uid,
      imageFile: imageFile,
    );
  }
}
