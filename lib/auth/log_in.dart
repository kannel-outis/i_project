import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_project/utils.dart';

import 'sign_up_.dart';

class LogIn extends StatelessWidget {
  final bool fromSignUp;
  const LogIn({super.key, this.fromSignUp = false});

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
                      GestureDetector(
                        onTap: () {
                          if (fromSignUp) {
                            Navigator.pop(context);
                            return;
                          }
                          return;
                        },
                        child: Container(
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
                      ),
                      SizedBox(width: Utils.blockWidht * 5),
                      Text(
                        "Log In",
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
                  "Log in with one of the following options.",
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
                      const SocialWidget(icon: Icons.facebook_outlined),
                      SizedBox(width: Utils.blockWidht * 6),
                      const SocialWidget(icon: Icons.home_outlined),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Utils.blockHeight * 3),
                  child: Column(
                    children: const [
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
                      "Log in",
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
                      "Don't have an account?",
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
                        if (fromSignUp) {
                          Navigator.pop(context);
                          return;
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const SignUpNew()),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
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
