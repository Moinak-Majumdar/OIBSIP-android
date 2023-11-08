import 'package:oasis_infobyte_internship/calculator/widget/button.dart';
import 'package:flutter/material.dart';

class Operation extends StatelessWidget {
  const Operation({
    super.key,
    required this.getDigit,
    required this.clear,
    required this.del,
    required this.eval,
    required this.getOperand,
    required this.manageBraces,
    required this.manageDecimalPoint,
  });
  final Function(String val) getDigit;
  final Function(String val) getOperand;
  final Function(String brace) manageBraces;
  final Function() manageDecimalPoint;
  final Function() clear;
  final Function() del;
  final Function() eval;

  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff243B55),
              Color(0xff141E30),
            ],
          ),
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: [
            Button(
              onClick: () {
                clear();
              },
              text: 'C',
              textColor: Colors.red,
            ),
            Button(
              onClick: () {
                manageBraces('(');
              },
              text: '(',
              textColor: Colors.teal,
            ),
            Button(
              onClick: () {
                manageBraces(')');
              },
              text: ')',
              textColor: Colors.teal,
            ),
            Button(
              onClick: () {
                getOperand('/');
              },
              text: '/',
              textColor: Colors.teal,
            ),
            Button(
              onClick: () {
                getDigit('1');
              },
              text: '1',
            ),
            Button(
              onClick: () {
                getDigit('2');
              },
              text: '2',
            ),
            Button(
              onClick: () {
                getDigit('3');
              },
              text: '3',
            ),
            Button(
              onClick: () {
                getOperand('*');
              },
              text: '*',
              textColor: Colors.teal,
            ),
            Button(
              onClick: () {
                getDigit('4');
              },
              text: '4',
            ),
            Button(
              onClick: () {
                getDigit('5');
              },
              text: '5',
            ),
            Button(
              onClick: () {
                getDigit('6');
              },
              text: '6',
            ),
            Button(
              onClick: () {
                getOperand('+');
              },
              text: '+',
              textColor: Colors.teal,
            ),
            Button(
              onClick: () {
                getDigit('7');
              },
              text: '7',
            ),
            Button(
              onClick: () {
                getDigit('8');
              },
              text: '8',
            ),
            Button(
              onClick: () {
                getDigit('9');
              },
              text: '9',
            ),
            Button(
              onClick: () {
                getOperand('-');
              },
              text: '-',
              textColor: Colors.teal,
            ),
            Button(
              onClick: manageDecimalPoint,
              text: '.',
            ),
            Button(
              onClick: () {
                getDigit('0');
              },
              text: '0',
            ),
            Button(
              onClick: del,
              text: 'Del',
            ),
            Button(
              onClick: eval,
              text: '=',
              withBackground: true,
            ),
          ],
        ),
      ),
    );
  }
}
