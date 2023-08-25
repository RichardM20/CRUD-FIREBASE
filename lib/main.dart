import 'package:crud_firebase/presentation/pages/home/home_page.dart';
import 'package:crud_firebase/presentation/pages/login/login_page.dart';
import 'package:crud_firebase/presentation/pages/producs/create_and_edit_page.dart';
import 'package:crud_firebase/presentation/pages/sign/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'presentation/pages/splash/splash_page.dart';
import 'presentation/providers/button_loading_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ButtonStateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crud Firebase',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/create': (context) => const CreateAndEditProductPage(
                isNew: true,
              ),
          '/edit': (context) => const CreateAndEditProductPage(
                isNew: false,
              ),
        },
      ),
    );
  }
}
