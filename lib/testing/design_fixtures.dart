// Supplies synthetic account metadata for mobile design regression tests.
// Owns representative online responses with no real personal data.
// Does not call Firebase or provide production authentication credentials.
import '../core/api/json_values.dart';
import '../features/vault/categories.dart';
import '../features/guidance/guidance_test_data.dart';
import '../features/timeline/timeline_service.dart';

const previewAccount = {
  'id': 'preview',
  'first_name': 'Sam',
  'last_name': 'Taylor',
  'email': 'sam@example.com',
  'email_verified': true,
  'plan': 'premium',
  'last_accessed': '1792800000000',
  'created_at': '1792800000000',
};
final previewPreferences = {
  ...timelineDefaults,
  'check_in_interval': '30',
  for (final category in categories)
    if (category.preference != null) category.preference!: true,
  'promotional_emails': true,
};
const previewFactor = {
  'id': 'preview-factor',
  'name': 'My master password',
  'type': 'master-password',
  'nonce': '1234',
  'publicKey': 'preview-key',
};
final previewGuide = guidanceDefinition(
  steps: [
    {
      'id': 'name',
      'title': 'Let’s start with you.',
      'subtext': 'A first name helps make your digital legacy personal.',
      'input': {'type': 'text', 'key': 'name', 'placeholder': 'First name'},
    },
  ],
)..['title'] = 'Your digital legacy';

Future<Json> designResponse(String name, Json vars) async => switch (name) {
  'GET_USER_SCORE' => {
    'getUserScore':
        '{"base":300,"firstName":100,"lastName":100,"birthDate":0,"metamodel":100,"beneficiary":100,"sessions":100,"premium":50}',
  },
  'GET_METAMODEL_TYPE_COUNTS' || 'GET_BENEFICIARY_SEGMENT_COUNTS' => {
    'getMetamodelTypeCounts': [
      for (final category in categories) {'type': category.type, 'count': 3},
    ],
  },
  'GUIDANCE_BOOTSTRAP' => guidanceBootstrap([previewGuide]),
  'GET_NEXT_WILL_EVENT' => {
    'getNextWillEvent': {
      'type': 'first_reminder',
      'execution_time': '1793400000000',
    },
  },
  'GET_PREFERENCES' => {'getPreferences': previewPreferences},
  'GET_SMARTWILL_BENEFICIARY' => {
    'getSmartWillBeneficiaries': [
      {
        'id': 'beneficiary',
        'person_id': 'person',
        'custom_message': 'Keep making memories. I love you.',
      },
    ],
  },
  'GET_SMARTWILL_FRIENDS' => {
    'getSmartWillFriends': ['person'],
  },
  'GET_PERSON' => {
    'getPerson': {
      'id': 'person',
      'first_name': 'Alex',
      'last_name': 'Taylor',
      'email': 'alex@example.com',
    },
  },
  'GET_METAMODEL' => {
    'getMetamodel': {
      'id': vars['id'],
      'metadata': '{"title":"Family note","name":"Personal login"}',
      'ignored_beneficiaries': [],
      'updated_at': '1792800000000',
    },
  },
  'GET_METAMODELS' || 'GET_GRANTED_METAMODELS' => {
    name == 'GET_METAMODELS' ? 'getMetamodels' : 'getGrantedMetamodels': {
      'models': [
        {
          'id': 'item',
          'metadata':
              '{"title":"Important family details","name":"Personal account"}',
          'type': vars['type'],
          'updated_at': '1792800000000',
          'ignored_beneficiaries': [],
        },
      ],
      'has_more': false,
    },
  },
  'GET_STORAGE_USED' => {
    'getStorageUsed': {'text_pods': '40960', 'storage_pods': '12582912'},
  },
  'GET_FOLDERS' || 'GET_GRANTED_STORAGE_FOLDERS' => {
    name == 'GET_FOLDERS' ? 'getFolders' : 'getGrantedStorageFolders': {
      'folders': [
        {'id': 'folder', 'name': 'Family documents'},
      ],
      'has_more': false,
    },
  },
  'GET_ALL_KEY_COUNT' => {
    'getAllKeyCount': [
      {'publicKey': 'preview-key', 'count': 24},
    ],
  },
  'GET_FACTORS' => {
    'getFactors': [previewFactor],
  },
  'GET_USER_PHONE_NUMBERS' => {'getUserPhoneNumbers': []},
  'GET_MY_SUBSCRIPTION' => {
    'getMySubscription': {
      'plan_name': 'Cipherwill Premium',
      'status': 'active',
      'next_billing_at': '1795400000000',
      'last_payment_method': 'Visa •••• 4242',
      'payment_gateway': 'paddle',
      'id': 'subscription',
    },
  },
  'GET_MY_INVOICES' => {'getMyInvoices': []},
  'GET_ALL_BENEFICIARY_ACCESS' => {
    'getAllBeneficiaryAccess': [
      {'id': 'grant', 'user': 'person', 'expire_at': '4102444800000'},
    ],
  },
  'GET_ALL_GRANTED_BENEFICIARIES' => {
    'getAllGrantedBeneficiaries': [
      {
        'id': 'released-grant',
        'beneficiary_id': 'beneficiary',
        'expire_at': '4102444800000',
      },
    ],
  },
  'GET_ACCESS_DETAILS' => {
    'getAccessDetails': {
      'user': 'person',
      'beneficiary_id': 'beneficiary',
      'expire_at': '4102444800000',
    },
  },
  'GET_GRANTED_METAMODEL_TYPE_COUNTS' => {
    'getGrantedMetamodelTypeCounts': [
      {'type': 'NOTE', 'count': 3},
      {'type': 'FILE', 'count': 2},
    ],
  },
  _ => throw StateError('Missing design fixture: ' + name),
};
