// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/screens/care_provided.dart';
import 'package:huda_clinic_mobile/screens/partners.dart';
import 'package:huda_clinic_mobile/screens/who_we_are.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:huda_clinic_mobile/widget/language_picker_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
        'https://api.preview.platform.athenahealth.com/oauth2/v1/authorize?client_id=0oagz1gjmzsIV8Xcu297&response_type=code&redirect_uri=http://athenahealth.com&scope=openid&state={"PRACTICEID":"80000"}';
    final result = await FlutterWebAuth.authenticate(
      url: authorizeUrl,
      callbackUrlScheme: "myapp",
    );
  }

  @override
  Widget build(BuildContext context) {
//=========================================
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
              backgroundColor: const Color.fromARGB(255, 23, 30, 136),
            ),
            body: Center(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  Image.asset('lib/assets/huda_logo.png',
                      height: 200, width: 200),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 100,
//===================================================================================
//Row of buttons
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.topToBottom,
                                      child: const WhoWeAre(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 49, 77, 185),
                              ),
                              child: Text(AppLocalizations.of(context).whoWeare,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const Gap(4),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.topToBottom,
                                      child: const CareProvided(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 49, 77, 185),
                              ),
                              child: Text(
                                  AppLocalizations.of(context).careProvided,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const Gap(4),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.topToBottom,
                                      child: const Partners(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 49, 77, 185),
                              ),
                              child:
                                  Text(AppLocalizations.of(context).ourPartners,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

//===================================================================================
//NOTE: THIS COMMENTED OUT BUTTON IS WHAT DIRECTS YOU TO THE ATHENAONE LOGIN WIDGET
//      AS OF MAY 2023 THE ATHENAONE LOGIN WIDGET CAN ONLY REDIRECT TO WEB PAGES
//      THIS BUTTON MAY BE INITIALIZED IN THE EVENT ATHENA SUPPORTS APP DEVELOPMENT
//      IN THE FUTURE
                  /*Center(
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 23, 30, 136)),
                        minimumSize:
                            MaterialStateProperty.all(const Size(280, 0)),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context).login,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const Icon(
                            Icons.login_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),*/
//===================================================================================
//login bypass button button
                  const SizedBox(height: 10.0),
                  Center(
                    child: MaterialButton(
                      color: const Color.fromARGB(255, 23, 30, 136),
                      minWidth: 280,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        context.go(
                            '/home'); // go to Homepage using GoRouter navigation routing system!
                      },
                      child: Text(
                        AppLocalizations.of(context).login,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
//Registration text button
                  const SizedBox(height: 30.0),
                  Center(
                      child: TextButton(
                    onPressed: () {
                      context.go(
                          '/registration'); // go to registration using GoRouter navigation routing system!
                    },
                    child: Text(AppLocalizations.of(context).regButton,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 112, 115, 154),
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  )),
                  const SizedBox(height: 200),
                ],
              ),
            ))));
  }
}
