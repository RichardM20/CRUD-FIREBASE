import 'package:crud_firebase/domain/models/user_response_model.dart';

abstract class AuthRepository {
  Future<UserAuthResponse?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserAuthResponse?> signUpWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
}
