//This is a legacy page from prototype 1, this may not be used.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  final Function? toggleView;
  const Login({super.key, this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

//Login page and Login Class
class _Login extends State<Login> {
  bool _obscureText = true; // for password prompt blur
//===================================================
//Auth function(s)
  TextEditingController email_ =
      TextEditingController(); //needed for auth field
  TextEditingController password_ = TextEditingController();
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        displayToastMessage("No user found", context);
      }
    }
    return user;
  }

//Begin Scaffold/UI of Login
  @override
  Widget build(BuildContext context) {
//===================================================
//Email Prompt field function
    final emailField = TextFormField(
        controller: email_,
        autofocus: false,
        validator: (value) {
//Parameters for valid entry
          if (value != null) {
            if (value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a Valid Email Address';
          }

          return null;
        },
//email bubble
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 23, 30, 136), width: 2.5),
          ),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
          labelText: 'Enter Email',
        ));
//Password Function
    final passwordField = TextFormField(
        obscureText: _obscureText,
        controller: password_,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          if (value.trim().length < 8) {
            return 'Password must be at least 8 characters in length';
          }
          // Return null if the entered password is valid
          return null;
        },
//Password input
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 23, 30, 136), width: 2.5),
          ),
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
          labelText: 'Enter Password',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: const Color.fromARGB(255, 23, 30, 136),
            ),
            onPressed: () {
              setState(() {
                //Allows for password view
                _obscureText = !_obscureText;
              });
            },
          ),
        ));
//Login button function
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        color: const Color.fromARGB(255, 23, 30, 136),
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          User? user = await loginUsingEmailPassword(
              email: email_.text, password: password_.text, context: context);
          if (user != null) {
            // ignore: use_build_context_synchronously
            context.go('/home');
          } else {
            // ignore: use_build_context_synchronously
            displayToastMessage("No user found", context);
          }
        },
        child: Text(
          "Login",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );
//===================================================
//Beginning of ui
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          //appbar will contain back button
          backgroundColor: const Color.fromARGB(255, 23, 30, 136),
        ),
        body: Column(
          children: [
            Image.asset('lib/assets/huda_logo.png',
                height: 200, width: 200), //HUDA Logo
            const SizedBox(
              height: 44.0,
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//Call all fields
                    const SizedBox(height: 45.0),
                    emailField,
                    const SizedBox(height: 25.0),
                    passwordField,
                    const SizedBox(height: 25.0),
                    loginButton,
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
//===================================================
//Password Reset prompt
            TextButton(
                onPressed: () {
                  context.go('/password_reset');
                },
                child: const Text('Forgot Password?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 30, 136),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))),
            const SizedBox(
              height: 28.0,
            ),
          ],
        ));
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
