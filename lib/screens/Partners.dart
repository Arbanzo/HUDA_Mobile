// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/language_picker_widget.dart';

class Partners extends StatefulWidget {
  const Partners({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PartnerState createState() => _PartnerState();
}

class _PartnerState extends State<Partners> {
  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width; // responsive to any device screen!
    final itemWidth = (screenWidth - 20) / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).ourPartners),
        actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/huda_logo.png',
                    height: 95,
                    width: 95,
                  ),
                  const SizedBox(height: 17),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).partnerbody,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 49, 77, 185))),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2.0,
                    color: Color.fromARGB(255, 25, 43, 122),
                  ),
                ],
              ),
            ),
            GridView.count(
              // create a GridView since it was a very long page before this but I changed it to show logos without text, displaying icons of 3 on each row to make it look much nicer!
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: screenWidth / (4 * itemWidth), // responsive
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              padding: const EdgeInsets.all(5),
              children: List.generate(28, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        index == 0
                            ? 'lib/assets/st_joseph_mercy_oakland_logo.jpg'
                            : index == 1
                                ? 'lib/assets/msu_chm_logo.jpg'
                                : index == 2
                                    ? 'lib/assets/msucom_logo.jpg'
                                    : index == 3
                                        ? 'lib/assets/cfsem_logo.png'
                                        : index == 4
                                            ? 'lib/assets/delta_dental_logo.jpg'
                                            : index == 5
                                                ? 'lib/assets/wayne_pharmacy_logo.png'
                                                : index == 6
                                                    ? 'lib/assets/elite_smile_logo.jpg'
                                                    : index == 7
                                                        ? 'lib/assets/say_clinic_logo.jpg'
                                                        : index == 8
                                                            ? 'lib/assets/circle_socks_logo.jpg'
                                                            : index == 9
                                                                ? 'lib/assets/iagd_logo.jpg'
                                                                : index == 10
                                                                    ? 'lib/assets/michigan_muslim_community_council_logo.jpg'
                                                                    : index ==
                                                                            11
                                                                        ? 'lib/assets/tawheed_center_logo.jpg'
                                                                        : index ==
                                                                                12
                                                                            ? 'lib/assets/mclogo.jpg'
                                                                            : index == 13
                                                                                ? 'lib/assets/wcccdlogo_fw_logo.png'
                                                                                : index == 14
                                                                                    ? 'lib/assets/detroit_mercy_dental_logo.png'
                                                                                    : index == 15
                                                                                        ? 'lib/assets/umich_logo.jpeg'
                                                                                        : index == 16
                                                                                            ? 'lib/assets/bcccp_tri_county_logo_4c.png'
                                                                                            : index == 17
                                                                                                ? 'lib/assets/eye_surgeons.png'
                                                                                                : index == 18
                                                                                                    ? 'lib/assets/lasmc_logo.jpg'
                                                                                                    : index == 19
                                                                                                        ? 'lib/assets/ferndale_logo.jpg'
                                                                                                        : index == 20
                                                                                                            ? 'lib/assets/shores_logo.png'
                                                                                                            : index == 21
                                                                                                                ? 'lib/assets/msun_logo.jpg'
                                                                                                                : index == 22
                                                                                                                    ? 'lib/assets/chamberlain_logo.jpg'
                                                                                                                    : index == 23
                                                                                                                        ? 'lib/assets/pcardiosp_logo.jpg'
                                                                                                                        : index == 24
                                                                                                                            ? 'lib/assets/authority.jpg'
                                                                                                                            : index == 25
                                                                                                                                ? 'lib/assets/matrix.jpg'
                                                                                                                                : index == 26
                                                                                                                                    ? 'lib/assets/access.jpg'
                                                                                                                                    : index == 27
                                                                                                                                        ? 'lib/assets/lah_logo.png'
                                                                                                                                        : 'lib/assets/bcbs_logo.jpg',
                        height: itemWidth * 1.1, // responsive
                        width: itemWidth,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
