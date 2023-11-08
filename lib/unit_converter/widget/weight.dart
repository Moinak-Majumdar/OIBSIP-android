import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  late TextEditingController ip;
  static const List<String> units = ["g", "Kg", "lb"];
  String? selectedUnit;
  String unitLabel1 = '', unitLabel2 = '';
  String value1 = '', value2 = '';

  @override
  void initState() {
    ip = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    ip.dispose();
    super.dispose();
  }

  void convert(String? unit) {
    final value = int.tryParse(ip.text);

    if (unit != null && value != null) {
      switch (unit) {
        case "g":
          setState(() {
            unitLabel1 = "Kilo Gram (kg) : ";
            value1 = (value / 1000).toStringAsFixed(4);
            unitLabel2 = "Pound (lb) : ";
            value2 = (value * 0.00220462).toStringAsFixed(4);
            selectedUnit = unit;
          });
          break;
        case "Kg":
          setState(() {
            unitLabel1 = "Gram (g) : ";
            value1 = (value / 1000).toStringAsFixed(4);
            unitLabel2 = "Pound (lb) : ";
            value2 = (value * 2.20462).toStringAsFixed(4);
            selectedUnit = unit;
          });
          break;
        case "lb":
          setState(() {
            unitLabel1 = "Gram (g) : ";
            value1 = (value / 453.592).toStringAsFixed(4);
            unitLabel2 = "Kilo Gram (Kg) : ";
            value2 = (value / 0.453592).toStringAsFixed(4);
            selectedUnit = unit;
          });
          break;
      }
    }
  }

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: ip,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Mass'),
                ),
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
              ),
            ),
            const SizedBox(width: 24),
            DropdownButton(
              value: selectedUnit,
              onChanged: convert,
              items: [
                for (final elm in units)
                  DropdownMenuItem(
                    value: elm,
                    child: Text(elm),
                  )
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            text: unitLabel1,
            style: textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              TextSpan(text: value1, style: textTheme.titleLarge),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        RichText(
          text: TextSpan(
            text: unitLabel2,
            style: textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: value2,
                style: textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
