import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage;

  FirebaseStorageService(this._storage);

  Future<String> uploadProfileImage({
    required String uid,
    required File imageFile,
  }) async {
    try {
      final extension = imageFile.path.split('.').last;
      final ref = _storage.ref().child('user_images').child('$uid.$extension');

      await ref.putFile(imageFile);
      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      throw Exception('فشل رفع الصورة إلى Storage: ${e.message}');
    }
  }
}
