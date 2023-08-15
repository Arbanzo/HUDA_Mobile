// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/screens/welcome_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/language_picker_widget.dart';

class RegComplete extends StatelessWidget {
  const RegComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).regcomBar),
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

          //registration cokmplete body
          Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Center(
                  child: Text(AppLocalizations.of(context).regcomBody,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185)))))),

          //call clinic prompt
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Center(
              child: Row(children: [
                Text(AppLocalizations.of(context).regcomcallq,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 89, 91, 133)))),
                //call clinic button
                ElevatedButton(
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber(
                        '3138658446'); //calls thius number
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 23, 30, 136),
                  ),
                  child: Text(AppLocalizations.of(context).regcomcall,
                      style: const TextStyle(
                        color: Colors.white,
                      )),
                ),
              ]),
            ),
          ),

          const Divider(
            height: 10,
            thickness: 1.0,
            color: Color.fromARGB(255, 89, 91, 133),
          ),
          //clinic hours
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Center(
                child: Text(AppLocalizations.of(context).regcomhours,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 89, 91, 133))))),
          ),

          const Divider(
            height: 10,
            thickness: 1.0,
            color: Color.fromARGB(255, 89, 91, 133),
          ),
          const SizedBox(
            height: 10.0,
          ),
          //Maps route button
          Center(
            child: ElevatedButton(
              onPressed: () => MapsLauncher.launchQuery(
                  '13240 Woodrow Wilson St, Detroit, MI 48238'), //this address
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 23, 30, 136),
              ),
              child: Text(AppLocalizations.of(context).regGo,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Center(
            //routes back to welcome page
            child: MaterialButton(
              color: const Color.fromARGB(255, 49, 77, 185),
              minWidth: 225,
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                context.go("/");
              },
              child: Text(
                AppLocalizations.of(context).regEnd,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 28.0,
          ),
          Container(
            height: 20.0,
          ),
        ]),
      ),
    );
  }
}
