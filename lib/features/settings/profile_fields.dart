// Groups existing profile fields into native mobile form sections.
// Owns readable labels, keyboard hints and the birth-date Clear control.
// Does not serialize profile data or change account identity.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../shared/ui/panel_section.dart';

const profileLabels = {
  'first_name': 'First name',
  'middle_name': 'Middle name',
  'last_name': 'Last name',
  'birth_date': 'Date of birth',
  'gender': 'Gender',
  'country': 'Country',
  'address_line1': 'Address line 1',
  'address_line2': 'Address line 2',
  'city': 'City',
  'state': 'State',
  'postal_code': 'Postal code',
};

class ProfileFields extends StatelessWidget {
  final Map<String, TextEditingController> fields;
  const ProfileFields({super.key, required this.fields});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final group in const [
        (
          'Personal details',
          ['first_name', 'middle_name', 'last_name', 'birth_date', 'gender'],
        ),
        (
          'Address',
          [
            'country',
            'address_line1',
            'address_line2',
            'city',
            'state',
            'postal_code',
          ],
        ),
      ])
        PanelSection(
          title: group.$1,
          children: [
            for (final key in group.$2)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: fields[key],
                  decoration: InputDecoration(
                    labelText: profileLabels[key],
                    hintText: key == 'birth_date' ? 'YYYY-MM-DD' : null,
                    suffixIcon: key == 'birth_date'
                        ? IconButton(
                            tooltip: 'Clear date of birth',
                            onPressed: fields[key]!.text.isEmpty
                                ? null
                                : fields[key]!.clear,
                            icon: const Icon(AppIcons.close),
                          )
                        : null,
                  ),
                  keyboardType: key == 'birth_date'
                      ? TextInputType.datetime
                      : TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
          ],
        ),
    ],
  );
}
