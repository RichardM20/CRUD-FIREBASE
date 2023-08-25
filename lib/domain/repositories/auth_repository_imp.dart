import 'package:crud_firebase/data/datasource/network/auth_remote_data.dart';
import 'package:crud_firebase/domain/models/user_response_model.dart';
import 'package:crud_firebase/data/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  late final AuthService _authService;
  AuthRepositoryImp(this._authService);
  @override
  Future<UserAuthResponse?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authService.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  @override
  Future<UserAuthResponse?> signUpWithEmailAndPassword(
      String email, String password) {
    return _authService.signUpWithEmailAndPassword(email, password);
  }
}
