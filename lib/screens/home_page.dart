// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Card apiTile(String title) {
      return Card(
        elevation: 1.0,
        margin: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 23, 30, 136),
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () async {
              context.go(
                  '/patient_appointments'); // go to patient appointments list using GoRouter navigation routing system!
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.5, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Card apiTile2(String title) {
      return Card(
        elevation: 1.0,
        margin: const EdgeInsets.fromLTRB(10.0, 20.0, 20, 10),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 23, 30, 136),
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () async {
              context.go(
                  '/appointment_confirmation'); // go to patient appointments confirmation page using GoRouter navigation routing system!
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.5, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
        elevation: 0,
        title: const Text("Home Page"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Align(
                alignment: Alignment.center,
                child: Image.asset('lib/assets/huda_logo.png',
                    height: 145, width: 145)),
            const SizedBox(height: 20),
            GridView.count(
              // create GridView to show the different tiles to choose from with 2 tiles on each row!
              shrinkWrap: true,
              primary: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: <Widget>[
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.8,
                    child: GestureDetector(
                      onTap: () async {
                        context.go(
                            '/patient_appointments'); // go to patient appointments list using GoRouter navigation routing system!
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 23, 30, 136),
                              Colors.blue.shade500
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).homePaget1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.8,
                    child: GestureDetector(
                      onTap: () async {
                        context.go(
                            '/appointment_confirmation'); // go to patient appointments confirmation page using GoRouter navigation routing system!
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 23, 30, 136),
                              Colors.blue.shade500
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).homePaget2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.8,
                    child: GestureDetector(
                      onTap: () async {
                        context.go(
                            '/lab_analytes'); // go to lab analytes list using GoRouter navigation routing system!
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 23, 30, 136),
                              Colors.blue.shade500
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Lab Analytes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    heightFactor: 0.8,
                    child: GestureDetector(
                      onTap: () async {
                        context.go(
                            '/problem_list'); // go to problem list using GoRouter navigation routing system!
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 23, 30, 136),
                              Colors.blue.shade500
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Problem List",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      drawer: Drawer(
        // this is for the hamburger menu! it will display patient profile, list of all providers, and list of all departments!
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 130,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 30, 136),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  child: Text('Menu'),
                ),
              ),
            ),
            ListTile(
              title:
                  const Text('Patient Profile', style: TextStyle(fontSize: 18)),
              onTap: () async {
                context.go(
                    '/patient_profile'); // go to patient profile using GoRouter navigation routing system!
              },
            ),
            ListTile(
              title: const Text('List of all providers',
                  style: TextStyle(fontSize: 18)),
              onTap: () async {
                context.go(
                    '/all_providers'); // go to providers list using GoRouter navigation routing system!
              },
            ),
            ListTile(
              title: const Text('List of all departments',
                  style: TextStyle(fontSize: 18)),
              onTap: () async {
                context.go(
                    '/all_departments'); // go to departments list using GoRouter navigation routing system!
              },
            ),
            ListTile(
              title: const Text('Logout', style: TextStyle(fontSize: 18)),
              onTap: () async {
                context.go(
                    "/"); // go to departments list using GoRouter navigation routing system!
              },
            ),
          ],
        ),
      ),
    );
  }
}
