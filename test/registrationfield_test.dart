//imports
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_clinic_mobile/models/registration_fields.dart';

void main() {
  group('form1 class tests', () {
    test('firstName should be a string', () {
      final form = form1(
          'John',
          'Doe',
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null);
      expect(form.firstName, isA<String>());
    });
  });
  test('Check if total for section 1 is updated correctly', () {
    // Setup
    var sec1ans1Controller = TextEditingController(text: '1');
    var sec1ans2Controller = TextEditingController(text: '2');
    var sec1ans3Controller = TextEditingController(text: '3');
    var sec1ans4Controller = TextEditingController(text: '4');
    var sec1ans5Controller = TextEditingController(text: '5');
    var sec1ans6Controller = TextEditingController(text: '6');
    var sec1ans7Controller = TextEditingController(text: '7');
    var sec1ans8Controller = TextEditingController(text: '8');
    var sec1totalController = TextEditingController(text: '');
    // ignore: prefer_typing_uninitialized_variables
    var totalSec01;

    // Invoke the function
    void updateTotalSec01() {
      // ! Recalculate total for section 1
      totalSec01 = (int.parse(sec1ans1Controller.text) +
              int.parse(sec1ans2Controller.text) +
              int.parse(sec1ans3Controller.text) +
              int.parse(sec1ans4Controller.text) +
              int.parse(sec1ans5Controller.text) +
              int.parse(sec1ans6Controller.text) +
              int.parse(sec1ans7Controller.text) +
              int.parse(sec1ans8Controller.text))
          .toString();
      sec1totalController.text = totalSec01; // ! Assign new total
    }

    updateTotalSec01();

    // Verify
    expect(totalSec01, '36');
    expect(sec1totalController.text, '36');
  });
  test('Check if total for section 2 is updated correctly', () {
    // Setup
    var sec2ans1Controller = TextEditingController(text: '2');
    var sec2ans2Controller = TextEditingController(text: '3');
    var sec2ans3Controller = TextEditingController(text: '4');
    var sec2ans4Controller = TextEditingController(text: '5');
    var sec2ans5Controller = TextEditingController(text: '6');
    var sec2ans6Controller = TextEditingController(text: '7');
    var sec2ans7Controller = TextEditingController(text: '8');
    var sec2totalController = TextEditingController(text: '');
    // ignore: prefer_typing_uninitialized_variables
    var totalSec02;

    // Invoke the function
    void updateTotalSec02() {
      // ! Recalculate total for section 1
      totalSec02 = (int.parse(sec2ans1Controller.text) +
              int.parse(sec2ans2Controller.text) +
              int.parse(sec2ans3Controller.text) +
              int.parse(sec2ans4Controller.text) +
              int.parse(sec2ans5Controller.text) +
              int.parse(sec2ans6Controller.text) +
              int.parse(sec2ans7Controller.text))
          .toString();
      sec2totalController.text = totalSec02; // ! Assign new total
    }

    updateTotalSec02();

    // Verify
    expect(totalSec02, '35');
    expect(sec2totalController.text, '35');
  });
}
