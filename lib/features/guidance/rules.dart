// Evaluates the shared serializable guidance rule protocol
// Owns explicit paths, conditions and primitive template substitution.
// Does not evaluate executable code or export private context.

import '../../core/api/json_values.dart';
import 'dart:io';

dynamic guidancePath(Json scope, String path) {
  dynamic value = scope;
  for (final key in path.split('.')) {
    if (value is File && key == 'name') {
      value = value.path.split(Platform.pathSeparator).last;
      continue;
    }
    if (['__proto__', 'constructor', 'prototype'].contains(key) ||
        value is! Map ||
        !value.containsKey(key)) {
      return null;
    }
    value = value[key];
  }
  return value;
}

bool matches(dynamic raw, Json scope) {
  if (raw == null) return true;
  final rule = asJson(raw);
  if (rule.containsKey('all')) {
    return (rule['all'] as List).every((r) => matches(r, scope));
  }
  if (rule.containsKey('any')) {
    return (rule['any'] as List).any((r) => matches(r, scope));
  }
  if (rule.containsKey('not')) return !matches(rule['not'], scope);
  final value = guidancePath(scope, rule['path']);
  final expected = rule['value'];
  final present =
      value != null && (value is! String || value.trim().isNotEmpty);
  switch (rule['operator']) {
    case 'present':
      return present;
    case 'missing':
      return !present;
    case 'equals':
      return value == expected;
    case 'includes':
      return value is List && value.contains(expected);
    case 'gt':
      return value is num && expected is num && value > expected;
    case 'gte':
      return value is num && expected is num && value >= expected;
    case 'lt':
      return value is num && expected is num && value < expected;
    case 'lte':
      return value is num && expected is num && value <= expected;
    default:
      throw StateError('Unsupported guidance condition.');
  }
}

String guidanceText(dynamic text, Json scope) {
  final template = text is String
      ? text
      : jsonList(text)
                .firstWhere(
                  (item) => matches(item['when'], scope),
                  orElse: () => {},
                )['text']
                ?.toString() ??
            '';
  return template.replaceAllMapped(RegExp(r'\{\{([\w.]+)\}\}'), (match) {
    final value = guidancePath(scope, match[1]!);
    return value is String || value is num || value is bool
        ? value.toString()
        : '';
  });
}

Json guidanceValues(dynamic values, Json scope) => {
  for (final entry in asJson(values).entries)
    entry.key: asJson(entry.value).containsKey('path')
        ? guidancePath(scope, entry.value['path'])
        : entry.value['literal'],
};
Json completionAnswers(Json flow, Json answers, Json scope) {
  final completion = asJson(flow['completion']);
  final values = {...answers, ...guidanceValues(completion['values'], scope)};
  return {
    for (final key in (completion['fields'] as List))
      if (values.containsKey(key)) key.toString(): values[key],
  };
}

bool segmentAllowed(Json flow, Json account) {
  final segment = flow['segment'];
  return segment == null ||
      ((segment['planRequired'] != 'premium' || account['plan'] == 'premium') &&
          (segment['requireEnabled'] != true ||
              account['preferences'][segment['key']] == true));
}
