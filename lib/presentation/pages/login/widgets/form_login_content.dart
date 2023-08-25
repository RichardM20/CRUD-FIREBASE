import 'package:crud_firebase/presentation/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class FormLoginContent extends StatelessWidget {
  const FormLoginContent(
      {super.key, required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputWidget(
          typeKeyboard: TextInputType.emailAddress,
          controller: email,
          hintText: 'Correo',
        ),
        const SizedBox(height: 20),
        InputWidget(
          controller: password,
          isPassword: true,
          typeKeyboard: TextInputType.text,
          hintText: 'Contrasena',
        ),
      ],
    );
  }
}
