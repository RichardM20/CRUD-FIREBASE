import 'package:crud_firebase/data/datasource/local/shared_preferences_services.dart';
import 'package:crud_firebase/domain/models/user_response_model.dart';
import 'package:crud_firebase/domain/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late AuthUsecase authUsecase;
  final SharedPreferencesService _sharedPreferencesService;

  AuthProvider(this.authUsecase, this._sharedPreferencesService);

  bool get isLoggedIn => _sharedPreferencesService.isLoggedIn;

  Future<UserAuthResponse> login(String email, String password) async {
    final result = await authUsecase.login(email, password);
    if (result!.user != null) {
      _sharedPreferencesService.isLoggedIn = true;
    }
    return result;
  }
 Future<UserAuthResponse> register(String email, String password) async {
    final result = await authUsecase.register(email, password);
    if (result!.user != null) {
      _sharedPreferencesService.isLoggedIn = true;
    }
    return result;
  }
  Future<void> signOut() async {
    _sharedPreferencesService.isLoggedIn = false;
    notifyListeners();
  }
}
