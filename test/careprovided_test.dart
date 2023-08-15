// ignore_for_file: unused_import, unused_local_variable, no_leading_underscores_for_local_identifiers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_clinic_mobile/screens/care_provided.dart';

void main() {
  testWidgets('AppBar has correct background color and title',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 30, 136),
          title: const Text('Care Provided'),
        ),
      ),
    ));

    var appBarBackground =
        tester.widget<AppBar>(find.byType(AppBar)).backgroundColor;
    expect(appBarBackground, const Color.fromARGB(255, 23, 30, 136));

    var appBarTitle = find.text('Care Provided');
    expect(appBarTitle, findsOneWidget);
  });

  test('Background color is set correctly', () {
    var color = const Color.fromARGB(255, 23, 30, 136);
    expect(color, equals(const Color.fromRGBO(23, 30, 136, 1)));
  });

  testWidgets('ListView and Card widgets render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView(
            children: const [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                elevation: 2,
                margin: EdgeInsets.all(12.0),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
  });

  bool isExpanded1 = true;

  testWidgets('Check if widgets are displayed when _isExpanded1 is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              if (isExpanded1) ...[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Text(
                          "Primary care providers are typically the first line of contact for patients; treating general health concerns, providing education, medications and specialty referrals as needed. HUDA aims to bring primary care and \nspecialized services to uninsured and under-insured in the Metro Detroit area. We provide preventative primary care services in a person-focused community health clinic, our goal is to make Michigan healthier! \n\nThe HUDA clinic provides FREE medications to our patients, and also provides laboratory services at no-cost to our patients.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const <Widget>[
                      Text("Health Assessments"),
                      Spacer(),
                      Icon(Icons.check),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const <Widget>[
                      Text("Laboratory Services (blood work)"),
                      Spacer(),
                      Icon(Icons.check),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const <Widget>[
                      Text("Diabetes Screening & Treatments"),
                      Spacer(),
                      Icon(Icons.check),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const <Widget>[
                      Text("Cholesterol & Blood Pressure screenings"),
                      Spacer(),
                      Icon(Icons.check),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    expect(
        find.text(
            "Primary care providers are typically the first line of contact for patients; treating general health concerns, providing education, medications and specialty referrals as needed. HUDA aims to bring primary care and \nspecialized services to uninsured and under-insured in the Metro Detroit area. We provide preventative primary care services in a person-focused community health clinic, our goal is to make Michigan healthier! \n\nThe HUDA clinic provides FREE medications to our patients, and also provides laboratory services at no-cost to our patients."),
        findsOneWidget);
    expect(find.text("Health Assessments"), findsOneWidget);
    expect(find.text("Laboratory Services (blood work)"), findsOneWidget);
    expect(find.text("Diabetes Screening & Treatments"), findsOneWidget);
    expect(
        find.text("Cholesterol & Blood Pressure screenings"), findsOneWidget);
  });

  testWidgets('Card has correct properties', (WidgetTester tester) async {
    await tester.pumpWidget(Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      elevation: 2,
      margin: const EdgeInsets.all(12.0),
      child: Container(),
    ));

    final cardFinder = find.byType(Card);

    expect(cardFinder, findsOneWidget);
    expect(
        (tester.widget(cardFinder) as Card).shape,
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ));
    expect((tester.widget(cardFinder) as Card).elevation, equals(2));
    expect(
        (tester.widget(cardFinder) as Card).margin, const EdgeInsets.all(12.0));
  });

  bool isExpanded2 = false;

  testWidgets('Widgets are not displayed if _isExpanded2 is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Wrap(children: [
        if (isExpanded2) ...[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    "Vision screenings is an effective method to identify individuals with visual impairment or eye conditions that are likely to lead to vision loss. We perform \nscreenings in-house and provide no-cost eye wear and referrals to low-cost local ophthalmologists as needed.",
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Glaucoma Screenings"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Cataract Screenings"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Macular Degeneration Screenings"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Referrals to vision specialists"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
        ]
      ]),
    ));

    expect(
        find.text(
            'Vision screenings is an effective method to identify individuals with visual impairment or eye conditions that are likely to lead to vision loss. We perform \nscreenings in-house and provide no-cost eye wear and referrals to low-cost local ophthalmologists as needed.'),
        findsNothing);
    expect(find.text('Glaucoma Screenings'), findsNothing);
    expect(find.text('Cataract Screenings'), findsNothing);
    expect(find.text('Macular Degeneration Screenings'), findsNothing);
    expect(find.text('Referrals to vision specialists'), findsNothing);
  });

  testWidgets('Widgets are displayed if _isExpanded2 is true',
      (WidgetTester tester) async {
    isExpanded2 = true;

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Wrap(children: [
        if (isExpanded2) ...[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: Text(
                    "Vision screenings is an effective method to identify individuals with visual impairment or eye conditions that are likely to lead to vision loss. We perform \nscreenings in-house and provide no-cost eye wear and referrals to low-cost local ophthalmologists as needed.",
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Glaucoma Screenings"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Cataract Screenings"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Macular Degeneration Screenings"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: const <Widget>[
                Text("Referrals to vision specialists"),
                Spacer(),
                Icon(Icons.check),
              ],
            ),
          ),
        ]
      ]),
    ));

    expect(
        find.text(
            'Vision screenings is an effective method to identify individuals with visual impairment or eye conditions that are likely to lead to vision loss. We perform \nscreenings in-house and provide no-cost eye wear and referrals to low-cost local ophthalmologists as needed.'),
        findsOneWidget);
    expect(find.text('Glaucoma Screenings'), findsOneWidget);
    expect(find.text('Cataract Screenings'), findsOneWidget);
    expect(find.text('Macular Degeneration Screenings'), findsOneWidget);
    expect(find.text('Referrals to vision specialists'), findsOneWidget);
  });

  testWidgets('TextButton displays the correct icon and text label',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TextButton.icon(
          onPressed: null,
          icon: const Icon(Icons.play_arrow),
          label: const Text("More Information"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            backgroundColor: const Color.fromARGB(255, 23, 30, 136),
          ),
        ),
      ),
    ));

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final labelTextFinder = find.text("More Information");
    expect(labelTextFinder, findsOneWidget);
  });

  testWidgets('Initially, the dental-related information is not displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());

    final isExpandedFinder = find.byType(ExpansionPanel);
    expect(isExpandedFinder, findsNothing);
  });

  bool isExpanded3 = true;
  testWidgets(
      'The text and icon of each row are rendered correctly for Dental Care',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              TextButton(
                child: const Text('More Information'),
                onPressed: () {},
              ),
              isExpanded3
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const <Widget>[
                                Expanded(
                                  child: Text(
                                      "Many people wait to have necessary dental work done \nbecause they don’t have insurance, however small \ndental problems can quickly become incredibly painful \nif left alone. Come in to HUDA for cleanings, fillings, \nextractions and exams to keep your teeth healthy and \nreceive a referral to a specialist if needed."),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const <Widget>[
                                Text("Dental screenings, and X-Rays"),
                                Spacer(),
                                Icon(Icons.check),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const <Widget>[
                                Text("Deep Cleanings"),
                                Spacer(),
                                Icon(Icons.check),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const <Widget>[
                                Text("Tooth Extraction"),
                                Spacer(),
                                Icon(Icons.check),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const <Widget>[
                                Text(
                                    "Referrals to low cost dentists as needed"),
                                Spacer(),
                                Icon(Icons.check),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  // ignore: dead_code
                  : Container(),
            ],
          ),
        ),
      ),
    );

    final moreInfoButtonFinder = find.byType(TextButton);
    expect(moreInfoButtonFinder, findsOneWidget);
  });

  test('Icon displays correctly depending on expansion state', () {
    const bool expanded = true;
    const bool collapsed = false;

    const expandedIcon = Icon(Icons.expand_less);
    const collapsedIcon = Icon(Icons.expand_more);

    expect(expandedIcon.icon, Icons.expand_less);
    expect(collapsedIcon.icon, Icons.expand_more);
  });

  testWidgets('Card should have correct text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                          "We have psychiatrists on staff along with our licensed \nsocial workers to provide therapy and treatment for a \nwide range of mental health concerns. We offer free \ncounseling and treatment to veterans, homeless, \nuninsured, and the working underinsured. \n\nSince the onset of the Covid-19 pandemic our psychiatry \nservices have transitioned to telemedicine. We currently \nhave 2 Psychiatrists, a Mental Health Nurse Practitioner \nand a Therapist who all volunteer with HUDA Clinic \nallowing us to provide treatment for a wide range of \nmental health concerns."),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const <Widget>[
                    Text("Adult Counseling"),
                    Spacer(),
                    Icon(Icons.check),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const <Widget>[
                    Text("Anxiety/Depression"),
                    Spacer(),
                    Icon(Icons.check),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const <Widget>[
                    Text("Bipolar Disorders"),
                    Spacer(),
                    Icon(Icons.check),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const <Widget>[
                    Text("Schizoaffective Disorders, and more"),
                    Spacer(),
                    Icon(Icons.check),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(Card), findsOneWidget);

    expect(
      find.text(
          "We have psychiatrists on staff along with our licensed \nsocial workers to provide therapy and treatment for a \nwide range of mental health concerns. We offer free \ncounseling and treatment to veterans, homeless, \nuninsured, and the working underinsured. \n\nSince the onset of the Covid-19 pandemic our psychiatry \nservices have transitioned to telemedicine. We currently \nhave 2 Psychiatrists, a Mental Health Nurse Practitioner \nand a Therapist who all volunteer with HUDA Clinic \nallowing us to provide treatment for a wide range of \nmental health concerns."),
      findsOneWidget,
    );

    expect(find.text("Adult Counseling"), findsOneWidget);
    expect(find.text("Anxiety/Depression"), findsOneWidget);
    expect(find.text("Bipolar Disorders"), findsOneWidget);
    expect(find.text("Schizoaffective Disorders, and more"), findsOneWidget);

    expect(find.widgetWithIcon(Row, Icons.check), findsNWidgets(4));
  });

  // ignore: no_leading_underscores_for_local_identifiers
  Widget _buildTitle(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const <Widget>[
            Text("Primary Care"),
            Spacer(),
            Text("Physician"),
          ],
        ),
        const Text("Internal Medicine"),
      ],
    );
  }

  testWidgets('Testing _buildTitle widget', (WidgetTester tester) async {
    const title = "Primary Care";
    const subtitle = "Physician";

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buildTitle(title, subtitle),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);
    expect(find.text("Internal Medicine"), findsOneWidget);

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);

    final row = find.byType(Row).evaluate().first.widget as Row;
    expect(row.children.length, equals(3));

    expect(row.children[1], isA<Spacer>());
  });

  Widget _buildTitle2(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const <Widget>[
            Text("Vision Care"),
            Spacer(),
            Text("Ophthalmologist/\nOptometrist"),
          ],
        ),
      ],
    );
  }

  testWidgets('Testing _buildTitle2 widget', (WidgetTester tester) async {
    const title = "Vision Care";
    const subtitle = "Ophthalmologist/\nOptometrist";

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buildTitle2(title, subtitle),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);

    final row = find.byType(Row).evaluate().first.widget as Row;
    expect(row.children.length, equals(3));

    expect(row.children[1], isA<Spacer>());
  });

  Widget _buildTitle3(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const <Widget>[
            Text("Dental Care"),
            Spacer(),
            Text("Dentist"),
          ],
        ),
      ],
    );
  }

  testWidgets('Testing _buildTitle3 widget', (WidgetTester tester) async {
    const title = "Dental Care";
    const subtitle = "Dentist";

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buildTitle3(title, subtitle),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);

    final row = find.byType(Row).evaluate().first.widget as Row;
    expect(row.children.length, equals(3));

    expect(row.children[1], isA<Spacer>());
  });

  Widget _buildTitle4(String s, String s2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const <Widget>[
            Text("Mental Health"),
            Spacer(),
            Text("Psychiatrist"),
          ],
        ),
      ],
    );
  }

  testWidgets('Testing _buildTitle4 widget', (WidgetTester tester) async {
    const title = "Mental Health";
    const subtitle = "Psychiatrist";

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _buildTitle4(title, subtitle),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);

    final row = find.byType(Row).evaluate().first.widget as Row;
    expect(row.children.length, equals(3));

    expect(row.children[1], isA<Spacer>());
  });
}
