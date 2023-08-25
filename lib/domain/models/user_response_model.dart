import 'package:firebase_auth/firebase_auth.dart';

class UserAuthResponse<T> {
  final User? user;
  final String? errorMessage;

  UserAuthResponse({
    this.user,
    this.errorMessage,
  });
}
