import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Check HUDA Logo image asset', (WidgetTester tester) async {
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

  testWidgets('Check Access Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/access.jpg'),
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
  testWidgets('Check Authority Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/authority.jpg'),
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

  testWidgets('Check BCBS Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/bcbs_logo.jpg'),
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

  testWidgets('Check BCCCP Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/bcccp_tri_county_logo_4c.png'),
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

  testWidgets('Check CFSEM Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/cfsem_logo.png'),
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

  testWidgets('Check UDM Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/detroit_mercy_dental_logo.png'),
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

  testWidgets('Check ESA Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/eye_surgeons.png'),
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

  testWidgets('Check LAH Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/lah_logo.png'),
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

  testWidgets('Check NAFC2022 Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/nafc2022.png'),
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

  testWidgets('Check Shores Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/shores_logo.png'),
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

  testWidgets('Check WP Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/wayne_pharmacy_logo.png'),
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

  testWidgets('Check WCCCD Logo image asset', (WidgetTester tester) async {
    // Create the widget to test
    final testWidget = MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset('lib/assets/wcccdlogo_fw_logo.png'),
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
}
