import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/language_picker_widget.dart';

class WhoWeAre extends StatefulWidget {
  const WhoWeAre({super.key});

  @override
  State<WhoWeAre> createState() => _WhoWeAreState();
}

//===================================================================================
//UI Start
class _WhoWeAreState extends State<WhoWeAre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
        title: Text(AppLocalizations.of(context).whoWeare),
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
//===================================================================================
//Body text
          Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Center(
                  child: Text(AppLocalizations.of(context).historyOf,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 77, 185)))))),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
            child: Center(
                child: Text(AppLocalizations.of(context).whoBody,
                    style: GoogleFonts.sora(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 89, 91, 133))))),
          ),
        ]),
      ),
    );
  }
}
