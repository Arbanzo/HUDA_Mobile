import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

import '../widget/language_picker_widget.dart';

class CareProvided extends StatefulWidget {
  const CareProvided({super.key});

  @override
  State<CareProvided> createState() => _CareProvidedState();
}

//===================================================================================
//UI Start
class _CareProvidedState extends State<CareProvided> {
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 30, 136),
        actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
        title: Text(AppLocalizations.of(context).careProvided),
      ),
      body: ListView(
        children: [
          Card(
            color: const Color.fromARGB(255, 242, 244, 252),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      _isExpanded1 = !_isExpanded1;
                    });
                  },
                  title: _buildTitle(AppLocalizations.of(context).pcare,
                      AppLocalizations.of(context).phys),
                  trailing: Icon(
                    _isExpanded1 ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
                if (_isExpanded1) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      // ! My Changes
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context).pcarebody,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).ha),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).labs),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).ds),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).chol),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isExpanded1 = !_isExpanded1;
                      });
                    },
                    icon: const Icon(Icons.list),
                    label: Text(AppLocalizations.of(context).moreinfo),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      backgroundColor: const Color.fromARGB(255, 76, 109, 242),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 242, 244, 252),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      _isExpanded2 = !_isExpanded2;
                    });
                  },
                  title: _buildTitle2(AppLocalizations.of(context).vcare,
                      AppLocalizations.of(context).opth),
                  trailing: Icon(
                    _isExpanded2 ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
                if (_isExpanded2) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context).visbody,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).gs),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).cs),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).mds),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).rtvs),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isExpanded2 = !_isExpanded2;
                      });
                    },
                    icon: const Icon(Icons.list),
                    label: Text(AppLocalizations.of(context).moreinfo),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      backgroundColor: const Color.fromARGB(255, 76, 109, 242),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 242, 244, 252),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      _isExpanded3 = !_isExpanded3;
                    });
                  },
                  title: _buildTitle3(AppLocalizations.of(context).dcare,
                      AppLocalizations.of(context).dentist),
                  trailing: Icon(
                    _isExpanded3 ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
                if (_isExpanded3) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(AppLocalizations.of(context).dcarebody,
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).ds),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).dc),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).te),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).denref),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isExpanded3 = !_isExpanded3;
                      });
                    },
                    icon: const Icon(Icons.list),
                    label: Text(AppLocalizations.of(context).moreinfo),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      backgroundColor: const Color.fromARGB(255, 76, 109, 242),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 242, 244, 252),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      _isExpanded4 = !_isExpanded4;
                    });
                  },
                  title: _buildTitle4(AppLocalizations.of(context).mentalhealth,
                      AppLocalizations.of(context).psych),
                  trailing: Icon(
                    _isExpanded4 ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
                if (_isExpanded4) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context).mentalbody,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).ac),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).ad),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).bp),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(AppLocalizations.of(context).sdm),
                        const Spacer(),
                        const Icon(Icons.check),
                      ],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isExpanded4 = !_isExpanded4;
                      });
                    },
                    icon: const Icon(Icons.list),
                    label: Text(AppLocalizations.of(context).moreinfo),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      backgroundColor: const Color.fromARGB(255, 76, 109, 242),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(AppLocalizations.of(context).pcare),
            const Spacer(),
            Text(AppLocalizations.of(context).phys),
          ],
        ),
        Text(AppLocalizations.of(context).im),
      ],
    );
  }

  Widget _buildTitle2(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(AppLocalizations.of(context).vcare),
            const Spacer(),
            Text(AppLocalizations.of(context).opth),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle3(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(AppLocalizations.of(context).dcare),
            const Spacer(),
            Text(AppLocalizations.of(context).dentist),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle4(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(AppLocalizations.of(context).mentalhealth),
            const Spacer(),
            Text(AppLocalizations.of(context).psych),
          ],
        ),
      ],
    );
  }
}
