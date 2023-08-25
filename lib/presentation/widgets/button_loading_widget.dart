import 'package:flutter/material.dart';

class ButtonLoadingWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String buttonText;

  const ButtonLoadingWidget({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10),
        width: isLoading ? 48 : MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: isLoading ? Colors.grey : Colors.blueAccent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  buttonText,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
