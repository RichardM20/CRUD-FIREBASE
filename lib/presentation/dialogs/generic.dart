import 'package:flutter/material.dart';

class GenericDialog {
  static void show(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          backgroundColor: Colors.white,
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text(
                'Listo',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
