import 'package:flutter/material.dart';

class TextNavigation extends StatelessWidget {
  const TextNavigation({super.key, required this.text, required this.route});
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/$route');
      },
    );
  }
}
