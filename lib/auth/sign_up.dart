import 'package:flutter/material.dart';
import 'package:i_project/utils.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign up",
              style: TextStyle(
                fontSize: Utils.blockWidht * 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Utils.blockHeight * 3),
            Container(
              height: Utils.blockWidht * 40,
              width: Utils.blockWidht * 40,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(Utils.blockWidht * 100),
              ),
              child: Icon(
                Icons.person,
                size: Utils.blockWidht * 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: Utils.blockHeight * 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Utils.blockWidht * 10),
              child: Column(
                children: const [
                  TextFiel(hint: "username"),
                  TextFiel(hint: "password", hideText: true),
                  TextFiel(hint: "password", hideText: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFiel extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool hideText;
  const TextFiel({
    required this.hint,
    this.controller,
    this.hideText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Utils.blockHeight * 2.7),
      child: TextField(
        controller: controller,
        obscureText: hideText,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
