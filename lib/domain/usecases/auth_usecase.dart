import 'package:crud_firebase/domain/repositories/auth_repository_imp.dart';

import '../models/user_response_model.dart';

class AuthUsecase {
  late final AuthRepositoryImp _authRepositoryImp;
  AuthUsecase(this._authRepositoryImp);

  Future<UserAuthResponse?> login(String email, String password) async {
    return await _authRepositoryImp.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserAuthResponse?> register(String email, String password) async {
    return await _authRepositoryImp.signUpWithEmailAndPassword(
      email,
      password,
    );
  }
}
