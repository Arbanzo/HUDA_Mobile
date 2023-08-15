import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/services/api_service.dart';

import '../model/alldepts_model.dart';

// ignore: use_key_in_widget_constructors
class AllDepts extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AllDeptsState createState() => _AllDeptsState();
}

class _AllDeptsState extends State<AllDepts> {
  final List<Color> _borderColors = [
    const Color.fromARGB(255, 167, 169, 202),
    const Color.fromARGB(255, 76, 109, 242)
  ];
  List<Departments>? _originalList;
  List<Departments>? _filteredList; // to be used for the search function!

  @override
  void initState() {
    super.initState();
    ApiService().getAllDepts().then((list) {
      setState(() {
        _originalList = list;
        _filteredList = list; // to be used for the search function!
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
        title: const Text(
          'List of All Departments',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // textfield to search for a department name!
              decoration: const InputDecoration(
                hintText: 'Search by department name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _filteredList = _originalList
                      ?.where((dept) => dept.patientdepartmentname!
                          .toLowerCase() // set all lowercase to make search easier!
                          .contains(value.toLowerCase()))
                      .toList(); // add to filtered list for searching!
                });
              },
            ),
          ),
          Expanded(
            child: _filteredList != null
                ? ListView.separated(
                    // create separated listview builder to display departments from api after parsing!
                    itemCount: _filteredList!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: _borderColors[index % _borderColors.length],
                            width: 2,
                          ),
                        ),
                        elevation: 4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.business, // hospital icon!
                                      size: 45,
                                      color: _borderColors[
                                          index % _borderColors.length],
                                    ),
                                    title: Text(
                                      _filteredList![index]
                                              .patientdepartmentname ??
                                          'Department Name', // null check for patientdepartmentname! // display something when it is null!
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle: Text(
                                      _filteredList![index]
                                              .placeofservicetypename ??
                                          'Place of Service Type', // null check for placeofservicetypename! // display something when it is null!
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    isThreeLine: true,
                                    trailing: Wrap(
                                      children: [
                                        const Icon(Icons.fax, size: 15),
                                        const Text('Fax: '),
                                        Text(
                                          _formatFaxNumber(
                                                  _filteredList![index].fax) ??
                                              "N/A", // null check for fax! // display something when it is null!
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  )
                : const Center(
                    child:
                        CircularProgressIndicator()), //show loading bar while it calls the api data!
          ),
        ],
      ),
    );
  }
}

String? _formatFaxNumber(String? fax) {
  // for post processing to format the fax number and displaying to screen, since the api data is not consistent!
  if (fax?.length != 10) return fax;
  return '${'('}${fax?.substring(0, 3)}${')'} ${fax?.substring(3, 6)}-${fax?.substring(6)}';
}
