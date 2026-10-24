// Assigns recognizable icons and descriptions to existing vault categories.
// Owns presentation metadata shared by owner and executor screens.
// Does not duplicate field schemas, data versions or plan restrictions.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../app/design_tokens.dart';

typedef CategoryVisual = ({IconData icon, Color color, String description});
const categoryVisuals = <String, CategoryVisual>{
  'NOTE': (
    icon: AppIcons.notes,
    color: CipherwillColors.clay,
    description: 'Words worth keeping',
  ),
  'PASSWORD': (
    icon: AppIcons.key,
    color: CipherwillColors.blue,
    description: 'Access to your digital life',
  ),
  'EMAIL_ACCOUNT': (
    icon: AppIcons.email,
    color: CipherwillColors.sage,
    description: 'Your inboxes and recovery details',
  ),
  'DEVICE_LOCK': (
    icon: AppIcons.devices,
    color: CipherwillColors.violet,
    description: 'Keys to your everyday devices',
  ),
  'BANK_ACCOUNT': (
    icon: AppIcons.bank,
    color: CipherwillColors.sage,
    description: 'Your financial foundations',
  ),
  'PAYMENT_CARD': (
    icon: AppIcons.card,
    color: CipherwillColors.blue,
    description: 'Important card details',
  ),
  'SEED_PHRASE': (
    icon: AppIcons.seed,
    color: CipherwillColors.violet,
    description: 'The words that protect your wallets',
  ),
  'DEFI_STAKING': (
    icon: AppIcons.staking,
    color: CipherwillColors.amber,
    description: 'Your assets and staking positions',
  ),
  'FILE': (
    icon: AppIcons.folder,
    color: CipherwillColors.amber,
    description: 'Documents, memories and more',
  ),
};
CategoryVisual visualFor(String type) => categoryVisuals[type]!;
