import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/services/api_service.dart';

import '../model/apptconf_model.dart';

class Appt2 extends StatefulWidget {
  const Appt2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Appt2State createState() => _Appt2State();
}

class _Appt2State extends State<Appt2> {
  final List<Color> tileColors = [
    const Color.fromARGB(255, 167, 169, 202),
    const Color.fromARGB(255, 76, 109, 242)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go(
                '/home'); // go back to Homepage using GoRouter navigation routing system!
          },
        ),
        title: const Text('Appointment Confirmation Status'),
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: FutureBuilder<ApptConf>(
        future: ApiService().getCStatus(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              // create listview builder to display confirmation status from api after parsing!
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                final apptConf = snapshot.data!;
                final selectedColor = tileColors[index % tileColors.length];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: selectedColor.withOpacity(0.9),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      apptConf.shortname ??
                          "CONFIRMED APPOINTMENT", // null check for shortname! // display something when it is null!
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      apptConf.confirmationname ??
                          '', // null check for confirmationname! // display something when it is null!
                      style: const TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    tileColor: selectedColor.withOpacity(0.9),
                  ),
                );
              },
            );
          } else {
            return const Center(
                child:
                    CircularProgressIndicator()); //show loading bar while it calls the api data!
          }
        },
      ),
    );
  }
}
