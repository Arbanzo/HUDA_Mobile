// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/services/api_service.dart';

import '../model/problemlist_model.dart';

// ignore: use_key_in_widget_constructors
class ProblemList extends StatefulWidget {
  @override
  _ProblemListState createState() => _ProblemListState();
}

class _ProblemListState extends State<ProblemList> {
    // ignore: unused_field
    String? _errorMessage;
  final List<Color> _borderColors = [
    const Color.fromARGB(255, 167, 169, 202),
    const Color.fromARGB(255, 76, 109, 242)
  ];
  late Future<List<Problems>?> _future;
  List<Problems> _problems = []; // to be used for the search function!
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _future = ApiService().getProblemList();
  }

  _filterProblems(String searchText) {
    setState(() {
      _problems = searchText.isEmpty
          ? []
          : _problems
              .where((problem) =>
                  problem.name! // to be used for the search function!
                      .toLowerCase() // set all lowercase to make search easier!
                      .contains(searchText.toLowerCase()))
              .toList(); // add to filtered list for searching!
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
          'Problem List',
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
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // textfield to search for a problem name!
              decoration: InputDecoration(
                hintText: 'Search by problem name',
                //border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              controller: _searchController,
              onChanged: _filterProblems,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Problems>?>(
                future: _future,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    if (_problems.isEmpty) {
                      _problems = snapshot.data!;
                    }
                    return _problems.isNotEmpty
                        ? ListView.separated(
                            // create separated listview builder to display problems from api after parsing!
                            itemCount: _problems.length,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: _borderColors[
                                        index % _borderColors.length],
                                    width: 2,
                                  ),
                                ),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.local_hospital_rounded,
                                              size: 45,
                                              color: _borderColors[
                                                  index % _borderColors.length],
                                            ),
                                            title: Text(
                                              _problems[index].name ??
                                                  "Problem Name", // null check for problem name! // display something when it is null!
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "ICD-10 Code: ${_problems[index].bestmatchicd10code ?? "ICD-10 Code"}", // null check for bestmatchicd10code! // display something when it is null!
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            isThreeLine: true,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 10);
                            },
                          )
                        : Center(
                            child: Text('No results found.'),
                          );
                  } else {
                    return const Center(
                        child:
                            CircularProgressIndicator()); //show loading bar while it calls the api data!
                  }
                }),
          ),
        ],
      ),
    );
  }
}
