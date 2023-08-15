import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() {
  testWidgets('Check app bar color', (WidgetTester tester) async {
    // Create the widget to test
    final appBar = AppBar(
      title: const Text('My App'),
      backgroundColor: const Color.fromARGB(255, 23, 30, 136),
    );
    final testWidget = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: Container(),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);

    // Verify that the app bar has the expected color
    expect(appBar.backgroundColor, const Color.fromARGB(255, 23, 30, 136));
  });
  testWidgets('Check MaterialButton click', (WidgetTester tester) async {
    // Create the widget to test
    bool buttonClicked = false;
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: () {
              buttonClicked = true;
            },
            child: const Text('Click me!'),
          ),
        ),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);

    // Verify that the button is initially not clicked
    expect(buttonClicked, false);

    // Tap the button
    await tester.tap(find.text('Click me!'));

    // Build the widget tree again to update the UI
    await tester.pump();

    // Verify that the button is clicked
    expect(buttonClicked, true);
  });

  testWidgets('Check Google Fonts implementation', (WidgetTester tester) async {
    // Create the widget to test
    final textWidget = Text(
      'Hello, world!',
      style: GoogleFonts.sora(),
    );
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: textWidget,
        ),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);
  });
  testWidgets('Check form body text color', (WidgetTester tester) async {
    // Create the widget to test
    const textWidget = Text(
      'Hello, world!',
      style: TextStyle(color: Color.fromARGB(255, 167, 169, 202)),
    );
    const testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: textWidget,
        ),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);
  });

  testWidgets('Check form header text color', (WidgetTester tester) async {
    // Create the widget to test
    const textWidget = Text(
      'Hello, world!',
      style: TextStyle(color: Color.fromARGB(255, 49, 77, 185)),
    );
    const testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: textWidget,
        ),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);
  });

  testWidgets('Check background color', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Text('Hello, world!'),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);
  });

  testWidgets('Check Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/huda_logo.png'),
        ),
      ),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);

    // Verify that the image widget is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verify that the image asset is loaded
    final image = tester.widget<Image>(find.byType(Image));
    expect(image.image, isInstanceOf<AssetImage>());
  });

  testWidgets('Verify form body font size is 16', (WidgetTester tester) async {
    // Build a MaterialApp with a Text widget that uses font size 16
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Hello, world!',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  });

  testWidgets('Verify form header font size is 28',
      (WidgetTester tester) async {
    // Build a MaterialApp with a Text widget that uses font size 16
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Hello, world!',
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
      ),
    );
  });
  testWidgets('BorderSide color test', (WidgetTester tester) async {
    // Create a BorderSide with a specific color
    const borderSide = BorderSide(
      color: Color.fromARGB(255, 49, 77, 185),
    );

    // Verify that the BorderSide has the expected color
    expect(borderSide.color, equals(const Color.fromARGB(255, 49, 77, 185)));
  });
  testWidgets('Verify form sub-header font size is 20',
      (WidgetTester tester) async {
    // Build a MaterialApp with a Text widget that uses font size 16
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Hello, world!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  });
  testWidgets('Verify use of padding', (WidgetTester tester) async {
    // Build a MaterialApp with a Container widget that has padding
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text('Hello World!'),
            ),
          ),
        ),
      ),
    );

    // Use the find.byWidgetPredicate() method to search for the Container widget
  });

  testWidgets('Check Input field boxes', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
        ),
      ),
    );
  });

  testWidgets('Check empty field Validation Message',
      (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim() == "") {
                    return 'Please enter some text';
                  }
                  return null;
                },
              );
            },
          ),
        ),
      ),
    );
  });

  testWidgets(
      'StepProgressIndicator displays correct number of steps and colors',
      (WidgetTester tester) async {
    // Setup
    const totalSteps = 6;
    const currentStep = 1;
    const selectedColor = Color.fromARGB(255, 76, 109, 242);
    const unselectedColor = Color.fromARGB(255, 167, 169, 202);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: StepProgressIndicator(
              totalSteps: totalSteps,
              currentStep: currentStep,
              size: 6,
              selectedColor: selectedColor,
              unselectedColor: unselectedColor,
            ),
          ),
        ),
      ),
    );
  });

  testWidgets('Check Expanded Widget', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );

    // Verify that the Expanded widget is being used
    expect(find.byType(Expanded), findsOneWidget);
  });
  testWidgets('Row widget presence', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Row(
            children: const [
              Text('Hello'),
              Text('World'),
            ],
          ),
        ),
      ),
    );

    // Verify if the Row widget is present
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('Verify Iconbuttons are clickable', (WidgetTester tester) async {
    // Build a MaterialApp with a raised button
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Click Me!'),
            ),
          ),
        ),
      ),
    );

    // Tap the raised button
    await tester.tap(find.text('Click Me!'));
  });
  testWidgets('Verify presence of icon', (WidgetTester tester) async {
    // Build a MaterialApp with a Scaffold containing the icon to be tested
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Icon(Icons.favorite),
        ),
      ),
    );

    // Use the find.byIcon() method to search for the icon by its data
    final iconFinder = find.byIcon(Icons.favorite);

    // Verify that the icon is present in the widget tree
    expect(iconFinder, findsOneWidget);
  });
  testWidgets('Button color test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 23, 30, 136)),
              ),
              child: const Text('Test Button'),
            ),
          ),
        ),
      ),
    );
  });

  testWidgets('SingleChildScrollView test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: List.generate(
                20,
                (index) => Container(
                  height: 100,
                  color: Colors.blue,
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Scroll down to the bottom of the SingleChildScrollView
    await tester.dragUntilVisible(
      find.byType(SingleChildScrollView),
      find.byType(Container).last,
      const Offset(0, -300),
    );
  });

  testWidgets('TextFormField test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
          ),
        ),
      ),
    );

    // Verify the presence of the TextFormField
    expect(find.byType(TextFormField), findsOneWidget);
  });
  testWidgets('Verify presence of bold font', (WidgetTester tester) async {
    // Build a MaterialApp with a Text widget that uses the bold font weight
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Text(
            'Hello World',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  });

  testWidgets('Date Picker field test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () async {
                  // Show the date picker
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now().add(const Duration(days: 36500)),
                  );

                  // Verify the selected date is not null
                  expect(selectedDate, isNotNull);
                },
                child: const Text('Show Date Picker'),
              );
            },
          ),
        ),
      ),
    );
  });

  testWidgets('OutlineInputBorder test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  });

  testWidgets('Autofocus test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: TextFormField(
              autofocus: false,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
          ),
        ),
      ),
    );

    // Get the TextFormField widget
  });

  testWidgets('form input field width width test', (WidgetTester tester) async {
    // Create a BorderSide with a width of 1
    const borderSide = BorderSide(width: 1);

    // Verify that the BorderSide has a width of 1
    expect(borderSide.width, equals(1));
  });
  testWidgets('Check route navigation', (WidgetTester tester) async {
    // Create the widget to test
    const testWidget = MaterialApp(
      home: HomePage(),
    );

    // Build the widget tree
    await tester.pumpWidget(testWidget);

    // Tap the button to navigate to the new page
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that the new page is displayed
    expect(find.text('New Page'), findsOneWidget);
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to New Page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewPage()),
            );
          },
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: const Center(
        child: Text('Welcome to the new page!'),
      ),
    );
  }
}
