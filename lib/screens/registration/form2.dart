// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:huda_clinic_mobile/screens/registration/form3.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:huda_clinic_mobile/models/registration_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widget/language_picker_widget.dart';

class Form2 extends StatelessWidget {
  final form1 form_1;
  const Form2({super.key, required this.form_1});

  @override
  Widget build(BuildContext context) {
    TextEditingController _confirmDate = TextEditingController();
    _confirmDate.text = DateFormat("MM-dd-yyyy").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).form2Bar),
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
              currentStep: 2, //current form of 5
              size: 8,
              selectedColor: Color.fromARGB(255, 76, 109, 242),
              unselectedColor: Color.fromARGB(255, 167, 169, 202),
            ),

            //form 2 header
            Container(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Center(
                    child: Text(AppLocalizations.of(context).form2Auth,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 77, 185)))))),

            //form 2 body
            Container(
              padding: const EdgeInsets.fromLTRB(17, 5, 17, 20),
              child: Center(
                  child: Text(AppLocalizations.of(context).form2Body,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),

            //form 2 body
            Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Center(
                    child: Text(AppLocalizations.of(context).form2Body2,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 77, 185)))))),

            //form 2 Sectioned points:
            Container(
              padding: const EdgeInsets.fromLTRB(17, 5, 17, 10),
              child: Center(
                  child: Text(AppLocalizations.of(context).form2A,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 5, 17, 10),
              child: Center(
                  child: Text(AppLocalizations.of(context).form2B,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 5, 17, 10),
              child: Center(
                  child: Text(AppLocalizations.of(context).form2C,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 5, 17, 10),
              child: Center(
                  child: Text(AppLocalizations.of(context).form2D,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
            ),

            //form 2 signature acknowledgment
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Center(
                  child: Text(AppLocalizations.of(context).form2sig,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),

            //Fields
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Center(
                child: TextFormField(
                    readOnly: true,
                    controller: _confirmDate,
                    autofocus: false,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == "") {
                        return AppLocalizations.of(context).fieldReq;
                      }
                      return null;
                    },
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Center(
                child: TextFormField(
                    readOnly: true,
                    initialValue: "${form_1.firstName} ${form_1.lastname}",
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim() == "") {
                        return AppLocalizations.of(context).fieldReq;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 77, 185), width: 1),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 90, 97, 226)),
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
                      child: Form3(form_1: form_1),
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
