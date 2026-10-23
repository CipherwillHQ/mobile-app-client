// Registers currently working Cipherwill vault categories
// Owns category lookup.
// Does not add unfinished web segments.
import 'asset_category.dart';
import 'categories/note.dart';
import 'categories/email_account.dart';
import 'categories/device_lock.dart';
import 'categories/password.dart';
import 'categories/seed_phrase.dart';
import 'categories/defi_staking.dart';
import 'categories/bank_account.dart';
import 'categories/payment_card.dart';
import 'categories/file.dart';

const categories = [
  noteCategory,
  emailAccountCategory,
  deviceLockCategory,
  passwordCategory,
  seedPhraseCategory,
  defiStakingCategory,
  bankAccountCategory,
  paymentCardCategory,
  fileCategory,
];
AssetCategory categoryFor(String type) =>
    categories.firstWhere((category) => category.type == type);
