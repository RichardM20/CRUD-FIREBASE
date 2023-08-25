import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isPassword;
  final TextInputType? typeKeyboard;

  const InputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.typeKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: typeKeyboard,
      decoration: InputDecoration(
        suffixIcon: isPassword == false
            ? const SizedBox()
            : const Icon(
                Icons.visibility_outlined,
                color: Colors.blueAccent,
              ),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
