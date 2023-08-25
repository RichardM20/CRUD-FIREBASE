import 'package:crud_firebase/presentation/dialogs/generic.dart';
import 'package:crud_firebase/presentation/providers/auth_provider.dart';
import 'package:crud_firebase/presentation/providers/button_loading_provider.dart';
import 'package:crud_firebase/presentation/widgets/button_loading_widget.dart';
import 'package:crud_firebase/presentation/widgets/text_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_login_content.dart';
import 'top_login_content.dart';

class BodyLoginContent extends StatelessWidget {
  BodyLoginContent({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopLoginContent(),
              const SizedBox(height: 30),
              const Text(
                "Iniciar sesion",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),
              FormLoginContent(
                email: emailController,
                password: passwordController,
              ),
              const SizedBox(height: 50),
              ButtonLoadingWidget(
                buttonText: 'Iniciar sesion',
                onPressed: () async {
                  _validateForm(context);
                },
                isLoading: context.watch<ButtonStateProvider>().isLoading,
              ),
              const SizedBox(height: 30),
              const TextNavigation(text: "Registrarme", route: 'register'),
            ],
          ),
        ),
      ),
    );
  }

  _validateForm(BuildContext context) async {
    final buttonStateProvider = context.read<ButtonStateProvider>();
    buttonStateProvider.startLoading();

    if (emailController.text.length < 6 || passwordController.text.length < 6) {
      // ignore: use_build_context_synchronously
      GenericDialog.show(
        context,
        "Informacion",
        "Correo o contrasena invalidos",
      );
      buttonStateProvider.stopLoading();
    } else {
      // ignore: use_build_context_synchronously
      final res = await Provider.of<AuthProvider>(context, listen: false).login(
        emailController.text,
        passwordController.text,
      );
      if (res.errorMessage != null) {
        // ignore: use_build_context_synchronously
        GenericDialog.show(
          context,
          "Error",
          res.errorMessage!,
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
      buttonStateProvider.stopLoading();
    }
  }
}
