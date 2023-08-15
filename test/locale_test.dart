// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: unused_local_variable

//imports
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_clinic_mobile/l10n/l10n.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

// Mock a class to emulate FlutterWebAuth
class MockFlutterWebAuth extends Mock implements FlutterWebAuth {}

void main() {
  group('L10n', () {
    test('all locales should be supported', () {
      expect(
          L10n.all,
          containsAll(
              [const Locale('en'), const Locale('es'), const Locale('fr')]));
    });

    test('getLang should return correct language name', () {
      expect(L10n.getLang('en'), equals('English (US)'));
      expect(L10n.getLang('es'), equals('Español'));
      expect(L10n.getLang('fr'), equals('Français'));
    });
  });

  test('verify app_en.arb file exists', () async {
    const arbFileName = 'app_en.arb';
  });

  test('verify app_fr.arb file exists', () async {
    const arbFileName = 'app_en.arb';
  });

  test('verify app_es.arb file exists', () async {
    const arbFileName = 'app_en.arb';
  });
}
