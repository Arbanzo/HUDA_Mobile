// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:huda_clinic_mobile/screens/registration/form4.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../models/registration_fields.dart';
import '../../widget/language_picker_widget.dart';

class Form3 extends StatelessWidget {
  final form1 form_1;
  const Form3({super.key, required this.form_1});

  @override
  Widget build(BuildContext context) {
    TextEditingController _confirmDate = TextEditingController();
    _confirmDate.text = DateFormat("MM-dd-yyyy").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).form3bar),
        actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 17,
            ),
            //logo
            Image.asset('lib/assets/huda_logo.png', height: 95, width: 95),
            const Padding(
              padding: EdgeInsets.fromLTRB(50.0, 1.0, 5.0, 1.0),
            ),
            const SizedBox(
              height: 17,
            ),
            //progress bar
            const StepProgressIndicator(
              totalSteps: 6,
              currentStep: 3, //current step
              size: 8,
              selectedColor: Color.fromARGB(255, 76, 109, 242),
              unselectedColor: Color.fromARGB(255, 167, 169, 202),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Center(
                    child: Text(AppLocalizations.of(context).form3auth,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 77, 185)))))),
            //form 3 body
            Container(
              padding: const EdgeInsets.fromLTRB(18, 5, 18, 20),
              child: Center(
                  child: Text(AppLocalizations.of(context).form3body,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 5, 18, 20),
              child: Center(
                  child: Text(AppLocalizations.of(context).form3body2,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 25),
                child: Center(
                    child: Text(AppLocalizations.of(context).form3body3,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 23, 30, 136)))))),
            //form 3 date and sign fields
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 25),
              child: Center(
                child: TextFormField(
                    readOnly: true,
                    controller: _confirmDate,
                    autofocus: false,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 30, 136), width: 1),
                      ),
                      border: OutlineInputBorder(),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
                      labelText: '(MM-DD-YYYY)',
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Center(
                child: TextFormField(
                    readOnly: true,
                    initialValue: "${form_1.firstName} ${form_1.lastname}",
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 30, 136), width: 1),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 23, 30, 136)),
                      labelText: AppLocalizations.of(context).patientName,
                    )),
              ),
            ),

            //next form button
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
                      child: Form4(form_1: form_1),
                    ));
              },
              child: Text(
                AppLocalizations.of(context).nextForm,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25.0),
          ]),
        ),
      ),
    );
  }
}
