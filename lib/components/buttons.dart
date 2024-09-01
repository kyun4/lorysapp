import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final String button_label;
  const ButtonCustom({required this.button_label});

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          height: 55,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          child: Text(this.widget.button_label,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 245, 187, 12)))
    ]);
  }
}
