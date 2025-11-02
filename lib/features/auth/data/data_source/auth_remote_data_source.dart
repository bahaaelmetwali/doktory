import 'package:doktory/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuthService authService;

  AuthRemoteDataSource(this.authService);

  Future<User?> register({required String email, required String password}) {
    return authService.registerWithEmail(email: email, password: password);
  }

  Future<User?> login(String email, String password) {
    return authService.loginWithEmail(email: email, password: password);
  }

  Future<void> logout() {
    return authService.signOut();
  }

  User? getCurrentUser() {
    return authService.getCurrentUser();
  }
}
