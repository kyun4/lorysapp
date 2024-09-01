import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lorysapp/components/buttons.dart';
import 'package:lorysapp/components/inputs.dart';
import 'package:lorysapp/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
                child: SizedBox(
                    width: 40,
                    child: SvgPicture.asset(
                        'assets/svg/heart-pulse-svgrepo-com.svg'))),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text('Lory\'s App',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            Container(
                margin: const EdgeInsets.all(10),
                child: Text('Be a parokyano', style: TextStyle(fontSize: 14))),
            Center(
                child: InputFieldCustom(
              text_controller: emailController,
              hint_text_value: "Email",
              suffix_asset: "",
              prefix_asset: "assets/svg/user-alt-1-svgrepo-com.svg",
              isObscure: false,
            )),
            Center(
                child: InputFieldCustom(
              text_controller: passwordController,
              hint_text_value: "Password",
              suffix_asset: "",
              prefix_asset: "assets/svg/lock-alt-svgrepo-com.svg",
              isObscure: true,
            )),
            GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ))
              },
              child: const ButtonCustom(button_label: 'Submit'),
            )
          ]),
        ));
  }
}
