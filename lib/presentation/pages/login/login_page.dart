import 'package:crud_firebase/data/datasource/local/shared_preferences_services.dart';
import 'package:crud_firebase/data/datasource/network/auth_remote_data.dart';
import 'package:crud_firebase/domain/repositories/auth_repository_imp.dart';
import 'package:crud_firebase/domain/usecases/auth_usecase.dart';
import 'package:crud_firebase/presentation/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/body_login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences _preferences;
  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(
        AuthUsecase(
          AuthRepositoryImp(
            AuthService(FirebaseAuth.instance),
          ),
        ),
        SharedPreferencesService(_preferences),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BodyLoginContent(),
      ),
    );
  }
}
