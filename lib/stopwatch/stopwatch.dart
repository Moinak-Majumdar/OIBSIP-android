import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oasis_infobyte_internship/stopwatch/widget/button.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch stopwatch;
  late Timer? timer;
  bool watchRunning = false;
  String dMilSec = "00", dSec = "00", dMin = '00';
  int milSec = 0, sec = 0, min = 0;

  @override
  void initState() {
    stopwatch = Stopwatch();

    super.initState();
  }

  void handelStartStop() {
    if (watchRunning) {
      if (timer != null) {
        timer!.cancel();
      }
      setState(() {
        watchRunning = false;
      });
    } else {
      setState(() {
        watchRunning = true;
      });
      timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
        setState(() {
          if (milSec < 99) {
            milSec++;
            dMilSec = milSec < 10 ? "0$milSec" : milSec.toString();
          } else {
            milSec = 0;
            updateSec();
          }
        });
      });
    }
  }

  void updateSec() {
    setState(() {
      if (sec < 59) {
        sec++;
        dSec = sec < 10 ? '0$sec' : sec.toString();
      } else {
        sec = 0;
        updateMin();
      }
    });
  }

  void updateMin() {
    setState(() {
      min++;
      dMin = min < 10 ? '0$min' : min.toString();
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: 250,
              height: 250,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white12,
                    strokeWidth: 8,
                    value: 1,
                  ),
                  CircularProgressIndicator(
                    color: Colors.cyan,
                    strokeWidth: 8,
                    value: sec / 60,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$dMin:$dSec",
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          dMilSec,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Button(
                    onClick: handelStartStop,
                    icon: watchRunning ? Icons.pause_sharp : Icons.play_arrow,
                    radius: watchRunning ? 35 : 90,
                  ),
                  if (milSec > 0 || sec > 0)
                    Positioned(
                      left: 60,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            watchRunning = false;
                            dMilSec = "00";
                            dSec = "00";
                            dMin = '00';
                            milSec = 0;
                            sec = 0;
                            min = 0;
                            if (timer != null) {
                              timer!.cancel();
                            }
                          });
                        },
                        icon: Icon(
                          Icons.restore,
                          color: Colors.red[600],
                          size: 35,
                        ),
                      ),
                    ),
                  if (milSec > 0 || sec > 0) const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
