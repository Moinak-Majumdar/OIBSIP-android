import 'package:flutter/material.dart';

class Choices extends StatelessWidget {
  const Choices({super.key, required this.options, required this.onAnsSelect});
  final List<String> options;
  final Function(String val) onAnsSelect;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (final elm in options)
          InkWell(
            onTap: () {
              onAnsSelect(elm);
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF38ef7d),
                    Color(0xff11998e),
                  ],
                ),
                borderRadius: BorderRadius.circular(180),
              ),
              child: Text(
                elm,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          )
      ],
    );
  }
}
