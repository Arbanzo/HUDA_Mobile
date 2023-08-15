// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/services/api_service.dart';

import '../model/labanalytes_model.dart';

class LabAnalytes extends StatefulWidget {
  const LabAnalytes({super.key});

  @override
  _LabAnalytesState createState() => _LabAnalytesState();
}

class _LabAnalytesState extends State<LabAnalytes> {
  String? _errorMessage;
  late TextEditingController _textEditingController;

  final List<Color> _borderColors = [
    const Color.fromARGB(255, 167, 169, 202),
    const Color.fromARGB(255, 76, 109, 242)
  ];

  List<Analytes>? _labAnalytesList;
  List<Analytes>? _filteredList; // to be used for the search function!

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    ApiService().getLabAnalytes().then((value) {
      setState(() {
        _labAnalytesList = value;
        _filteredList = value; // to be used for the search function!
      });
    }).catchError((error) {
      setState(() {
        _errorMessage = error.toString();
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _searchLabAnalytes(String query) {
    if (_labAnalytesList == null) {
      return;
    }
    final updatedList = _labAnalytesList!
        .where((analyte) =>
            analyte.analytename != null &&
            analyte.analytename!
                .toLowerCase() // set all lowercase to make search easier!
                .contains(query.toLowerCase()))
        .toList(); // add to filtered list for searching!
    setState(() {
      _filteredList = updatedList;
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
          'Lab Analytes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      backgroundColor: Colors.grey[50],
      body: _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // textfield to search for a lab analyte name!
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Search Lab Analyte Name',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) => _searchLabAnalytes(query),
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                  // create separated listview builder to display lab values from api after parsing!
                  itemCount: _filteredList?.length ?? 0,
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
                                    Icons.science_rounded,
                                    size: 45,
                                    color: _borderColors[
                                        index % _borderColors.length],
                                  ),
                                  title: Text(
                                    _filteredList![index].analytename ??
                                        "Analyte Name", // null check for analytename! // display something when it is null!
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Value: ${_filteredList![index].value ?? "Analyte Value"}", // null check for value! // display something when it is null!
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  isThreeLine: true,
                                  trailing: Wrap(
                                    children: [
                                      const Icon(Icons.check_circle, size: 15),
                                      const Text("Result: "),
                                      Text(
                                        _filteredList![index].valuestatus ??
                                            "N/A", // null check for valuestatus! // display something when it is null!
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
                    return const SizedBox(height: 10);
                  },
                )),
              ],
            ),
    );
  }
}
