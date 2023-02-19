import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_project/auth/log_in.dart';
import 'package:i_project/auth/sign_up_.dart';
import 'package:i_project/home/home_page.dart';
import 'package:i_project/utils.dart';
import 'package:toast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      builder: ((context, child) {
        Utils.getBlockHeightAndWidth(context);
        // return Overlay(
        //   initialEntries: [
        //     OverlayEntry(
        //       builder: (context) => const MyHomePage(title: "Home"),
        //     )
        //   ],
        // );
        return child!;
      }),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    if (FirebaseAuth.instance.currentUser != null) return const HomePage();
    return const LogIn();
  }
}
