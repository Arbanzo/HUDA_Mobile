import 'package:flutter/material.dart';
import 'package:huda_clinic_mobile/l10n/l10n.dart';
import 'package:huda_clinic_mobile/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    //initializes a dropdown button
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: const Icon(Icons.language_outlined, color: Colors.white), //icon color
        items: L10n.all.map(
          (locale) {
            final language = L10n.getLang(locale.languageCode);
            return DropdownMenuItem(
              value: locale,
              child: Text(
                language,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 23, 30, 136)), //hides language text with appbar color
              ),
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);
                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {}, //sets language 
      ),
    );
  }
}
