import 'package:flutter/material.dart';

class TopRegisterContent extends StatelessWidget {
  const TopRegisterContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
            offset: Offset(0.0, 1.0),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        'assets/icons/developer.png',
      ),
    );
  }
}
