// Lists supported factor types using the common native action sheet.
// Owns labels and icon choices for the existing factor creation flow.
// Does not create factors, derive keys or request passwords.
import 'package:flutter/material.dart';
import '../../shared/ui/action_sheet.dart';
import 'factor_visuals.dart';

Future<String?> chooseFactorType(BuildContext context) => chooseAction(
  context,
  title: 'Add security factor',
  actions: [
    for (final type in ['master-password', 'metamask', 'passkey'])
      SheetAction(type, factorTitle(type), factorIcon(type)),
  ],
);
