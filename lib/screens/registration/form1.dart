//This is form 1, here users will be able to input information as part of the registration process

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:huda_clinic_mobile/screens/registration/form2.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:huda_clinic_mobile/models/registration_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:email_validator/email_validator.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../widget/language_picker_widget.dart';
import 'form5.dart';

//Creates stateful state for routing
class Form1 extends StatefulWidget {
  final form1 form_1;
  const Form1({super.key, required this.form_1});

  @override
  Form1State createState() {
    return Form1State();
  }
}

// This class holds data related to the form.
class Form1State extends State<Form1> {
  List<String> stringVals = ["Yes", "No"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Initializes each form field as part of the array
    TextEditingController firstnameController = TextEditingController();
    // !firstnameController.text = form_1.firstName ?? "";
    TextEditingController _lastnameController = TextEditingController();
    // ! _lastnameController.text = form_1.lastname ?? "";
    TextEditingController _dobController = TextEditingController();
    // ! _dobController.text = form_1.dob ?? "";
    TextEditingController _sexController = TextEditingController();
    // ! _sexController.text = form_1.sex ?? "";
    TextEditingController _insuranceController = TextEditingController();
    // ! _insuranceController.text = form_1.insurance ?? "";
    TextEditingController _emailController = TextEditingController();
    // ! _emailController.text = form_1.email ?? "";
    TextEditingController _phoneController = TextEditingController();
    // ! _phoneController.text = form_1.phone ?? "";
    TextEditingController _callconsentController = TextEditingController();
    // ! _callconsentController.text = form_1.callconsent ?? "";
    TextEditingController _textconsentController = TextEditingController();
    // ! _textconsentController.text = form_1.textconsent ?? "";
    TextEditingController _maritalstatusController = TextEditingController();
    // ! _maritalstatusController.text = form_1.maritalstatus ?? "";
    TextEditingController _householdsizeController = TextEditingController();
    // ! _householdsizeController.text = form_1.householdsize ?? "";
    TextEditingController _employmentController = TextEditingController();
    // ! _employmentController.text = form_1.employment ?? "";
    TextEditingController _incomeController = TextEditingController();
    // ! _incomeController.text = form_1.income ?? "";
    TextEditingController _addressController = TextEditingController();
    // ! _addressController.text = form_1.address ?? "";
    TextEditingController _cityController = TextEditingController();
    // ! _cityController.text = form_1.city ?? "";
    TextEditingController _stateController = TextEditingController();
    // ! _stateController.text = form_1.state ?? "";
    TextEditingController _zipcodeController = TextEditingController();
    // ! _zipcodeController.text = form_1.zipcode ?? "";
    TextEditingController _confirmDate = TextEditingController();
    _confirmDate.text = DateFormat("MM-dd-yyyy")
        .format(DateTime.now()); //sets date to current day

    //UI Begins
    return Scaffold(
        appBar: AppBar(
          actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
          title: Text(
            AppLocalizations.of(context)
                .form1Bar, //There is no text due to localizations. refer to the .arb files in l10n folder
          ),
          backgroundColor: const Color.fromARGB(255, 23, 30, 136),
        ),
        body: SingleChildScrollView(
          //Ensures scrollable page
          child: Form(
            key: _formKey,
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
                currentStep: 1,
                size: 8,
                selectedColor: Color.fromARGB(255, 76, 109, 242),
                unselectedColor: Color.fromARGB(255, 167, 169, 202),
              ),
              //Personal information heading text
              Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(AppLocalizations.of(context).form1PI,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185))))),

              //First name field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller:
                          firstnameController, //Identifies what field controller we are using
                      autofocus:
                          false, //False ensures that a user HAS to click on the field in order to input.

                      //Validation function
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim() == "") {
                          return AppLocalizations.of(context)
                              .fieldReq; //validation message
                        }
                        return null;
                      },
                      //The actual input tile
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 49, 77, 185),
                                width: 1),
                          ),
                          border: const OutlineInputBorder(),
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 23, 30, 136)),
                          labelText: (AppLocalizations.of(context).firstName))),
                ),
              ),

              //Last name field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _lastnameController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: (AppLocalizations.of(context).lastName),
                      )),
                ),
              ),

              //Date of birth field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      readOnly: true,
                      controller: _dobController,
                      autofocus: false,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim() == "") {
                          return AppLocalizations.of(context).fieldReq;
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 36500)));

                        if (selectedDate != null) {
                          _dobController.text =
                              DateFormat("MM-dd-yyyy").format(selectedDate);
                        }
                      },
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: 'DOB (MM-DD-YYYY)',
                      )),
                ),
              ),

              //Patient Sex field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _sexController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: (AppLocalizations.of(context).sex),
                      )),
                ),
              ),

              //Insurance field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _insuranceController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: (AppLocalizations.of(context).insurance),
                      )),
                ),
              ),

              //Form 1 section 2 header
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Text(AppLocalizations.of(context).form1CI,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185))))),

              //user email field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    autofocus: false,
                    validator: (value) => EmailValidator.validate(value ?? "")
                        ? null
                        : "Please enter a valid email",
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 77, 185), width: 1),
                      ),
                      border: OutlineInputBorder(),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 23, 30, 136)),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),

              //user phone field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: IntlPhoneField(
                    initialValue: "(123)-456-7890",
                    controller: _phoneController,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 49, 77, 185), width: 1),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 23, 30, 136)),
                      labelText: (AppLocalizations.of(context).phone),
                    ),
                  ),
                ),
              ),

              // Call consent field
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                child: Text(
                  AppLocalizations.of(context).callConsent,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.sora(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 89, 91, 133),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: _callconsentController,
                    groupVals: stringVals,
                  ),
                ),
              ),

              // Text consent field
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 1),
                child: Text(
                  AppLocalizations.of(context).textConsent,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.sora(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 89, 91, 133),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: RadioRow(
                    controller: _textconsentController,
                    groupVals: stringVals,
                  ),
                ),
              ),

              //Form 1 section 3 header
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Text(AppLocalizations.of(context).form1Empl,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185))))),

              //user marital status field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _maritalstatusController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).maritalStatus,
                      )),
                ),
              ),

              //Household size field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _householdsizeController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).householdSize,
                      )),
                ),
              ),

              //Employment status field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _employmentController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).emplStat,
                      )),
                ),
              ),

              //User income field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _incomeController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).income,
                      )),
                ),
              ),

              //Address header
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Text(AppLocalizations.of(context).address,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185))))),

              //Address field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _addressController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).stAddress,
                      )),
                ),
              ),

              //City field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _cityController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).city,
                      )),
                ),
              ),

              //State field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _stateController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).state,
                      )),
                ),
              ),

              //Zipcode field
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Center(
                  child: TextFormField(
                      controller: _zipcodeController,
                      autofocus: false,
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 23, 30, 136)),
                        labelText: AppLocalizations.of(context).zip,
                      )),
                ),
              ),

              //Form 1 terms header
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Text(AppLocalizations.of(context).f1Terms,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185))))),
              //Form 1 terms text
              Container(
                padding: const EdgeInsets.fromLTRB(17, 5, 17, 5),
                child: Center(
                    child: Text(AppLocalizations.of(context).f1Text,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 89, 91, 133))))),
              ),

              //Patient Signature field, simply auto-fills inputted name
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                child: Center(
                  child: TextFormField(
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 90, 97, 226)),
                        labelText: AppLocalizations.of(context).patientName,
                      )),
                ),
              ),

              //Current date field for signature, auto-fills
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
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
                              color: Color.fromARGB(255, 49, 77, 185),
                              width: 1),
                        ),
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 89, 91, 133)),
                        labelText: '(MM-DD-YYYY)',
                      )),
                ),
              ),

              //Next form button
              MaterialButton(
                color: const Color.fromARGB(255, 49, 77, 185),
                minWidth: 225,
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  //These lines essentially push the inputted data to the current empty values
                  widget.form_1.firstName = firstnameController.text;
                  widget.form_1.lastname = _lastnameController.text;
                  widget.form_1.dob = _dobController.text;
                  widget.form_1.sex = _sexController.text;
                  widget.form_1.insurance = _insuranceController.text;
                  widget.form_1.email = _emailController.text;
                  widget.form_1.phone = _phoneController.text;
                  widget.form_1.callconsent = _callconsentController.text;
                  widget.form_1.textconsent = _textconsentController.text;
                  widget.form_1.maritalstatus = _maritalstatusController.text;
                  widget.form_1.householdsize = _householdsizeController.text;
                  widget.form_1.employment = _employmentController.text;
                  widget.form_1.income = _incomeController.text;
                  widget.form_1.address = _addressController.text;
                  widget.form_1.city = _cityController.text;
                  widget.form_1.state = _stateController.text;
                  widget.form_1.zipcode = _zipcodeController.text;

                  //This commented portion of code would store all data to a database, it is a backup in the event current
                  //registration processing is no longer usable for any reason

                  /* await db.collection("Registration").add(
                    {
                    'firstname': form_1.firstName,
                    'lastname': form_1.lastname,
                    'DOB': form_1.dob,
                    'Sex': form_1.sex,
                    'Insurance': form_1.insurance,
                    'email': form_1.email,
                    'phone': form_1.phone,
                    'ConsentToCall': form_1.callconsent,
                    'ConsentToText': form_1.textconsent,
                    'Marital Status': form_1.maritalstatus,
                    'Household Size': form_1.householdsize,
                    'Employment': form_1.employment,
                    'Income': form_1.income,
                    'Address': form_1.address,
                    'City': form_1.city,
                    'State': form_1.state,
                    'Zip Code': form_1.zipcode,
                  } 
                  );*/
                  // ignore: use_build_context_synchronously
                  if (!_formKey.currentState!.validate()) {
                    //Validates and doesnt let user pass if a field is blank
                    return;
                  }

                  //Navigation to next page
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: Form2(form_1: widget.form_1),
                      ));
                },
                child: Text(
                  AppLocalizations.of(context).nextForm,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 35.0),
            ]),
          ),
        ));
  }
}
