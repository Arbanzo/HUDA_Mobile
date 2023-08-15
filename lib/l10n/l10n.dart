//Localization page, this creates a page with each eligible localization in the app
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('fr')
  ];

  static String getLang(String code) {
    switch (code) {
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'en':
      default:
        return 'English (US)';
    }
  }
}
