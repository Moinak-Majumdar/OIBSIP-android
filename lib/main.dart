import 'package:oasis_infobyte_internship/calculator/calculator.dart';
import 'package:oasis_infobyte_internship/quiz/quiz.dart';
import 'package:oasis_infobyte_internship/stopwatch/stopwatch.dart';
import 'package:oasis_infobyte_internship/unit_converter/convert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.robotoTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF01060d),
          brightness: Brightness.dark,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(180, 40),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  static const List<Map<String, dynamic>> navigationList = [
    {"text": 'Quiz', "route": Quiz()},
    {"text": "Unit Converter", "route": Convert()},
    {"text": "Stop watch", "route": StopWatch()},
    {"text": "Calculator", "route": Calculator()}
  ];

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF38ef7d),
              Color(0xFF4a9b7f),
              Color(0xff11998e),
              Color(0xFF247a4d),
              Color(0xFF0a3431),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            const Icon(
              Icons.adb,
              size: 140,
              color: Colors.white70,
            ),
            const SizedBox(height: 32),
            for (final elm in navigationList)
              OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => elm['route']),
                ),
                style: Theme.of(context).outlinedButtonTheme.style,
                child: Text(
                  elm['text'],
                  style: textTheme.titleLarge!.copyWith(color: Colors.black),
                ),
              ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Oasis Infobyte ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.cyan,
                    ),
                children: const [
                  TextSpan(
                    text: 'Android Development Internship',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' by - ',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  TextSpan(
                    text: 'Moinak Majumdar',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
