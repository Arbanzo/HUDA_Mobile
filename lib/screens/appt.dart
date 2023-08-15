import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/services/api_service.dart';
import '../model/athena_json_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Color> colors = [
    const Color.fromARGB(255, 167, 169, 202),
    const Color.fromARGB(255, 76, 109, 242)
  ];

  final dateController = TextEditingController();
  List<Appointments>? _originalList;
  List<Appointments>? _filteredList; // to be used for the search function!

  @override
  void initState() {
    super.initState();
    ApiService().getAppts().then((list) {
      setState(() {
        _originalList = list;
        _filteredList = list; // to be used for the search function!
      });
    });

    dateController.addListener(() {
      setState(() {
        _filteredList = _originalList
            ?.where((appointment) =>
                appointment.date?.contains(dateController.text) ?? false)
            .toList(); // add to filtered list for searching!
      });
    });
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
        title: const Text('List Of Patient Appointments'),
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // textfield to search for a date!
              decoration: const InputDecoration(
                hintText: 'Search by date (MM/DD/YYYY)',
                prefixIcon: Icon(Icons.search),
              ),
              controller: dateController,
            ),
          ),
          Expanded(
            child: _filteredList != null && _filteredList!.isNotEmpty
                ? ListView.builder(
                    // create listview builder to display appointments from api after parsing!
                    itemCount: _filteredList!.length,
                    itemBuilder: (context, index) {
                      return Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: colors[index % colors.length],
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                        leading: const Icon(
                                            Icons.calendar_today_outlined,
                                            size: 45),
                                        title: Text(
                                          _filteredList![index].date ??
                                              "Test ID", // null check for date! // display something when it is null!
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        subtitle: Text(
                                          _filteredList![index]
                                                  .patientappointmenttypename ??
                                              "Test Type", // null check for patientappointmenttypename! // display something when it is null!
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        trailing: Wrap(children: <Widget>[
                                          const Text("Start Time: "),
                                          const Icon(Icons.schedule, size: 15),
                                          Text(
                                            _filteredList![index].starttime ??
                                                "Start Time", // null check for starttime! // display something when it is null!
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                        "No appointments found with this date.")), // show feedback while it is loading! or if it is null when the api is currently not working!
          ),
        ],
      ),
    );
  }
}
