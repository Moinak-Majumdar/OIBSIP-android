import 'package:flutter/material.dart';

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  late TextEditingController ip;
  static const List<String> units = ["cm", "m", "Km"];
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
        case "cm":
          setState(() {
            unitLabel1 = "Meter (m) : ";
            value1 = (value / 100).toString();
            unitLabel2 = "Kilo Meter (Km) : ";
            value2 = (value / 100000).toString();
            selectedUnit = unit;
          });
          break;
        case "m":
          setState(() {
            unitLabel1 = "Centimeter (cm) : ";
            value1 = (value * 100).toString();
            unitLabel2 = "Kilo Meter (Km) : ";
            value2 = (value / 1000).toString();
            selectedUnit = unit;
          });
          break;
        case "Km":
          setState(() {
            unitLabel1 = "Centimeter (cm) : ";
            value1 = (value * 100000).toString();
            unitLabel2 = "Meter (m) : ";
            value2 = (value * 1000).toString();
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
                  label: Text('Distance'),
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
