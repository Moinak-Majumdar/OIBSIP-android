import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late TextEditingController ip;
  static const List<String> units = ["s", "m", "h"];
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
        case "s":
          setState(() {
            unitLabel1 = "Minute (m) : ";
            value1 = (value / 60).toStringAsFixed(2);
            unitLabel2 = "Hour (h) : ";
            value2 = (value / 3600).toStringAsFixed(2);
            selectedUnit = unit;
          });
          break;
        case "m":
          setState(() {
            unitLabel1 = "Second (s) : ";
            value1 = (value * 60).toStringAsFixed(2);
            unitLabel2 = "Hour (h) : ";
            value2 = (value / 60).toStringAsFixed(2);
            selectedUnit = unit;
          });
          break;
        case "h":
          setState(() {
            unitLabel1 = "Minute (m) : ";
            value1 = (value * 60).toStringAsFixed(2);
            unitLabel2 = "Second (s) : ";
            value2 = (value * 3600).toStringAsFixed(2);
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
                  label: Text('Time'),
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
