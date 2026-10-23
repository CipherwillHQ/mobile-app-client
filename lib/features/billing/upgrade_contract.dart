// Matches the public web upgrade link and JavaScript result contract.
// Owns account attribution, trusted page checks and result parsing.
// Does not authenticate web sessions or activate subscription entitlements.
import 'dart:convert';
import '../../core/api/json_values.dart';

Uri upgradeUri(Json account) {
  final email = account['email'];
  final id = account['id'];
  if (email is! String ||
      email.trim().isEmpty ||
      id is! String ||
      id.trim().isEmpty) {
    throw StateError('The account is unavailable. Reopen checkout to retry.');
  }
  return Uri.https('www.cipherwill.com', '/upgrade', {
    'email': email.trim(),
    'user_id': id.trim(),
  });
}

bool isUpgradePage(Uri uri) =>
    uri.scheme == 'https' &&
    uri.userInfo.isEmpty &&
    uri.port == 443 &&
    {'www.cipherwill.com', 'cipherwill.com'}.contains(uri.host) &&
    {'/upgrade', '/upgrade/'}.contains(uri.path);

class UpgradeResult {
  final bool success;
  final String? code;
  final String? message;
  const UpgradeResult({required this.success, this.code, this.message});

  static UpgradeResult? parse(String payload) {
    try {
      final value = jsonDecode(payload);
      if (value is! Map<String, dynamic> ||
          value['type'] != 'cipherwill.upgrade' ||
          !{'success', 'error'}.contains(value['status']) ||
          (value['code'] != null && value['code'] is! String) ||
          (value['message'] != null && value['message'] is! String)) {
        return null;
      }
      return UpgradeResult(
        success: value['status'] == 'success',
        code: value['code'],
        message: value['message'],
      );
    } on FormatException {
      return null;
    }
  }
}
