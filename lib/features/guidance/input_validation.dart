// Normalizes catalog-declared input values without changing credentials
// Owns local constraint validation.
// Does not replace final server authorization.

import 'dart:io';
import '../../core/api/json_values.dart';

dynamic normalizeGuidance(Json input, dynamic value) {
  if (value == null && input['skippable'] == true) return null;
  if (input['type'] == 'boolean') {
    if (value is! bool) throw StateError('Choose Yes or No.');
    return value;
  }
  if (input['type'] == 'file') {
    if (value is! File) throw StateError('Select a file.');
    return value;
  }
  final text = input['sensitive'] == true
      ? value?.toString() ?? ''
      : (value?.toString() ?? '').trim();
  if (text.isEmpty) throw StateError('Enter an answer.');
  if (input['type'] == 'choices' &&
      !(input['choices'] as List? ?? [])
          .map((v) => v.toString())
          .contains(text)) {
    throw StateError('Choose one of the available options.');
  }
  if (input['type'] == 'email' &&
      !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(text)) {
    throw StateError('Enter a valid email.');
  }
  if (input['pattern'] != null && !RegExp(input['pattern']).hasMatch(text)) {
    throw StateError('Check the required format.');
  }
  if (input['minLength'] is num && text.length < input['minLength'] ||
      input['maxLength'] is num && text.length > input['maxLength']) {
    throw StateError('Check the answer length.');
  }
  if (input['type'] == 'date') {
    final date = DateTime.tryParse(text);
    if (date == null || date.toIso8601String().split('T').first != text) {
      throw StateError('Enter a valid YYYY-MM-DD date.');
    }
    for (final key in ['minDate', 'maxDate']) {
      var bound = input[key]?.toString();
      if (bound == 'today') {
        bound = DateTime.now().toIso8601String().split('T').first;
      }
      if (bound != null &&
          (key == 'minDate'
              ? text.compareTo(bound) < 0
              : text.compareTo(bound) > 0)) {
        throw StateError('Date is outside the allowed range.');
      }
    }
  }
  if (input['type'] == 'number') {
    final number = num.tryParse(text);
    if (number == null ||
        !number.isFinite ||
        input['min'] is num && number < input['min'] ||
        input['max'] is num && number > input['max']) {
      throw StateError('Enter a number in the allowed range.');
    }
    return number;
  }
  return input['type'] == 'email' ? text.toLowerCase() : text;
}
