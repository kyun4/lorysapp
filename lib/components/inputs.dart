import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputFieldCustom extends StatefulWidget {
  final TextEditingController text_controller;
  final String prefix_asset;
  final String suffix_asset;
  final bool isObscure;
  final String hint_text_value;

  const InputFieldCustom(
      {required this.text_controller,
      required this.hint_text_value,
      required this.prefix_asset,
      required this.suffix_asset,
      required this.isObscure});

  @override
  State<InputFieldCustom> createState() => _InputFieldCustomState();
}

class _InputFieldCustomState extends State<InputFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextField(
        controller: this.widget.text_controller,
        obscureText: this.widget.isObscure,
        decoration: InputDecoration(
            prefixIcon: Container(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(this.widget.prefix_asset)),
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            fillColor: Color(0xffE7E1E1),
            hintStyle: TextStyle(color: Colors.black87),
            hintText: this.widget.hint_text_value,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
