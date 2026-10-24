// Returns a beneficiary to shared wills when their grant ends.
// Owns permission-failure navigation and the received-list refresh.
// Does not treat a connection failure as revoked access.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'access_status.dart';
import 'executor_providers.dart';

bool returnToSharedWills(BuildContext context, Object error) {
  final reason = accessFailureReason(error);
  if (reason == null || !context.mounted) return false;
  ProviderScope.containerOf(context).invalidate(receivedWillsProvider);
  context.go('/executor?notice=$reason');
  return true;
}
