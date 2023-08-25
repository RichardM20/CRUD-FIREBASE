import 'package:crud_firebase/domain/models/user_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  late final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Future<UserAuthResponse?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      if (user != null) {
        return UserAuthResponse(user: user);
      }
    } on FirebaseAuthException catch (e) {
      return UserAuthResponse(
        errorMessage: e.message,
      );
    }
    return null;
  }

  Future<UserAuthResponse?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      if (user != null) {
        return UserAuthResponse(user: user);
      }
    } on FirebaseAuthException catch (e) {
      return UserAuthResponse(
        errorMessage: e.message,
      );
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
