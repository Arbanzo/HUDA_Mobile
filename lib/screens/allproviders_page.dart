import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huda_clinic_mobile/services/api_service.dart';
import '../model/allproviders_model.dart';

class AllProv extends StatefulWidget {
  const AllProv({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllProvState createState() => _AllProvState();
}

class _AllProvState extends State<AllProv> {
  final List<Color> _borderColors = [
    Colors.blue[300]!,
    Colors.green[300]!,
    Colors.orange[300]!,
    Colors.purple[300]!
  ];
  List<Providers>? _originalList;
  List<Providers>? _filteredList; // to be used for the search function!

  @override
  void initState() {
    super.initState();
    ApiService().getAllProviders().then((list) {
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
        title: const Text('List Of All Providers'),
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // textfield to search for a last name!
              decoration: const InputDecoration(
                hintText: 'Search by last name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _filteredList = _originalList
                      ?.where((provider) =>
                          provider.lastname != null &&
                          provider.lastname!
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
                    // create separated listview builder to display providers from api after parsing!
                    itemCount: _filteredList!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: _borderColors[index % _borderColors.length],
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.medical_information,
                                        size: 45),
                                    title: Wrap(children: <Widget>[
                                      const Text("Dr. "),
                                      Text(_filteredList![index].lastname ??
                                          "Last Name"), // null check for lastname! // display something when it is null!
                                    ]),
                                    subtitle: Text(_filteredList![index]
                                            .ansinamecode ??
                                        'ANSI Name Code'), // null check for ansinamecode! // display something when it is null!
                                    isThreeLine: true,
                                    trailing: Wrap(
                                      children: <Widget>[
                                        const Text("NPI: "),
                                        Text(_filteredList![index]
                                                .npi
                                                ?.toString() ??
                                            'N/A'), // null check for npi! // display something when it is null!
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
