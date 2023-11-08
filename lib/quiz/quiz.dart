import 'package:oasis_infobyte_internship/quiz/widget/questions.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 34, 66, 98),
              Color(0xFF243748),
              Color(0xFF244075),
              Color.fromARGB(255, 2, 19, 34),
              Color.fromARGB(255, 2, 19, 15),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Learn Flutter in fun way !',
              style: textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '15 question on flutter basic easy to moderate level.',
              style: textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Questions()),
              ),
              icon: const Icon(
                Icons.play_arrow,
                size: 32,
              ),
              label: Text(
                'Start Quiz',
                style: textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
