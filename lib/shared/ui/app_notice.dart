// Shows feedback from native authentication actions.
// Owns the shared snackbar entry point.
// Does not maintain application-wide banners or feature state.
import 'package:flutter/material.dart';

void showNotice(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
