// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:huda_clinic_mobile/screens/registration/form5.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../models/registration_fields.dart';
import '../../widget/language_picker_widget.dart';

class Form4 extends StatelessWidget {
  final form1 form_1;
  const Form4({super.key, required this.form_1});

  @override
  Widget build(BuildContext context) {
    TextEditingController contact1firstnameController = TextEditingController();
    contact1firstnameController.text = form_1.contact1Fname ?? "";
    TextEditingController contact1lastnameController = TextEditingController();
    contact1lastnameController.text = form_1.contact1Lname ?? "";
    TextEditingController contact1RelationController = TextEditingController();
    contact1RelationController.text = form_1.contact1Relation ?? "";
    TextEditingController contact1phoneController = TextEditingController();
    contact1phoneController.text = form_1.contact1Phone ?? "";
    TextEditingController contact2firstnameController = TextEditingController();
    contact2firstnameController.text = form_1.contact1Fname ?? "";
    TextEditingController contact2lastnameController = TextEditingController();
    contact2lastnameController.text = form_1.contact2Lname ?? "";
    TextEditingController contact2RelationController = TextEditingController();
    contact2RelationController.text = form_1.contact2Relation ?? "";
    TextEditingController contact2phoneController = TextEditingController();
    contact2phoneController.text = form_1.contact2Phone ?? "";
    TextEditingController contact3firstnameController = TextEditingController();
    contact3firstnameController.text = form_1.contact3Fname ?? "";
    TextEditingController contact3lastnameController = TextEditingController();
    contact3lastnameController.text = form_1.contact3Lname ?? "";
    TextEditingController contact3RelationController = TextEditingController();
    contact3RelationController.text = form_1.contact3Relation ?? "";
    TextEditingController contact3phoneController = TextEditingController();
    contact3phoneController.text = form_1.contact3Phone ?? "";

    TextEditingController _confirmDate = TextEditingController();
    _confirmDate.text = DateFormat("MM-dd-yyyy").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).form4bar),
        actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 17,
            ),
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
              currentStep: 4, //current progress
              size: 8,
              selectedColor: Color.fromARGB(255, 76, 109, 242),
              unselectedColor: Color.fromARGB(255, 167, 169, 202),
            ),

            //form 4 header
            Container(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Center(
                    child: Text(AppLocalizations.of(context).form4des,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 77, 185)))))),

            //form 4 body
            Container(
              padding: const EdgeInsets.fromLTRB(18, 5, 18, 15),
              child: Center(
                  child: Text(AppLocalizations.of(context).form4body1,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 15),
              child: Center(
                  child: Text(AppLocalizations.of(context).form4body2,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
              child: Center(
                  child: Text(AppLocalizations.of(context).form4body3,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),

            //form 4 rep fields
            //No validation is needed for these fields as this is NOT mandatory by the patient
            Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                child: Text(AppLocalizations.of(context).rep1,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact1firstnameController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).firstName,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact1lastnameController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).lastName,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact1RelationController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).form4relation,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact1phoneController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).phone,
                    )),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                child: Text(AppLocalizations.of(context).rep2,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact2firstnameController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).firstName,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact2lastnameController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).lastName,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact2RelationController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).form4relation,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact2phoneController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).phone,
                    )),
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                child: Text(AppLocalizations.of(context).rep3,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact3firstnameController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).firstName,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact3lastnameController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).lastName,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact3RelationController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).form4relation,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Center(
                child: TextFormField(
                    controller: contact3phoneController,
                    autofocus: false,
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
                      labelText: AppLocalizations.of(context).phone,
                    )),
              ),
            ),

            //Signature text and input fields
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Center(
                  child: Text(AppLocalizations.of(context).form4sig,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 89, 91, 133))))),
            ),
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
              onPressed: () async {
                form_1.contact1Fname = contact1firstnameController.text;
                form_1.contact1Lname = contact1lastnameController.text;
                form_1.contact1Relation = contact1RelationController.text;
                form_1.contact1Phone = contact1phoneController.text;
                form_1.contact2Fname = contact2firstnameController.text;
                form_1.contact2Lname = contact2lastnameController.text;
                form_1.contact2Relation = contact2RelationController.text;
                form_1.contact2Phone = contact2phoneController.text;
                form_1.contact3Fname = contact3firstnameController.text;
                form_1.contact3Lname = contact3lastnameController.text;
                form_1.contact3Relation = contact3RelationController.text;
                form_1.contact3Phone = contact3phoneController.text;
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Form5(form_1: form_1),
                    ));
              },
              child: const Text(
                "Next Form",
                style: TextStyle(color: Colors.white, fontSize: 20),
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
