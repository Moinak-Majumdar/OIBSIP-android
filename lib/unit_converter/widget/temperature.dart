import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  late TextEditingController ip;
  static const List<String> units = ["K", "°f", "°c"];
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
        case "K":
          setState(() {
            unitLabel1 = "Fahrenheit (°f) : ";
            value1 = (((value - 273) * 9 / 5) + 32).toStringAsFixed(4);
            unitLabel2 = "Celcius (°c) : ";
            value2 = (value - 273).toStringAsFixed(4);
            selectedUnit = unit;
          });
          break;
        case "°f":
          setState(() {
            unitLabel1 = "Kelvin (K) : ";
            value1 = (((value - 32) * 5 / 9) + 273).toStringAsFixed(4);
            unitLabel2 = "Celcius (°c) : ";
            value2 = ((value - 32) * 5 / 9).toStringAsFixed(4);
            selectedUnit = unit;
          });
          break;
        case "°c":
          setState(() {
            unitLabel1 = "Kelvin (K) : ";
            value1 = (value + 273).toStringAsFixed(4);
            unitLabel2 = "Fahrenheit (°f) : ";
            value2 = ((value * 9 / 5) + 32).toStringAsFixed(4);
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
                  label: Text('Temperature'),
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
