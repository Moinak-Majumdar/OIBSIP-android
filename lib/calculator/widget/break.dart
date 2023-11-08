import 'package:flutter/material.dart';

class Break extends StatelessWidget {
  const Break({super.key});

  @override
  Widget build(context) {
    return Container(
      height: 2,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4a9b7f),
            Color(0xFF247a4d),
            Color(0xFF0a3431),
          ],
        ),
      ),
    );
  }
}
