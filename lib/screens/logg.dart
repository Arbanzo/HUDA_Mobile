import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // parameters needed and stated by athenaOne's documentation!
  final String clientId = "0oagz1gjmzsIV8Xcu297";
  final String responseType = "code";
  final String redirectUri =
      "http://athenahealth.com"; // current redirect after successfully logging in with phrtest_preview@mailinator.com credentials given by athena!
  final String scope = "openid";
  final String state = "{'PRACTICEID':'80000'}";

  Future<void> _login() async {
    // function for athenaOne's login widget!
    const String authorizeUrl = // uses flutter's web auth package!
        "https://api.preview.platform.athenahealth.com/oauth2/v1/authorize?client_id=0oagz1gjmzsIV8Xcu297&response_type=code&redirect_uri=http://athenahealth.com&scope=openid&state=state";
    // ignore: unused_local_variable
    final result = await FlutterWebAuth.authenticate(
      url: authorizeUrl,
      callbackUrlScheme: "myapp",
    );
    // handle the result of the authentication here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _login,
          child: const Text("Login"),
        ),
      ),
    );
  }
}
