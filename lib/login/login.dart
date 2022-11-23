import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo 4.png",
              height: 200.0,
              width: 200.0,
            ),
            SizedBox(
              width: 300.0,
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person), hintText: "UserName"),
              ),
            ),
            SizedBox(
              width: 300.0,
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password), hintText: "Password"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("homepage");
                    },
                    child: const Text("Sign in"),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Container(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("signup");
                  },
                  child: const Text("Sign Up"),
                )),
              ],
            ),
          ],
        ),
      ),
    ]));
  }
}
