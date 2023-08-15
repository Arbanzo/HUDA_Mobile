import 'package:flutter/material.dart';
import 'package:huda_clinic_mobile/screens/registration/reg_overview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../models/registration_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RadioRow<T> extends StatefulWidget {
  final TextEditingController controller; // * TextController from Form
  final List<T> groupVals; // ! Provides all possible values for radio group

  // ! Callback function to ppdate Stress Questionaire Total
  final VoidCallback? updateTotal;

  const RadioRow({
    super.key,
    required this.controller,
    required this.groupVals,
    this.updateTotal,
  });

  @override
  State<RadioRow> createState() => _RadioRow();
}

class _RadioRow<T> extends State<RadioRow<T>> {
  T? _choice; // ! Allows the value of Radio Buttons to switch

  @override
  void initState() {
    super.initState();
    // set _choice to be the first value in the groupVals array
    _choice = widget.groupVals[0];

    // * In case the user does not answer a question
    // * then default to the first value in the groupVals list.
    widget.controller.text = _choice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // Map over the groupVals and create Radio Buttons with callbacks
      // using each item in the list as a value
      children: widget.groupVals
          .map(
            (item) => Column(
              children: [
                Radio(
                  value: item,
                  groupValue: _choice,
                  onChanged: (value) {
                    setState(
                      () {
                        // Change _choice value to show change in UI
                        _choice = value;
                      },
                    );
                    // Set controller value to be the new value,
                    // call toString in case the type of the RadioButtons
                    // are of int
                    widget.controller.text = value.toString();
                    // ! Update total using VoidCallback, check if null
                    // ! since the "Yes"/"No" does not need calculation
                    if (widget.updateTotal != null) {
                      widget.updateTotal!();
                    }
                  },
                ),
                Text(
                  '$item',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class Form5 extends StatefulWidget {
  final form1 form_1;
  const Form5({super.key, required this.form_1});

  @override
  Form5State createState() => Form5State();
}

class Form5State extends State<Form5> {
  List<int> intVals = [0, 1, 2, 3];
  List<String> stringVals = ["No", "Yes"];

  // ! The following two text controllers must be initialized here
  // ! so we can use them to keep track of st
  TextEditingController sec1totalController = TextEditingController();
  TextEditingController sec2totalController = TextEditingController();
  String totalSec01 = "0";
  String totalSec02 = "0";

  @override
  void initState() {
    super.initState();
    sec1totalController.text = totalSec01;
    sec2totalController.text = totalSec02;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController sec1ans1Controller = TextEditingController();
    TextEditingController sec1ans2Controller = TextEditingController();
    TextEditingController sec1ans3Controller = TextEditingController();
    TextEditingController sec1ans4Controller = TextEditingController();
    TextEditingController sec1ans5Controller = TextEditingController();
    TextEditingController sec1ans6Controller = TextEditingController();
    TextEditingController sec1ans7Controller = TextEditingController();
    TextEditingController sec1ans8Controller = TextEditingController();
    TextEditingController sec2ans1Controller = TextEditingController();
    TextEditingController sec2ans2Controller = TextEditingController();
    TextEditingController sec2ans3Controller = TextEditingController();
    TextEditingController sec2ans4Controller = TextEditingController();
    TextEditingController sec2ans5Controller = TextEditingController();
    TextEditingController sec2ans6Controller = TextEditingController();
    TextEditingController sec2ans7Controller = TextEditingController();
    TextEditingController sec3ans1Controller = TextEditingController();
    TextEditingController sec3ans2Controller = TextEditingController();
    TextEditingController sec3ans3Controller = TextEditingController();
    TextEditingController sec3ans4Controller = TextEditingController();

    TextEditingController confirmDate = TextEditingController();
    confirmDate.text = DateFormat("MM-dd-yyyy").format(DateTime.now());

    final deviceData = MediaQuery.of(context); // ! GET DEVICE DATA

    // ! Callback function for Section 1 of Stress Questionaire that
    // ! will be passed to all RadioRows for section 1
    void updateTotalSec01() {
      // ! Recalculate total for section 1
      totalSec01 = (int.parse(sec1ans1Controller.text) +
              int.parse(sec1ans2Controller.text) +
              int.parse(sec1ans3Controller.text) +
              int.parse(sec1ans4Controller.text) +
              int.parse(sec1ans5Controller.text) +
              int.parse(sec1ans6Controller.text) +
              int.parse(sec1ans7Controller.text) +
              int.parse(sec1ans8Controller.text))
          .toString();
      sec1totalController.text = totalSec01; // ! Assign new total
    }

    // ! Callback function for Section 2 of Stress Questionaire that
    // ! will be passed to all RadioRows for section 1
    void updateTotalSec02() {
      // ! Recalculate total for section 1
      totalSec02 = (int.parse(sec2ans1Controller.text) +
              int.parse(sec2ans2Controller.text) +
              int.parse(sec2ans3Controller.text) +
              int.parse(sec2ans4Controller.text) +
              int.parse(sec2ans5Controller.text) +
              int.parse(sec2ans6Controller.text) +
              int.parse(sec2ans7Controller.text))
          .toString();
      sec2totalController.text = totalSec02; // ! Assign new total
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).form5bar),
          backgroundColor: const Color.fromARGB(255, 23, 30, 136),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
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
                currentStep: 5,
                size: 8,
                selectedColor: Color.fromARGB(255, 76, 109, 242),
                unselectedColor: Color.fromARGB(255, 167, 169, 202),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5stress,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 49, 77, 185)))))),
              Container(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 15),
                child: Center(
                    child: Text(AppLocalizations.of(context).form5body1,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 89, 91, 133))))),
              ),
              Container(
                  width: 220,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Text(AppLocalizations.of(context).form50,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
              Container(
                  width: 220,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Text(AppLocalizations.of(context).form51,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
              Container(
                  width: 220,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Text(AppLocalizations.of(context).form52,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
              Container(
                  width: 220,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Text(AppLocalizations.of(context).form53,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 25, 43, 122))))),
              const Divider(
                height: 20,
                thickness: 5,
                color: Color.fromARGB(255, 115, 119, 182),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5s1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 49, 77, 185)))))),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q1,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: RadioRow(
                  controller: sec1ans1Controller,
                  groupVals: intVals,
                  updateTotal: updateTotalSec01,
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q2,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Center(
                    child: RadioRow(
                      controller: sec1ans2Controller,
                      groupVals: intVals,
                      updateTotal: updateTotalSec01,
                    ),
                  )),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q3,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                    child: RadioRow(
                  controller: sec1ans3Controller,
                  groupVals: intVals,
                  updateTotal: updateTotalSec01,
                )),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q4,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec1ans4Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec01,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q5,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec1ans5Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec01,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q6,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec1ans6Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec01,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q7,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec1ans7Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec01,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s1q8,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec1ans8Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec01,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 1),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5total,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 49, 77, 185)))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: sec1totalController,
                      autofocus: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 30, 136),
                              width: 1),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
                      )),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 5,
                color: Color.fromARGB(255, 89, 91, 133),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5s2,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 49, 77, 185)))))),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q1,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans1Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q2,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans2Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q3,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans3Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q4,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans4Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q5,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans5Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q6,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans6Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s2q7,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec2ans7Controller,
                    groupVals: intVals,
                    updateTotal: updateTotalSec02,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 1),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5total,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 49, 77, 185)))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: sec2totalController,
                      autofocus: false,
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 23, 30, 136),
                              width: 1),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
                      )),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 5,
                color: Color.fromARGB(255, 89, 91, 133),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5s3,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 49, 77, 185)))))),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Center(
                      child: Text(AppLocalizations.of(context).form5s3q,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 89, 91, 133)))))),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s3q1,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                    child: RadioRow(
                  controller: sec3ans1Controller,
                  groupVals: stringVals,
                )),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s3q2,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                      controller: sec3ans2Controller, groupVals: stringVals),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s3q3,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: sec3ans3Controller,
                    groupVals: stringVals,
                  ),
                ),
              ),
              Container(
                  width: deviceData.size.width,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                  child: Text(AppLocalizations.of(context).form5s3q4,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 91, 133))))),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: Center(
                  child: RadioRow(
                    controller: sec3ans4Controller,
                    groupVals: stringVals,
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),

              //complete forms button
              MaterialButton(
                color: const Color.fromARGB(255, 49, 77, 185),
                minWidth: 225,
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () async {
                  widget.form_1.sec1ans1 = sec1ans1Controller.text;
                  widget.form_1.sec1ans2 = sec1ans2Controller.text;
                  widget.form_1.sec1ans3 = sec1ans3Controller.text;
                  widget.form_1.sec1ans4 = sec1ans4Controller.text;
                  widget.form_1.sec1ans5 = sec1ans5Controller.text;
                  widget.form_1.sec1ans6 = sec1ans6Controller.text;
                  widget.form_1.sec1ans7 = sec1ans7Controller.text;
                  widget.form_1.sec1ans8 = sec1ans8Controller.text;
                  widget.form_1.sec1total = sec1totalController.text;
                  widget.form_1.sec2ans1 = sec2ans1Controller.text;
                  widget.form_1.sec2ans2 = sec2ans2Controller.text;
                  widget.form_1.sec2ans3 = sec2ans3Controller.text;
                  widget.form_1.sec2ans4 = sec2ans4Controller.text;
                  widget.form_1.sec2ans5 = sec2ans5Controller.text;
                  widget.form_1.sec2ans6 = sec2ans6Controller.text;
                  widget.form_1.sec2ans7 = sec2ans7Controller.text;
                  widget.form_1.sec2total = sec2totalController.text;
                  widget.form_1.sec3ans1 = sec3ans1Controller.text;
                  widget.form_1.sec3ans2 = sec3ans2Controller.text;
                  widget.form_1.sec3ans3 = sec3ans3Controller.text;
                  widget.form_1.sec3ans4 = sec3ans4Controller.text;
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: RegOverview(form_1: widget.form_1),
                      ));
                },
                child: Text(
                  AppLocalizations.of(context).form5complete,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25.0),
            ]),
          ),
        ));
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
