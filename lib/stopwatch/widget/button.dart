import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onClick,
    required this.icon,
    required this.radius,
  });
  final Function() onClick;
  final IconData icon;
  final double radius;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: 90,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF38ef7d),
              Color(0xff11998e),
            ],
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Icon(
          icon,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
