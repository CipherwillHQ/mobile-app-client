import 'package:gql/ast.dart';

class Query$GET_SMARTWILL_BENEFICIARY {
  Query$GET_SMARTWILL_BENEFICIARY({
    this.getSmartWillBeneficiaries,
    this.$__typename = 'Query',
  });

  factory Query$GET_SMARTWILL_BENEFICIARY.fromJson(Map<String, dynamic> json) {
    final l$getSmartWillBeneficiaries = json['getSmartWillBeneficiaries'];
    final l$$__typename = json['__typename'];
    return Query$GET_SMARTWILL_BENEFICIARY(
      getSmartWillBeneficiaries: (l$getSmartWillBeneficiaries as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries?>?
  getSmartWillBeneficiaries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSmartWillBeneficiaries = getSmartWillBeneficiaries;
    _resultData['getSmartWillBeneficiaries'] = l$getSmartWillBeneficiaries
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSmartWillBeneficiaries = getSmartWillBeneficiaries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSmartWillBeneficiaries == null
          ? null
          : Object.hashAll(l$getSmartWillBeneficiaries.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_SMARTWILL_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSmartWillBeneficiaries = getSmartWillBeneficiaries;
    final lOther$getSmartWillBeneficiaries = other.getSmartWillBeneficiaries;
    if (l$getSmartWillBeneficiaries != null &&
        lOther$getSmartWillBeneficiaries != null) {
      if (l$getSmartWillBeneficiaries.length !=
          lOther$getSmartWillBeneficiaries.length) {
        return false;
      }
      for (int i = 0; i < l$getSmartWillBeneficiaries.length; i++) {
        final l$getSmartWillBeneficiaries$entry =
            l$getSmartWillBeneficiaries[i];
        final lOther$getSmartWillBeneficiaries$entry =
            lOther$getSmartWillBeneficiaries[i];
        if (l$getSmartWillBeneficiaries$entry !=
            lOther$getSmartWillBeneficiaries$entry) {
          return false;
        }
      }
    } else if (l$getSmartWillBeneficiaries !=
        lOther$getSmartWillBeneficiaries) {
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

extension UtilityExtension$Query$GET_SMARTWILL_BENEFICIARY
    on Query$GET_SMARTWILL_BENEFICIARY {
  CopyWith$Query$GET_SMARTWILL_BENEFICIARY<Query$GET_SMARTWILL_BENEFICIARY>
  get copyWith => CopyWith$Query$GET_SMARTWILL_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Query$GET_SMARTWILL_BENEFICIARY<TRes> {
  factory CopyWith$Query$GET_SMARTWILL_BENEFICIARY(
    Query$GET_SMARTWILL_BENEFICIARY instance,
    TRes Function(Query$GET_SMARTWILL_BENEFICIARY) then,
  ) = _CopyWithImpl$Query$GET_SMARTWILL_BENEFICIARY;

  factory CopyWith$Query$GET_SMARTWILL_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_SMARTWILL_BENEFICIARY;

  TRes call({
    List<Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries?>?
    getSmartWillBeneficiaries,
    String? $__typename,
  });
  TRes getSmartWillBeneficiaries(
    Iterable<Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries?>?
    Function(
      Iterable<
        CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
          Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Query$GET_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithImpl$Query$GET_SMARTWILL_BENEFICIARY(this._instance, this._then);

  final Query$GET_SMARTWILL_BENEFICIARY _instance;

  final TRes Function(Query$GET_SMARTWILL_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSmartWillBeneficiaries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_SMARTWILL_BENEFICIARY(
      getSmartWillBeneficiaries: getSmartWillBeneficiaries == _undefined
          ? _instance.getSmartWillBeneficiaries
          : (getSmartWillBeneficiaries
                as List<
                  Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries?
                >?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getSmartWillBeneficiaries(
    Iterable<Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries?>?
    Function(
      Iterable<
        CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
          Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries
        >?
      >?,
    )
    _fn,
  ) => call(
    getSmartWillBeneficiaries: _fn(
      _instance.getSmartWillBeneficiaries?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Query$GET_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Query$GET_SMARTWILL_BENEFICIARY(this._res);

  TRes _res;

  call({
    List<Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries?>?
    getSmartWillBeneficiaries,
    String? $__typename,
  }) => _res;

  getSmartWillBeneficiaries(_fn) => _res;
}

const documentNodeQueryGET_SMARTWILL_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_SMARTWILL_BENEFICIARY'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getSmartWillBeneficiaries'),
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
                  name: NameNode(value: 'user_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'person_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'publicKey'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'custom_message'),
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

class Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries {
  Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries({
    required this.id,
    required this.user_id,
    required this.person_id,
    required this.publicKey,
    this.custom_message,
    required this.created_at,
    this.$__typename = 'Beneficiary',
  });

  factory Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$user_id = json['user_id'];
    final l$person_id = json['person_id'];
    final l$publicKey = json['publicKey'];
    final l$custom_message = json['custom_message'];
    final l$created_at = json['created_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
      id: (l$id as String),
      user_id: (l$user_id as String),
      person_id: (l$person_id as String),
      publicKey: (l$publicKey as String),
      custom_message: (l$custom_message as String?),
      created_at: (l$created_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String user_id;

  final String person_id;

  final String publicKey;

  final String? custom_message;

  final String created_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$person_id = person_id;
    _resultData['person_id'] = l$person_id;
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$custom_message = custom_message;
    _resultData['custom_message'] = l$custom_message;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user_id = user_id;
    final l$person_id = person_id;
    final l$publicKey = publicKey;
    final l$custom_message = custom_message;
    final l$created_at = created_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user_id,
      l$person_id,
      l$publicKey,
      l$custom_message,
      l$created_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$person_id = person_id;
    final lOther$person_id = other.person_id;
    if (l$person_id != lOther$person_id) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$custom_message = custom_message;
    final lOther$custom_message = other.custom_message;
    if (l$custom_message != lOther$custom_message) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

extension UtilityExtension$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries
    on Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries {
  CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
    Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries
  >
  get copyWith =>
      CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
  TRes
> {
  factory CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
    Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries instance,
    TRes Function(Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries)
    then,
  ) = _CopyWithImpl$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries;

  factory CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries;

  TRes call({
    String? id,
    String? user_id,
    String? person_id,
    String? publicKey,
    String? custom_message,
    String? created_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
  TRes
>
    implements
        CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
          TRes
        > {
  _CopyWithImpl$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
    this._instance,
    this._then,
  );

  final Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries _instance;

  final TRes Function(Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? user_id = _undefined,
    Object? person_id = _undefined,
    Object? publicKey = _undefined,
    Object? custom_message = _undefined,
    Object? created_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      user_id: user_id == _undefined || user_id == null
          ? _instance.user_id
          : (user_id as String),
      person_id: person_id == _undefined || person_id == null
          ? _instance.person_id
          : (person_id as String),
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      custom_message: custom_message == _undefined
          ? _instance.custom_message
          : (custom_message as String?),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
  TRes
>
    implements
        CopyWith$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_SMARTWILL_BENEFICIARY$getSmartWillBeneficiaries(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? user_id,
    String? person_id,
    String? publicKey,
    String? custom_message,
    String? created_at,
    String? $__typename,
  }) => _res;
}
