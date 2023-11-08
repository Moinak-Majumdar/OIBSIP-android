import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({super.key, required this.input, required this.output});
  final String input, output;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF243748),
            Color(0xFF01060d),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            input,
            style: textTheme.headlineSmall!.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 6),
          Text(
            output,
            style: textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
