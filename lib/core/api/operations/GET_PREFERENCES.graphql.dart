import 'package:gql/ast.dart';

class Query$GET_PREFERENCES {
  Query$GET_PREFERENCES({
    required this.getPreferences,
    this.$__typename = 'Query',
  });

  factory Query$GET_PREFERENCES.fromJson(Map<String, dynamic> json) {
    final l$getPreferences = json['getPreferences'];
    final l$$__typename = json['__typename'];
    return Query$GET_PREFERENCES(
      getPreferences: Query$GET_PREFERENCES$getPreferences.fromJson(
        (l$getPreferences as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_PREFERENCES$getPreferences getPreferences;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getPreferences = getPreferences;
    _resultData['getPreferences'] = l$getPreferences.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getPreferences = getPreferences;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getPreferences, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PREFERENCES || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getPreferences = getPreferences;
    final lOther$getPreferences = other.getPreferences;
    if (l$getPreferences != lOther$getPreferences) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GET_PREFERENCES on Query$GET_PREFERENCES {
  CopyWith$Query$GET_PREFERENCES<Query$GET_PREFERENCES> get copyWith =>
      CopyWith$Query$GET_PREFERENCES(this, (i) => i);
}

abstract class CopyWith$Query$GET_PREFERENCES<TRes> {
  factory CopyWith$Query$GET_PREFERENCES(
    Query$GET_PREFERENCES instance,
    TRes Function(Query$GET_PREFERENCES) then,
  ) = _CopyWithImpl$Query$GET_PREFERENCES;

  factory CopyWith$Query$GET_PREFERENCES.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PREFERENCES;

  TRes call({
    Query$GET_PREFERENCES$getPreferences? getPreferences,
    String? $__typename,
  });
  CopyWith$Query$GET_PREFERENCES$getPreferences<TRes> get getPreferences;
}

class _CopyWithImpl$Query$GET_PREFERENCES<TRes>
    implements CopyWith$Query$GET_PREFERENCES<TRes> {
  _CopyWithImpl$Query$GET_PREFERENCES(this._instance, this._then);

  final Query$GET_PREFERENCES _instance;

  final TRes Function(Query$GET_PREFERENCES) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getPreferences = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PREFERENCES(
      getPreferences: getPreferences == _undefined || getPreferences == null
          ? _instance.getPreferences
          : (getPreferences as Query$GET_PREFERENCES$getPreferences),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_PREFERENCES$getPreferences<TRes> get getPreferences {
    final local$getPreferences = _instance.getPreferences;
    return CopyWith$Query$GET_PREFERENCES$getPreferences(
      local$getPreferences,
      (e) => call(getPreferences: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_PREFERENCES<TRes>
    implements CopyWith$Query$GET_PREFERENCES<TRes> {
  _CopyWithStubImpl$Query$GET_PREFERENCES(this._res);

  TRes _res;

  call({
    Query$GET_PREFERENCES$getPreferences? getPreferences,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_PREFERENCES$getPreferences<TRes> get getPreferences =>
      CopyWith$Query$GET_PREFERENCES$getPreferences.stub(_res);
}

const documentNodeQueryGET_PREFERENCES = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_PREFERENCES'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getPreferences'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'check_in_interval'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_bank_account'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_email_accounts'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_device_locks'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_passwords'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_seed_phrases'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_defi_staking'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_payment_cards'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'segment_storage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_emails'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'first_reminder_after_ms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'second_reminder_after_ms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'last_reminder_after_ms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'will_release_after_ms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'will_revoke_after_ms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'created_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updated_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);

class Query$GET_PREFERENCES$getPreferences {
  Query$GET_PREFERENCES$getPreferences({
    required this.id,
    required this.check_in_interval,
    required this.segment_bank_account,
    required this.segment_email_accounts,
    required this.segment_device_locks,
    required this.segment_passwords,
    required this.segment_seed_phrases,
    required this.segment_defi_staking,
    required this.segment_payment_cards,
    required this.segment_storage,
    required this.promotional_emails,
    required this.first_reminder_after_ms,
    required this.second_reminder_after_ms,
    required this.last_reminder_after_ms,
    required this.will_release_after_ms,
    required this.will_revoke_after_ms,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Preferences',
  });

  factory Query$GET_PREFERENCES$getPreferences.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$check_in_interval = json['check_in_interval'];
    final l$segment_bank_account = json['segment_bank_account'];
    final l$segment_email_accounts = json['segment_email_accounts'];
    final l$segment_device_locks = json['segment_device_locks'];
    final l$segment_passwords = json['segment_passwords'];
    final l$segment_seed_phrases = json['segment_seed_phrases'];
    final l$segment_defi_staking = json['segment_defi_staking'];
    final l$segment_payment_cards = json['segment_payment_cards'];
    final l$segment_storage = json['segment_storage'];
    final l$promotional_emails = json['promotional_emails'];
    final l$first_reminder_after_ms = json['first_reminder_after_ms'];
    final l$second_reminder_after_ms = json['second_reminder_after_ms'];
    final l$last_reminder_after_ms = json['last_reminder_after_ms'];
    final l$will_release_after_ms = json['will_release_after_ms'];
    final l$will_revoke_after_ms = json['will_revoke_after_ms'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_PREFERENCES$getPreferences(
      id: (l$id as String),
      check_in_interval: (l$check_in_interval as int),
      segment_bank_account: (l$segment_bank_account as bool),
      segment_email_accounts: (l$segment_email_accounts as bool),
      segment_device_locks: (l$segment_device_locks as bool),
      segment_passwords: (l$segment_passwords as bool),
      segment_seed_phrases: (l$segment_seed_phrases as bool),
      segment_defi_staking: (l$segment_defi_staking as bool),
      segment_payment_cards: (l$segment_payment_cards as bool),
      segment_storage: (l$segment_storage as bool),
      promotional_emails: (l$promotional_emails as bool),
      first_reminder_after_ms: (l$first_reminder_after_ms as String),
      second_reminder_after_ms: (l$second_reminder_after_ms as String),
      last_reminder_after_ms: (l$last_reminder_after_ms as String),
      will_release_after_ms: (l$will_release_after_ms as String),
      will_revoke_after_ms: (l$will_revoke_after_ms as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int check_in_interval;

  final bool segment_bank_account;

  final bool segment_email_accounts;

  final bool segment_device_locks;

  final bool segment_passwords;

  final bool segment_seed_phrases;

  final bool segment_defi_staking;

  final bool segment_payment_cards;

  final bool segment_storage;

  final bool promotional_emails;

  final String first_reminder_after_ms;

  final String second_reminder_after_ms;

  final String last_reminder_after_ms;

  final String will_release_after_ms;

  final String will_revoke_after_ms;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$check_in_interval = check_in_interval;
    _resultData['check_in_interval'] = l$check_in_interval;
    final l$segment_bank_account = segment_bank_account;
    _resultData['segment_bank_account'] = l$segment_bank_account;
    final l$segment_email_accounts = segment_email_accounts;
    _resultData['segment_email_accounts'] = l$segment_email_accounts;
    final l$segment_device_locks = segment_device_locks;
    _resultData['segment_device_locks'] = l$segment_device_locks;
    final l$segment_passwords = segment_passwords;
    _resultData['segment_passwords'] = l$segment_passwords;
    final l$segment_seed_phrases = segment_seed_phrases;
    _resultData['segment_seed_phrases'] = l$segment_seed_phrases;
    final l$segment_defi_staking = segment_defi_staking;
    _resultData['segment_defi_staking'] = l$segment_defi_staking;
    final l$segment_payment_cards = segment_payment_cards;
    _resultData['segment_payment_cards'] = l$segment_payment_cards;
    final l$segment_storage = segment_storage;
    _resultData['segment_storage'] = l$segment_storage;
    final l$promotional_emails = promotional_emails;
    _resultData['promotional_emails'] = l$promotional_emails;
    final l$first_reminder_after_ms = first_reminder_after_ms;
    _resultData['first_reminder_after_ms'] = l$first_reminder_after_ms;
    final l$second_reminder_after_ms = second_reminder_after_ms;
    _resultData['second_reminder_after_ms'] = l$second_reminder_after_ms;
    final l$last_reminder_after_ms = last_reminder_after_ms;
    _resultData['last_reminder_after_ms'] = l$last_reminder_after_ms;
    final l$will_release_after_ms = will_release_after_ms;
    _resultData['will_release_after_ms'] = l$will_release_after_ms;
    final l$will_revoke_after_ms = will_revoke_after_ms;
    _resultData['will_revoke_after_ms'] = l$will_revoke_after_ms;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$check_in_interval = check_in_interval;
    final l$segment_bank_account = segment_bank_account;
    final l$segment_email_accounts = segment_email_accounts;
    final l$segment_device_locks = segment_device_locks;
    final l$segment_passwords = segment_passwords;
    final l$segment_seed_phrases = segment_seed_phrases;
    final l$segment_defi_staking = segment_defi_staking;
    final l$segment_payment_cards = segment_payment_cards;
    final l$segment_storage = segment_storage;
    final l$promotional_emails = promotional_emails;
    final l$first_reminder_after_ms = first_reminder_after_ms;
    final l$second_reminder_after_ms = second_reminder_after_ms;
    final l$last_reminder_after_ms = last_reminder_after_ms;
    final l$will_release_after_ms = will_release_after_ms;
    final l$will_revoke_after_ms = will_revoke_after_ms;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$check_in_interval,
      l$segment_bank_account,
      l$segment_email_accounts,
      l$segment_device_locks,
      l$segment_passwords,
      l$segment_seed_phrases,
      l$segment_defi_staking,
      l$segment_payment_cards,
      l$segment_storage,
      l$promotional_emails,
      l$first_reminder_after_ms,
      l$second_reminder_after_ms,
      l$last_reminder_after_ms,
      l$will_release_after_ms,
      l$will_revoke_after_ms,
      l$created_at,
      l$updated_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PREFERENCES$getPreferences ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$check_in_interval = check_in_interval;
    final lOther$check_in_interval = other.check_in_interval;
    if (l$check_in_interval != lOther$check_in_interval) {
      return false;
    }
    final l$segment_bank_account = segment_bank_account;
    final lOther$segment_bank_account = other.segment_bank_account;
    if (l$segment_bank_account != lOther$segment_bank_account) {
      return false;
    }
    final l$segment_email_accounts = segment_email_accounts;
    final lOther$segment_email_accounts = other.segment_email_accounts;
    if (l$segment_email_accounts != lOther$segment_email_accounts) {
      return false;
    }
    final l$segment_device_locks = segment_device_locks;
    final lOther$segment_device_locks = other.segment_device_locks;
    if (l$segment_device_locks != lOther$segment_device_locks) {
      return false;
    }
    final l$segment_passwords = segment_passwords;
    final lOther$segment_passwords = other.segment_passwords;
    if (l$segment_passwords != lOther$segment_passwords) {
      return false;
    }
    final l$segment_seed_phrases = segment_seed_phrases;
    final lOther$segment_seed_phrases = other.segment_seed_phrases;
    if (l$segment_seed_phrases != lOther$segment_seed_phrases) {
      return false;
    }
    final l$segment_defi_staking = segment_defi_staking;
    final lOther$segment_defi_staking = other.segment_defi_staking;
    if (l$segment_defi_staking != lOther$segment_defi_staking) {
      return false;
    }
    final l$segment_payment_cards = segment_payment_cards;
    final lOther$segment_payment_cards = other.segment_payment_cards;
    if (l$segment_payment_cards != lOther$segment_payment_cards) {
      return false;
    }
    final l$segment_storage = segment_storage;
    final lOther$segment_storage = other.segment_storage;
    if (l$segment_storage != lOther$segment_storage) {
      return false;
    }
    final l$promotional_emails = promotional_emails;
    final lOther$promotional_emails = other.promotional_emails;
    if (l$promotional_emails != lOther$promotional_emails) {
      return false;
    }
    final l$first_reminder_after_ms = first_reminder_after_ms;
    final lOther$first_reminder_after_ms = other.first_reminder_after_ms;
    if (l$first_reminder_after_ms != lOther$first_reminder_after_ms) {
      return false;
    }
    final l$second_reminder_after_ms = second_reminder_after_ms;
    final lOther$second_reminder_after_ms = other.second_reminder_after_ms;
    if (l$second_reminder_after_ms != lOther$second_reminder_after_ms) {
      return false;
    }
    final l$last_reminder_after_ms = last_reminder_after_ms;
    final lOther$last_reminder_after_ms = other.last_reminder_after_ms;
    if (l$last_reminder_after_ms != lOther$last_reminder_after_ms) {
      return false;
    }
    final l$will_release_after_ms = will_release_after_ms;
    final lOther$will_release_after_ms = other.will_release_after_ms;
    if (l$will_release_after_ms != lOther$will_release_after_ms) {
      return false;
    }
    final l$will_revoke_after_ms = will_revoke_after_ms;
    final lOther$will_revoke_after_ms = other.will_revoke_after_ms;
    if (l$will_revoke_after_ms != lOther$will_revoke_after_ms) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GET_PREFERENCES$getPreferences
    on Query$GET_PREFERENCES$getPreferences {
  CopyWith$Query$GET_PREFERENCES$getPreferences<
    Query$GET_PREFERENCES$getPreferences
  >
  get copyWith => CopyWith$Query$GET_PREFERENCES$getPreferences(this, (i) => i);
}

abstract class CopyWith$Query$GET_PREFERENCES$getPreferences<TRes> {
  factory CopyWith$Query$GET_PREFERENCES$getPreferences(
    Query$GET_PREFERENCES$getPreferences instance,
    TRes Function(Query$GET_PREFERENCES$getPreferences) then,
  ) = _CopyWithImpl$Query$GET_PREFERENCES$getPreferences;

  factory CopyWith$Query$GET_PREFERENCES$getPreferences.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PREFERENCES$getPreferences;

  TRes call({
    String? id,
    int? check_in_interval,
    bool? segment_bank_account,
    bool? segment_email_accounts,
    bool? segment_device_locks,
    bool? segment_passwords,
    bool? segment_seed_phrases,
    bool? segment_defi_staking,
    bool? segment_payment_cards,
    bool? segment_storage,
    bool? promotional_emails,
    String? first_reminder_after_ms,
    String? second_reminder_after_ms,
    String? last_reminder_after_ms,
    String? will_release_after_ms,
    String? will_revoke_after_ms,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_PREFERENCES$getPreferences<TRes>
    implements CopyWith$Query$GET_PREFERENCES$getPreferences<TRes> {
  _CopyWithImpl$Query$GET_PREFERENCES$getPreferences(
    this._instance,
    this._then,
  );

  final Query$GET_PREFERENCES$getPreferences _instance;

  final TRes Function(Query$GET_PREFERENCES$getPreferences) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? check_in_interval = _undefined,
    Object? segment_bank_account = _undefined,
    Object? segment_email_accounts = _undefined,
    Object? segment_device_locks = _undefined,
    Object? segment_passwords = _undefined,
    Object? segment_seed_phrases = _undefined,
    Object? segment_defi_staking = _undefined,
    Object? segment_payment_cards = _undefined,
    Object? segment_storage = _undefined,
    Object? promotional_emails = _undefined,
    Object? first_reminder_after_ms = _undefined,
    Object? second_reminder_after_ms = _undefined,
    Object? last_reminder_after_ms = _undefined,
    Object? will_release_after_ms = _undefined,
    Object? will_revoke_after_ms = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PREFERENCES$getPreferences(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      check_in_interval:
          check_in_interval == _undefined || check_in_interval == null
          ? _instance.check_in_interval
          : (check_in_interval as int),
      segment_bank_account:
          segment_bank_account == _undefined || segment_bank_account == null
          ? _instance.segment_bank_account
          : (segment_bank_account as bool),
      segment_email_accounts:
          segment_email_accounts == _undefined || segment_email_accounts == null
          ? _instance.segment_email_accounts
          : (segment_email_accounts as bool),
      segment_device_locks:
          segment_device_locks == _undefined || segment_device_locks == null
          ? _instance.segment_device_locks
          : (segment_device_locks as bool),
      segment_passwords:
          segment_passwords == _undefined || segment_passwords == null
          ? _instance.segment_passwords
          : (segment_passwords as bool),
      segment_seed_phrases:
          segment_seed_phrases == _undefined || segment_seed_phrases == null
          ? _instance.segment_seed_phrases
          : (segment_seed_phrases as bool),
      segment_defi_staking:
          segment_defi_staking == _undefined || segment_defi_staking == null
          ? _instance.segment_defi_staking
          : (segment_defi_staking as bool),
      segment_payment_cards:
          segment_payment_cards == _undefined || segment_payment_cards == null
          ? _instance.segment_payment_cards
          : (segment_payment_cards as bool),
      segment_storage: segment_storage == _undefined || segment_storage == null
          ? _instance.segment_storage
          : (segment_storage as bool),
      promotional_emails:
          promotional_emails == _undefined || promotional_emails == null
          ? _instance.promotional_emails
          : (promotional_emails as bool),
      first_reminder_after_ms:
          first_reminder_after_ms == _undefined ||
              first_reminder_after_ms == null
          ? _instance.first_reminder_after_ms
          : (first_reminder_after_ms as String),
      second_reminder_after_ms:
          second_reminder_after_ms == _undefined ||
              second_reminder_after_ms == null
          ? _instance.second_reminder_after_ms
          : (second_reminder_after_ms as String),
      last_reminder_after_ms:
          last_reminder_after_ms == _undefined || last_reminder_after_ms == null
          ? _instance.last_reminder_after_ms
          : (last_reminder_after_ms as String),
      will_release_after_ms:
          will_release_after_ms == _undefined || will_release_after_ms == null
          ? _instance.will_release_after_ms
          : (will_release_after_ms as String),
      will_revoke_after_ms:
          will_revoke_after_ms == _undefined || will_revoke_after_ms == null
          ? _instance.will_revoke_after_ms
          : (will_revoke_after_ms as String),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      updated_at: updated_at == _undefined || updated_at == null
          ? _instance.updated_at
          : (updated_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_PREFERENCES$getPreferences<TRes>
    implements CopyWith$Query$GET_PREFERENCES$getPreferences<TRes> {
  _CopyWithStubImpl$Query$GET_PREFERENCES$getPreferences(this._res);

  TRes _res;

  call({
    String? id,
    int? check_in_interval,
    bool? segment_bank_account,
    bool? segment_email_accounts,
    bool? segment_device_locks,
    bool? segment_passwords,
    bool? segment_seed_phrases,
    bool? segment_defi_staking,
    bool? segment_payment_cards,
    bool? segment_storage,
    bool? promotional_emails,
    String? first_reminder_after_ms,
    String? second_reminder_after_ms,
    String? last_reminder_after_ms,
    String? will_release_after_ms,
    String? will_revoke_after_ms,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
