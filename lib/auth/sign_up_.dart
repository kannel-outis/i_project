import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:i_project/auth/log_in.dart';
import 'package:i_project/icons.dart';
import 'package:i_project/utils.dart';

class SignUpNew extends StatelessWidget {
  const SignUpNew({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utils.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Utils.bodyPadding),
            height:
                (Utils.blockHeight * 100) - MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Container(
                        height: Utils.blockWidht * 9,
                        width: Utils.blockWidht * 9,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(.5),
                          ),
                          borderRadius:
                              BorderRadius.circular(Utils.blockWidht * 2),
                        ),
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.white.withOpacity(.8),
                        ),
                      ),
                      SizedBox(width: Utils.blockWidht * 5),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: Utils.blockWidht * 8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Utils.blockHeight * 8),
                Text(
                  "Sign up with one of the following options.",
                  style: TextStyle(
                    fontSize: Utils.blockWidht * 3,
                    color: Colors.white.withOpacity(.6),
                  ),
                ),
                SizedBox(height: Utils.blockHeight * 3),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SocialWidget(icon: MyIconData.facebook_f),
                      SizedBox(width: Utils.blockWidht * 6),
                      const SocialWidget(icon: MyIconData.google),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Utils.blockHeight * 3),
                  child: Column(
                    children: const [
                      TextFieldGradient(
                        hint: "username",
                        label: "Name",
                      ),
                      TextFieldGradient(
                        hint: "johndoe@email.com",
                        label: "Email",
                      ),
                      TextFieldGradient(
                        hint: "Pick a strong password",
                        label: "Password",
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Utils.blockHeight * 2.5),
                Container(
                  width: double.infinity,
                  height: Utils.blockHeight * 5.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Utils.borderRadius),
                    gradient: Utils.gradient,
                  ),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Utils.blockWidht * 3.3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Utils.blockHeight * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: Utils.blockWidht * 3.4,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                    SizedBox(
                      width: Utils.blockWidht * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LogIn(fromSignUp: true),
                          ),
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: Utils.blockWidht * 3.4,
                          color: Colors.white.withOpacity(.8),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldGradient extends StatelessWidget {
  final String hint;
  final String label;
  final bool isPassword;
  const TextFieldGradient({
    required this.hint,
    required this.label,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Utils.blockHeight * 2.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white.withOpacity(.7),
                fontSize: Utils.blockWidht * 3.3),
          ),
          SizedBox(height: Utils.blockHeight * 1.5),
          SizedBox(
            child: TextField(
              obscureText: isPassword,
              style: TextStyle(
                color: Colors.grey.withOpacity(.5),
                fontSize: Utils.blockWidht * 3,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(.5),
                  fontSize: Utils.blockWidht * 3.3,
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(.15),
                contentPadding: EdgeInsets.symmetric(
                  vertical: Utils.blockHeight * 1.7,
                  horizontal: Utils.blockWidht * 4,
                ),
                focusedBorder: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(Utils.borderRadius),
                  gradient: Utils.borderGradient,
                  width: 2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Utils.borderRadius),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(.4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialWidget extends StatelessWidget {
  final IconData icon;
  const SocialWidget({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: Utils.blockHeight * 6,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(Utils.borderRadius),
          border: Border.all(
            color: Colors.grey.withOpacity(.3),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: Utils.blockWidht * 6,
        ),
      ),
    );
  }
}
