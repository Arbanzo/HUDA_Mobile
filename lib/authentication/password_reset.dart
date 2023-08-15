//This is a legacy page from prototype 1, this may not be used.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Reset Password'),
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 23, 30, 136),
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.emailAddress,
                cursorColor: const Color.fromARGB(255, 23, 30, 136),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 23, 30, 136), width: 2.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email)
                          .then((value) => Navigator.of(context).pop());
                    },
                    child: const Text('Reset Password')))
          ]),
    );
  }
}
