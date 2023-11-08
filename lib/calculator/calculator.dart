import 'package:oasis_infobyte_internship/calculator/widget/break.dart';
import 'package:oasis_infobyte_internship/calculator/widget/display.dart';
import 'package:oasis_infobyte_internship/calculator/widget/operations.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

enum ElementType { number, operator, braces, decimalPoint }

ElementType getElmType(String val) {
  if (val == '+' || val == '-' || val == '*' || val == '/') {
    return ElementType.operator;
  }
  if (val == '(' || val == ')') {
    return ElementType.braces;
  }
  if (val == '.') {
    return ElementType.decimalPoint;
  }
  return ElementType.number;
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = '';
  String output = '';
  String lastOperand = '';
  String lastDigit = '';
  bool disableDecimalPoint = false;
  int noOfOpeningBraces = 0;
  late Parser p;

  @override
  void initState() {
    p = Parser();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Display(
            input: equation,
            output: output,
          ),
          const Break(),
          Operation(
            clear: () {
              if (equation != '') {
                setState(() {
                  output = '';
                  equation = '';
                });
              }
            },
            del: deleteLastElm,
            eval: eval,
            getDigit: addDigit,
            getOperand: addOperator,
            manageBraces: manageBraces,
            manageDecimalPoint: manageDecimalPoint,
          ),
        ],
      ),
    );
  }

  String getLastElmOfEqu() {
    if (equation.isEmpty) {
      return '';
    }
    final end = equation[equation.length - 1];
    if (end == ' ') {
      return equation[equation.length - 2];
    }
    return end;
  }

  void deleteLastElm() {
    if (equation != '') {
      final end = equation[equation.length - 1];
      setState(() {
        if (end == ' ') {
          final last3 =
              equation.substring(equation.length - 3, equation.length);
          if (last3.contains(')')) {
            noOfOpeningBraces++;
          }
          if (last3.contains('(')) {
            noOfOpeningBraces--;
          }
          equation = equation.substring(0, equation.length - 3);
        } else {
          if (end.contains(')')) {
            noOfOpeningBraces++;
          }
          if (end.contains('(')) {
            noOfOpeningBraces--;
          }
          equation = equation.substring(0, equation.length - 1);
        }
      });
    }
  }

  void addDigit(String digit) {
    final last = getLastElmOfEqu();
    if (last == ')') {
      setState(() => equation = '$equation * $digit');
      return;
    }
    setState(() => equation = '$equation$digit');
  }

  void addOperator(String operator) {
    if (equation == '') {
      return;
    }
    final last = getLastElmOfEqu();
    final lastType = getElmType(last);

    if (lastType == ElementType.number) {
      setState(() {
        equation = '$equation $operator ';
      });
      return;
    }
    if (lastType == ElementType.operator) {
      deleteLastElm();
      setState(() {
        equation = '$equation $operator ';
      });
      return;
    }
    if (last == '(' && operator == '-') {
      setState(() {
        equation = '$equation $operator ';
      });
    }
    if (last == ')') {
      setState(() {
        equation = '$equation $operator ';
      });
    }
  }

  void manageBraces(String braces) {
    if (equation == '') {
      return;
    }
    final last = getLastElmOfEqu();
    final lastType = getElmType(last);

    if (braces == '(') {
      noOfOpeningBraces++;
      if (lastType == ElementType.number || last == ')') {
        setState(() => equation = '$equation * (');
        return;
      }
      if (lastType == ElementType.decimalPoint) {
        setState(() => equation = '${equation}0 * (');
        return;
      }

      setState(() => equation = '$equation ( ');
    }

    if (braces == ')') {
      if (last == '(' || lastType == ElementType.operator) {
        return;
      }
      if (noOfOpeningBraces > 0) {
        noOfOpeningBraces--;
        if (lastType == ElementType.decimalPoint) {
          setState(() => equation = '${equation}0 )');
          return;
        }
        setState(() => equation = '$equation)');
      }
    }
  }

  void manageDecimalPoint() {
    if (equation == '') {
      setState(() => equation = '0.');
      return;
    }
    final last = getLastElmOfEqu();
    final lastType = getElmType(last);
    final elm = equation.split(' ');

    if (lastType == ElementType.decimalPoint ||
        elm.last.contains('.') ||
        last == ')') {
      return;
    }
    if (lastType == ElementType.operator || last == '(') {
      setState(() => equation = '$equation 0.');
      return;
    }
    setState(() => equation = '$equation.');
  }

  void eval() {
    try {
      final Expression exp = p.parse(equation);
      setState(() {
        output = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          content: Text(
            e.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
      // throw Exception(e);
    }
  }
}
