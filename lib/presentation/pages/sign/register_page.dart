import 'package:crud_firebase/data/datasource/local/shared_preferences_services.dart';
import 'package:crud_firebase/data/datasource/network/auth_remote_data.dart';
import 'package:crud_firebase/data/datasource/network/firestore_remote_data.dart';
import 'package:crud_firebase/domain/repositories/auth_repository_imp.dart';
import 'package:crud_firebase/domain/repositories/firestore_repository_imp.dart';
import 'package:crud_firebase/domain/usecases/auth_usecase.dart';
import 'package:crud_firebase/domain/usecases/firestore_usecase.dart';
import 'package:crud_firebase/presentation/providers/auth_provider.dart';
import 'package:crud_firebase/presentation/providers/firestore_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/body_register_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirestoreProvider>(
          create: (context) => FirestoreProvider(
            FirestoreUsecase(
              FirestoreRepositoryImp(
                FirestoreServices(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(
            AuthUsecase(
              AuthRepositoryImp(
                AuthService(FirebaseAuth.instance),
              ),
            ),
            SharedPreferencesService(_preferences),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BodyRegisterContent(),
      ),
    );
  }
}
