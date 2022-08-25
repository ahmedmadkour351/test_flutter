import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        // Image.asset(
        //   "images/logo.png",
        //   width: 50.0,
        //   height: 50.0,
        // ),
      ),
      body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.mail), hintText: "Email")),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.person), hintText: "UserName"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(Icons.password), hintText: "Password"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(Icons.password_rounded),
                    hintText: "Confirm_Password"),
              ),
              ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.SUCCES,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Creat Account',
                      desc: 'Done.............',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
                  },
                  child: const Text("Done"))
            ],
          )),
    );
  }
}
