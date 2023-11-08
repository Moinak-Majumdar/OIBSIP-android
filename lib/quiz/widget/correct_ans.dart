import 'package:flutter/material.dart';

class CorrectAns extends StatelessWidget {
  const CorrectAns({
    super.key,
    required this.userAns,
    required this.correctAns,
  });
  final String userAns, correctAns;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;

    if (userAns == correctAns) {
      return Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                userAns,
                style: textTheme.titleMedium,
                softWrap: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.check_circle,
                size: 32,
              ),
            )
          ],
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
              correctAns,
              style: textTheme.titleMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 231, 40, 104),
                  Color.fromARGB(255, 224, 16, 16),
                ],
              ),
              borderRadius: BorderRadius.circular(180),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    userAns,
                    style: textTheme.titleMedium,
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.close,
                    size: 32,
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
