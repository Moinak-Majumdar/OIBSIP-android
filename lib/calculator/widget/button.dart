import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onClick,
    required this.text,
    this.textColor = Colors.white,
    this.withBackground = false,
  });
  final Function() onClick;
  final String text;
  final Color textColor;
  final bool withBackground;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: withBackground
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF38ef7d),
                    Color(0xff11998e),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(withBackground ? 35 : 0),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
