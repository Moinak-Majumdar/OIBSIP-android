import 'package:oasis_infobyte_internship/quiz/model/qus_ans.dart';
import 'package:oasis_infobyte_internship/quiz/widget/answer.dart';
import 'package:oasis_infobyte_internship/quiz/widget/choices.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final List<String> userAns = [];
  int questionIndex = 0;

  void addAns(String ans) {
    userAns.add(ans);
    if (questionIndex < qusLibrary.length - 1) {
      setState(() {
        questionIndex = userAns.length;
      });
    }

    if (userAns.length == qusLibrary.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Answers(userAns: userAns),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              color: Colors.cyan,
              backgroundColor: Colors.white24,
              minHeight: 8,
              value: (questionIndex + 1) / qusLibrary.length,
              borderRadius: BorderRadius.circular(16),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                text: 'Question ${questionIndex + 1}',
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.white60,
                ),
                children: [
                  TextSpan(
                    text: '/${qusLibrary.length}',
                    style: textTheme.titleLarge!.copyWith(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(height: 32),
            Text(
              qusLibrary[questionIndex].question,
              style: textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            Choices(
              options: qusLibrary[questionIndex].shuffledOptions(),
              onAnsSelect: addAns,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
