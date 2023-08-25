import 'package:crud_firebase/data/datasource/local/shared_preferences_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences preferences;
  init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    init();

    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPreferencesService(preferences).isLoggedIn == false) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Simple crud with Firebae and provider",
        ),
      ),
    );
  }
}
