import 'package:flutter/material.dart';
import 'package:test/crud/addnotes.dart';
import 'package:test/crud/editnotes.dart';
import 'package:test/home/homepage.dart';
import 'package:test/login/login.dart';
import 'package:test/login/signup.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: ThemeData(primaryColor: Colors.blue),
      routes: {
        "login": (context) => const Login(),
        "signup": (context) => const SignUp(),
        "homepage": (context) => const HomePage(),
        "addnotes": (context) => const AddNotes(),
        "editnotes": (context) => const EditNotes()
      },
    );
  }
}
