import 'package:crud_firebase/data/datasource/local/shared_preferences_services.dart';
import 'package:crud_firebase/data/datasource/network/firestore_remote_data.dart';
import 'package:crud_firebase/domain/repositories/firestore_repository_imp.dart';
import 'package:crud_firebase/domain/usecases/firestore_usecase.dart';
import 'package:crud_firebase/presentation/providers/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/list_data_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  init() async {
    final preferences = await SharedPreferences.getInstance();
    SharedPreferencesService(preferences).isLoggedIn = true;
  }

  @override
  void initState() {
    init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirestoreProvider>(
      create: (context) => FirestoreProvider(
        FirestoreUsecase(
          FirestoreRepositoryImp(
            FirestoreServices(),
          ),
        ),
      ),
      child: const Scaffold(
        body: ListDataContent(),
      ),
    );
  }
}
