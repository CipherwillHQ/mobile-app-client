import 'package:gql/ast.dart';

class Query$GET_USER_PHONE_NUMBERS {
  Query$GET_USER_PHONE_NUMBERS({
    required this.getUserPhoneNumbers,
    this.$__typename = 'Query',
  });

  factory Query$GET_USER_PHONE_NUMBERS.fromJson(Map<String, dynamic> json) {
    final l$getUserPhoneNumbers = json['getUserPhoneNumbers'];
    final l$$__typename = json['__typename'];
    return Query$GET_USER_PHONE_NUMBERS(
      getUserPhoneNumbers: (l$getUserPhoneNumbers as List<dynamic>)
          .map(
            (e) => e == null
                ? null
                : Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers?>
  getUserPhoneNumbers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUserPhoneNumbers = getUserPhoneNumbers;
    _resultData['getUserPhoneNumbers'] = l$getUserPhoneNumbers
        .map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUserPhoneNumbers = getUserPhoneNumbers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getUserPhoneNumbers.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_USER_PHONE_NUMBERS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUserPhoneNumbers = getUserPhoneNumbers;
    final lOther$getUserPhoneNumbers = other.getUserPhoneNumbers;
    if (l$getUserPhoneNumbers.length != lOther$getUserPhoneNumbers.length) {
      return false;
    }
    for (int i = 0; i < l$getUserPhoneNumbers.length; i++) {
      final l$getUserPhoneNumbers$entry = l$getUserPhoneNumbers[i];
      final lOther$getUserPhoneNumbers$entry = lOther$getUserPhoneNumbers[i];
      if (l$getUserPhoneNumbers$entry != lOther$getUserPhoneNumbers$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GET_USER_PHONE_NUMBERS
    on Query$GET_USER_PHONE_NUMBERS {
  CopyWith$Query$GET_USER_PHONE_NUMBERS<Query$GET_USER_PHONE_NUMBERS>
  get copyWith => CopyWith$Query$GET_USER_PHONE_NUMBERS(this, (i) => i);
}

abstract class CopyWith$Query$GET_USER_PHONE_NUMBERS<TRes> {
  factory CopyWith$Query$GET_USER_PHONE_NUMBERS(
    Query$GET_USER_PHONE_NUMBERS instance,
    TRes Function(Query$GET_USER_PHONE_NUMBERS) then,
  ) = _CopyWithImpl$Query$GET_USER_PHONE_NUMBERS;

  factory CopyWith$Query$GET_USER_PHONE_NUMBERS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_USER_PHONE_NUMBERS;

  TRes call({
    List<Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers?>?
    getUserPhoneNumbers,
    String? $__typename,
  });
  TRes getUserPhoneNumbers(
    Iterable<Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers?> Function(
      Iterable<
        CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<
          Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers
        >?
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_USER_PHONE_NUMBERS<TRes>
    implements CopyWith$Query$GET_USER_PHONE_NUMBERS<TRes> {
  _CopyWithImpl$Query$GET_USER_PHONE_NUMBERS(this._instance, this._then);

  final Query$GET_USER_PHONE_NUMBERS _instance;

  final TRes Function(Query$GET_USER_PHONE_NUMBERS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUserPhoneNumbers = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_USER_PHONE_NUMBERS(
      getUserPhoneNumbers:
          getUserPhoneNumbers == _undefined || getUserPhoneNumbers == null
          ? _instance.getUserPhoneNumbers
          : (getUserPhoneNumbers
                as List<Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers?>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getUserPhoneNumbers(
    Iterable<Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers?> Function(
      Iterable<
        CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<
          Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers
        >?
      >,
    )
    _fn,
  ) => call(
    getUserPhoneNumbers: _fn(
      _instance.getUserPhoneNumbers.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(
                e,
                (i) => i,
              ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_USER_PHONE_NUMBERS<TRes>
    implements CopyWith$Query$GET_USER_PHONE_NUMBERS<TRes> {
  _CopyWithStubImpl$Query$GET_USER_PHONE_NUMBERS(this._res);

  TRes _res;

  call({
    List<Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers?>?
    getUserPhoneNumbers,
    String? $__typename,
  }) => _res;

  getUserPhoneNumbers(_fn) => _res;
}

const documentNodeQueryGET_USER_PHONE_NUMBERS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_USER_PHONE_NUMBERS'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getUserPhoneNumbers'),
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
                  name: NameNode(value: 'phone_code'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'phone_num'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'verified'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mandatory_phone_calls'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mandatory_sms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mandatory_whatsapp'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_phone_calls'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_sms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_whatsapp'),
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

class Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers {
  Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers({
    required this.id,
    required this.phone_code,
    required this.phone_num,
    required this.verified,
    required this.mandatory_phone_calls,
    required this.mandatory_sms,
    required this.mandatory_whatsapp,
    required this.promotional_phone_calls,
    required this.promotional_sms,
    required this.promotional_whatsapp,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'UserPhoneNumber',
  });

  factory Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$phone_code = json['phone_code'];
    final l$phone_num = json['phone_num'];
    final l$verified = json['verified'];
    final l$mandatory_phone_calls = json['mandatory_phone_calls'];
    final l$mandatory_sms = json['mandatory_sms'];
    final l$mandatory_whatsapp = json['mandatory_whatsapp'];
    final l$promotional_phone_calls = json['promotional_phone_calls'];
    final l$promotional_sms = json['promotional_sms'];
    final l$promotional_whatsapp = json['promotional_whatsapp'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(
      id: (l$id as String),
      phone_code: (l$phone_code as String),
      phone_num: (l$phone_num as String),
      verified: (l$verified as bool),
      mandatory_phone_calls: (l$mandatory_phone_calls as bool),
      mandatory_sms: (l$mandatory_sms as bool),
      mandatory_whatsapp: (l$mandatory_whatsapp as bool),
      promotional_phone_calls: (l$promotional_phone_calls as bool),
      promotional_sms: (l$promotional_sms as bool),
      promotional_whatsapp: (l$promotional_whatsapp as bool),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String phone_code;

  final String phone_num;

  final bool verified;

  final bool mandatory_phone_calls;

  final bool mandatory_sms;

  final bool mandatory_whatsapp;

  final bool promotional_phone_calls;

  final bool promotional_sms;

  final bool promotional_whatsapp;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone_code = phone_code;
    _resultData['phone_code'] = l$phone_code;
    final l$phone_num = phone_num;
    _resultData['phone_num'] = l$phone_num;
    final l$verified = verified;
    _resultData['verified'] = l$verified;
    final l$mandatory_phone_calls = mandatory_phone_calls;
    _resultData['mandatory_phone_calls'] = l$mandatory_phone_calls;
    final l$mandatory_sms = mandatory_sms;
    _resultData['mandatory_sms'] = l$mandatory_sms;
    final l$mandatory_whatsapp = mandatory_whatsapp;
    _resultData['mandatory_whatsapp'] = l$mandatory_whatsapp;
    final l$promotional_phone_calls = promotional_phone_calls;
    _resultData['promotional_phone_calls'] = l$promotional_phone_calls;
    final l$promotional_sms = promotional_sms;
    _resultData['promotional_sms'] = l$promotional_sms;
    final l$promotional_whatsapp = promotional_whatsapp;
    _resultData['promotional_whatsapp'] = l$promotional_whatsapp;
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
    final l$phone_code = phone_code;
    final l$phone_num = phone_num;
    final l$verified = verified;
    final l$mandatory_phone_calls = mandatory_phone_calls;
    final l$mandatory_sms = mandatory_sms;
    final l$mandatory_whatsapp = mandatory_whatsapp;
    final l$promotional_phone_calls = promotional_phone_calls;
    final l$promotional_sms = promotional_sms;
    final l$promotional_whatsapp = promotional_whatsapp;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$phone_code,
      l$phone_num,
      l$verified,
      l$mandatory_phone_calls,
      l$mandatory_sms,
      l$mandatory_whatsapp,
      l$promotional_phone_calls,
      l$promotional_sms,
      l$promotional_whatsapp,
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
    if (other is! Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone_code = phone_code;
    final lOther$phone_code = other.phone_code;
    if (l$phone_code != lOther$phone_code) {
      return false;
    }
    final l$phone_num = phone_num;
    final lOther$phone_num = other.phone_num;
    if (l$phone_num != lOther$phone_num) {
      return false;
    }
    final l$verified = verified;
    final lOther$verified = other.verified;
    if (l$verified != lOther$verified) {
      return false;
    }
    final l$mandatory_phone_calls = mandatory_phone_calls;
    final lOther$mandatory_phone_calls = other.mandatory_phone_calls;
    if (l$mandatory_phone_calls != lOther$mandatory_phone_calls) {
      return false;
    }
    final l$mandatory_sms = mandatory_sms;
    final lOther$mandatory_sms = other.mandatory_sms;
    if (l$mandatory_sms != lOther$mandatory_sms) {
      return false;
    }
    final l$mandatory_whatsapp = mandatory_whatsapp;
    final lOther$mandatory_whatsapp = other.mandatory_whatsapp;
    if (l$mandatory_whatsapp != lOther$mandatory_whatsapp) {
      return false;
    }
    final l$promotional_phone_calls = promotional_phone_calls;
    final lOther$promotional_phone_calls = other.promotional_phone_calls;
    if (l$promotional_phone_calls != lOther$promotional_phone_calls) {
      return false;
    }
    final l$promotional_sms = promotional_sms;
    final lOther$promotional_sms = other.promotional_sms;
    if (l$promotional_sms != lOther$promotional_sms) {
      return false;
    }
    final l$promotional_whatsapp = promotional_whatsapp;
    final lOther$promotional_whatsapp = other.promotional_whatsapp;
    if (l$promotional_whatsapp != lOther$promotional_whatsapp) {
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

extension UtilityExtension$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers
    on Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers {
  CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<
    Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers
  >
  get copyWith =>
      CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(this, (i) => i);
}

abstract class CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<TRes> {
  factory CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(
    Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers instance,
    TRes Function(Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers) then,
  ) = _CopyWithImpl$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers;

  factory CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers;

  TRes call({
    String? id,
    String? phone_code,
    String? phone_num,
    bool? verified,
    bool? mandatory_phone_calls,
    bool? mandatory_sms,
    bool? mandatory_whatsapp,
    bool? promotional_phone_calls,
    bool? promotional_sms,
    bool? promotional_whatsapp,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<TRes>
    implements CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<TRes> {
  _CopyWithImpl$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(
    this._instance,
    this._then,
  );

  final Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers _instance;

  final TRes Function(Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? phone_code = _undefined,
    Object? phone_num = _undefined,
    Object? verified = _undefined,
    Object? mandatory_phone_calls = _undefined,
    Object? mandatory_sms = _undefined,
    Object? mandatory_whatsapp = _undefined,
    Object? promotional_phone_calls = _undefined,
    Object? promotional_sms = _undefined,
    Object? promotional_whatsapp = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      phone_code: phone_code == _undefined || phone_code == null
          ? _instance.phone_code
          : (phone_code as String),
      phone_num: phone_num == _undefined || phone_num == null
          ? _instance.phone_num
          : (phone_num as String),
      verified: verified == _undefined || verified == null
          ? _instance.verified
          : (verified as bool),
      mandatory_phone_calls:
          mandatory_phone_calls == _undefined || mandatory_phone_calls == null
          ? _instance.mandatory_phone_calls
          : (mandatory_phone_calls as bool),
      mandatory_sms: mandatory_sms == _undefined || mandatory_sms == null
          ? _instance.mandatory_sms
          : (mandatory_sms as bool),
      mandatory_whatsapp:
          mandatory_whatsapp == _undefined || mandatory_whatsapp == null
          ? _instance.mandatory_whatsapp
          : (mandatory_whatsapp as bool),
      promotional_phone_calls:
          promotional_phone_calls == _undefined ||
              promotional_phone_calls == null
          ? _instance.promotional_phone_calls
          : (promotional_phone_calls as bool),
      promotional_sms: promotional_sms == _undefined || promotional_sms == null
          ? _instance.promotional_sms
          : (promotional_sms as bool),
      promotional_whatsapp:
          promotional_whatsapp == _undefined || promotional_whatsapp == null
          ? _instance.promotional_whatsapp
          : (promotional_whatsapp as bool),
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

class _CopyWithStubImpl$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<TRes>
    implements CopyWith$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers<TRes> {
  _CopyWithStubImpl$Query$GET_USER_PHONE_NUMBERS$getUserPhoneNumbers(this._res);

  TRes _res;

  call({
    String? id,
    String? phone_code,
    String? phone_num,
    bool? verified,
    bool? mandatory_phone_calls,
    bool? mandatory_sms,
    bool? mandatory_whatsapp,
    bool? promotional_phone_calls,
    bool? promotional_sms,
    bool? promotional_whatsapp,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
