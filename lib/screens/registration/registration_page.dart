// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/models/registration_fields.dart';
import 'package:huda_clinic_mobile/screens/registration/form1.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/language_picker_widget.dart';

class Registration extends StatefulWidget {
  final Function? toggleView;
  const Registration({super.key, this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _Registration();
  }
}

class _Registration extends State<Registration> {
  @override
  Widget build(BuildContext context) {
//initializes empty internal array variables
    final _form1 = form1(
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
//beginning of ui
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              context.go("/");
            },
          ),
          actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
          title: Text(
            AppLocalizations.of(context).regTerms,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 17,
            ),
            Image.asset('lib/assets/huda_logo.png',
                height: 95, width: 95), // image logo
            const Padding(
              padding: EdgeInsets.fromLTRB(50.0, 1.0, 5.0, 1.0),
            ),
            const SizedBox(
              height: 1,
            ),
            //Header
            Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(AppLocalizations.of(context).inprReq,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 77, 185))))),
            //body paragraph 1
            Container(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 20),
              child: (Text(AppLocalizations.of(context).regTermsBody,
                  style: GoogleFonts.sora(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 89, 91, 133))))),
            ),
            //body paragraph 2
            Container(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 30),
              child: (Text(AppLocalizations.of(context).regTermsBody2,
                  style: GoogleFonts.sora(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 25, 43, 122))))),
            ),
            //Acknowledge button
            MaterialButton(
              color: const Color.fromARGB(255, 49, 77, 185),
              minWidth: 225,
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Form1(form_1: _form1),
                    ));
              },
              child: Text(
                AppLocalizations.of(context).regTermsAck,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ));
  }
}
