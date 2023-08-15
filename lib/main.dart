//The main dart file houses routes, theme data, and localization data

//Packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/l10n/l10n.dart';
import 'package:huda_clinic_mobile/provider/locale_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//All page routes
import 'package:huda_clinic_mobile/screens/welcome_page.dart';
import 'package:huda_clinic_mobile/screens/registration/registration_page.dart';
import 'package:huda_clinic_mobile/authentication/password_reset.dart';
import 'package:huda_clinic_mobile/screens/home_page.dart';
import 'package:huda_clinic_mobile/screens/logg.dart';
import 'package:huda_clinic_mobile/screens/partners.dart';
import 'package:huda_clinic_mobile/screens/care_provided.dart';
import 'package:huda_clinic_mobile/screens/who_we_are.dart';
import 'package:huda_clinic_mobile/screens/appt.dart';
import 'package:huda_clinic_mobile/screens/allproviders_page.dart';
import 'package:huda_clinic_mobile/screens/apptconf_page.dart';
import 'package:huda_clinic_mobile/screens/alldepts_page.dart';
import 'package:huda_clinic_mobile/screens/labanalytes_page.dart';
import 'package:huda_clinic_mobile/screens/ptdash_page.dart';
import 'package:huda_clinic_mobile/screens/problemlist_page.dart';

void main() => runApp(const MyApp());

final routerDelegate = GoRouter(
  // creating endpoint routes for all pages in app using GoRouter navigation routing system
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const WelcomePage(),
    ),
    GoRoute(
      path: '/registration',
      builder: (_, __) => const Registration(),
    ),
    GoRoute(
      path: '/password_reset',
      builder: (_, __) => const PasswordReset(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginWidget(),
    ),
    GoRoute(
      path: '/home',
      builder: (_, __) => const Homepage(),
    ),
    GoRoute(
      path: '/partners',
      builder: (_, __) => const Partners(),
    ),
    GoRoute(
      path: '/care_provided',
      builder: (_, __) => const CareProvided(),
    ),
    GoRoute(
      path: '/who_we_are',
      builder: (_, __) => const WhoWeAre(),
    ),
    GoRoute(
      path: '/patient_appointments',
      builder: (_, __) => const Home(),
    ),
    GoRoute(
      path: '/appointment_confirmation',
      builder: (_, __) => const Appt2(),
    ),
    GoRoute(
      path: '/all_departments',
      builder: (_, __) => AllDepts(),
    ),
    GoRoute(
      path: '/all_providers',
      builder: (_, __) => const AllProv(),
    ),
    GoRoute(
      path: '/lab_analytes',
      builder: (_, __) => const LabAnalytes(),
    ),
    GoRoute(
      path: '/problem_list',
      builder: (_, __) => ProblemList(),
    ),
    GoRoute(
      path: '/patient_profile',
      builder: (_, __) => const PatientProfilePage(),
    ),
  ],
);

/// This function indicates where in the database user writes to
DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("User");

//This will house theme and localization data
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp.router(
          routerConfig: routerDelegate,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            primaryColor: const Color.fromARGB(255, 23, 30, 136),
            appBarTheme: const AppBarTheme(
              color: Color.fromARGB(255, 23, 30, 136),
            ),
          ),
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
