import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huda_clinic_mobile/screens/registration/reg_complete.dart';
import 'package:page_transition/page_transition.dart';
import 'package:huda_clinic_mobile/models/registration_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widget/language_picker_widget.dart';

class RegOverview extends StatelessWidget {
  final form1 form_1;
  const RegOverview({super.key, required this.form_1});

//send email function powered by emailjs
  Future sendEmail({
    required String message,
  }) async {

    //all ids can be found in the emailjs account 
    const serviceId = 'service_vwn47mc'; 
    const templateId = 'template_03xh7bx';
    const userId = 'c-HdiY69REoUxVDkJ';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    // ignore: unused_local_variable
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'message': message,
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).regObar),
          actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
          backgroundColor: const Color.fromARGB(255, 23, 30, 136),
        ),
        body: SingleChildScrollView(
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
            const StepProgressIndicator(
              totalSteps: 6,
              currentStep: 6,
              size: 8,
              selectedColor: Color.fromARGB(255, 76, 109, 242),
              unselectedColor: Color.fromARGB(255, 167, 169, 202),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
                child: Text(AppLocalizations.of(context).regObody,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 77, 185))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: Text(AppLocalizations.of(context).form1PI,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 77, 185))))),

            //Reprints all inputted data for review 
            Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 50, 15),
                child: Text(
                    "${AppLocalizations.of(context).fullname}: ${form_1.firstName} ${form_1.lastname} \n"
                    "${AppLocalizations.of(context).dob}: ${form_1.dob} \n${AppLocalizations.of(context).sex}: ${form_1.sex} \n"
                    "${AppLocalizations.of(context).insurance}: ${form_1.insurance} \nEmail: ${form_1.email} \n"
                    "${AppLocalizations.of(context).phone}: ${form_1.phone} \n${AppLocalizations.of(context).callConsent}: ${form_1.callconsent} \n"
                    "${AppLocalizations.of(context).textConsent}: ${form_1.textconsent} \n${AppLocalizations.of(context).maritalStatus}: ${form_1.maritalstatus} \n"
                    "${AppLocalizations.of(context).householdSize}: ${form_1.householdsize} \n${AppLocalizations.of(context).income}: ${form_1.income} \n"
                    "${AppLocalizations.of(context).address}: ${form_1.address}\n${AppLocalizations.of(context).city}: ${form_1.city}\n${AppLocalizations.of(context).state}: ${form_1.state}\n"
                    "${AppLocalizations.of(context).zip}: ${form_1.zipcode}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: Text(AppLocalizations.of(context).contacts,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 49, 77, 185))))),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                child: Text(AppLocalizations.of(context).rep1,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 122, 0),
                child: Text(
                    "${AppLocalizations.of(context).fullname}: ${form_1.contact1Fname} ${form_1.contact1Lname}\n"
                    "${AppLocalizations.of(context).form4relation}: ${form_1.contact1Relation}\n"
                    "${AppLocalizations.of(context).phone}: ${form_1.contact1Phone}\n",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Center(
                    child: Text(AppLocalizations.of(context).rep2,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 89, 91, 133)))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 122, 0),
                child: Text(
                    "${AppLocalizations.of(context).fullname}: ${form_1.contact2Fname} ${form_1.contact2Lname}\n"
                    "${AppLocalizations.of(context).form4relation}: ${form_1.contact2Relation}\n"
                    "${AppLocalizations.of(context).phone}: ${form_1.contact2Phone}\n",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 89, 91, 133))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: Center(
                    child: Text(AppLocalizations.of(context).rep3,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 89, 91, 133)))))),
            Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 122, 15),
                child: Text(
                    "${AppLocalizations.of(context).fullname}: ${form_1.contact3Fname} ${form_1.contact3Lname}\n"
                    "${AppLocalizations.of(context).form4relation}: ${form_1.contact3Relation}\n"
                    "${AppLocalizations.of(context).phone}: ${form_1.contact3Phone}\n",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 89, 91, 133))))),

            //suybmit forms button                
            MaterialButton(
              color: const Color.fromARGB(255, 49, 77, 185),
              minWidth: 225,
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                //sends email using emailjs api
                sendEmail(
                    message: 'Patient Information\n'
                        'Patient Name: ${form_1.firstName} ${form_1.lastname} \n'
                        'Patient Date of Birth: ${form_1.dob} \nPatient Sex: ${form_1.sex} \n'
                        'Patient insurance: ${form_1.insurance} \nEmail address: ${form_1.email} \n'
                        'Phone number: ${form_1.phone} \nConsent to call: ${form_1.callconsent} \n'
                        'Consent to text: ${form_1.textconsent} \nMarital Status: ${form_1.maritalstatus} \n'
                        'Household size: ${form_1.householdsize} \nIncome: ${form_1.income} \n'
                        'Address: ${form_1.address}\nCity: ${form_1.city}\nState: ${form_1.state}\n'
                        'Zip: ${form_1.zipcode}\n\n'
                        'Designated Representative(s):\n'
                        'Representative name: ${form_1.contact1Fname} ${form_1.contact1Lname}\n'
                        'Relation to patient: ${form_1.contact1Relation}\n'
                        'Represenative phone number: ${form_1.contact1Phone}\n\n'
                        'Questionaire Results\n'
                        'Section 1:\n'
                        'Question 1: ${form_1.sec1ans1}\n'
                        'Question 2: ${form_1.sec1ans2}\n Question 3: ${form_1.sec1ans3}\n'
                        'Question 4: ${form_1.sec1ans4}\n Question 5: ${form_1.sec1ans5}\n'
                        'Question 6: ${form_1.sec1ans6}\n Question 7: ${form_1.sec1ans7}\n'
                        'Question 8: ${form_1.sec1ans7}\n Total Score: ${form_1.sec1total}\n'
                        'Section 2:\n'
                        'Question 1: ${form_1.sec2ans1}\n'
                        'Question 2: ${form_1.sec2ans2}\n Question 3: ${form_1.sec2ans3}\n'
                        'Question 4: ${form_1.sec2ans4}\n Question 5: ${form_1.sec2ans5}\n'
                        'Question 6: ${form_1.sec2ans6}\n Question 7: ${form_1.sec2ans7}\n'
                        'Total Score: ${form_1.sec2total}\n'
                        'Section 3:\n'
                        'Question 1: ${form_1.sec3ans1}\n'
                        'Question 2: ${form_1.sec3ans2}\n Question 3: ${form_1.sec3ans3}\n'
                        'Question 4: ${form_1.sec3ans4}\n');
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const RegComplete(),
                    ));
              },
              child: Text(
                AppLocalizations.of(context).regSub,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25.0),
          ]),
        ));
  }
}
