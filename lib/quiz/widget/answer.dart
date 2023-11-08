import 'package:oasis_infobyte_internship/quiz/model/qus_ans.dart';
import 'package:oasis_infobyte_internship/quiz/widget/correct_ans.dart';
import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key, required this.userAns});
  final List<String> userAns;

  String get getScore {
    int score = 0;
    for (int i = 0; i < userAns.length; i++) {
      if (userAns[i] == qusLibrary[i].options[0]) {
        score++;
      }
    }
    return score.toString();
  }

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
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
            Expanded(
              child: PageView.builder(
                itemCount: userAns.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        RichText(
                          text: TextSpan(
                            text: 'Question ${i + 1}',
                            style: textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.white60,
                            ),
                            children: [
                              TextSpan(
                                text: ' / ${userAns.length}',
                                style: textTheme.titleLarge!.copyWith(
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          qusLibrary[i].question,
                          style: textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 32),
                        CorrectAns(
                          userAns: userAns[i],
                          correctAns: qusLibrary[i].options[0],
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 16,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                text: TextSpan(
                  text: 'Your Score : ',
                  style: textTheme.headlineSmall,
                  children: [
                    TextSpan(
                      text: getScore,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' / '),
                    TextSpan(
                      text: userAns.length.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
