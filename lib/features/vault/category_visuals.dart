// Assigns recognizable icons and descriptions to existing vault categories.
// Owns presentation metadata shared by owner and executor screens.
// Does not duplicate field schemas, data versions or plan restrictions.
import 'package:flutter/material.dart';
import '../../app/design_tokens.dart';

typedef CategoryVisual = ({IconData icon, Color color, String description});
const categoryVisuals = <String, CategoryVisual>{
  'NOTE': (
    icon: Icons.notes_rounded,
    color: CipherwillColors.clay,
    description: 'Words worth keeping',
  ),
  'PASSWORD': (
    icon: Icons.key_rounded,
    color: CipherwillColors.blue,
    description: 'Access to your digital life',
  ),
  'EMAIL_ACCOUNT': (
    icon: Icons.alternate_email_rounded,
    color: CipherwillColors.sage,
    description: 'Your inboxes and recovery details',
  ),
  'DEVICE_LOCK': (
    icon: Icons.devices_rounded,
    color: CipherwillColors.violet,
    description: 'Keys to your everyday devices',
  ),
  'BANK_ACCOUNT': (
    icon: Icons.account_balance_outlined,
    color: CipherwillColors.sage,
    description: 'Your financial foundations',
  ),
  'PAYMENT_CARD': (
    icon: Icons.credit_card_rounded,
    color: CipherwillColors.blue,
    description: 'Important card details',
  ),
  'SEED_PHRASE': (
    icon: Icons.grain_rounded,
    color: CipherwillColors.violet,
    description: 'The words that protect your wallets',
  ),
  'DEFI_STAKING': (
    icon: Icons.insights_rounded,
    color: CipherwillColors.amber,
    description: 'Your assets and staking positions',
  ),
  'FILE': (
    icon: Icons.folder_outlined,
    color: CipherwillColors.amber,
    description: 'Documents, memories and more',
  ),
};
CategoryVisual visualFor(String type) => categoryVisuals[type]!;
