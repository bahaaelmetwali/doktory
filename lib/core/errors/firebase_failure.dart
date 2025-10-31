import 'package:doktory/core/errors/Failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errorMessage);

  factory FirebaseFailure.fromAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return FirebaseFailure('Invalid email format.');
      case 'user-disabled':
        return FirebaseFailure('This user has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found with this email.');
      case 'wrong-password':
        return FirebaseFailure('Incorrect password.');
      case 'email-already-in-use':
        return FirebaseFailure('This email is already registered.');
      case 'weak-password':
        return FirebaseFailure('Password is too weak.');
      default:
        return FirebaseFailure('An unknown authentication error occurred.');
    }
  }

  factory FirebaseFailure.fromFirestore(FirebaseException e) {
    return FirebaseFailure(e.message ?? 'Firestore error occurred.');
  }

  factory FirebaseFailure.fromStorage(FirebaseException e) {
    return FirebaseFailure(e.message ?? 'Storage error occurred.');
  }
}
