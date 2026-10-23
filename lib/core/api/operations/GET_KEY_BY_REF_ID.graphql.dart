import 'package:gql/ast.dart';

class Variables$Query$GET_KEY_BY_REF_ID {
  factory Variables$Query$GET_KEY_BY_REF_ID({
    required String ref_id,
    String? publicKey,
  }) => Variables$Query$GET_KEY_BY_REF_ID._({
    r'ref_id': ref_id,
    if (publicKey != null) r'publicKey': publicKey,
  });

  Variables$Query$GET_KEY_BY_REF_ID._(this._$data);

  factory Variables$Query$GET_KEY_BY_REF_ID.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    if (data.containsKey('publicKey')) {
      final l$publicKey = data['publicKey'];
      result$data['publicKey'] = (l$publicKey as String?);
    }
    return Variables$Query$GET_KEY_BY_REF_ID._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ref_id => (_$data['ref_id'] as String);

  String? get publicKey => (_$data['publicKey'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    if (_$data.containsKey('publicKey')) {
      final l$publicKey = publicKey;
      result$data['publicKey'] = l$publicKey;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GET_KEY_BY_REF_ID<Variables$Query$GET_KEY_BY_REF_ID>
  get copyWith => CopyWith$Variables$Query$GET_KEY_BY_REF_ID(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_KEY_BY_REF_ID ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (_$data.containsKey('publicKey') !=
        other._$data.containsKey('publicKey')) {
      return false;
    }
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ref_id = ref_id;
    final l$publicKey = publicKey;
    return Object.hashAll([
      l$ref_id,
      _$data.containsKey('publicKey') ? l$publicKey : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GET_KEY_BY_REF_ID<TRes> {
  factory CopyWith$Variables$Query$GET_KEY_BY_REF_ID(
    Variables$Query$GET_KEY_BY_REF_ID instance,
    TRes Function(Variables$Query$GET_KEY_BY_REF_ID) then,
  ) = _CopyWithImpl$Variables$Query$GET_KEY_BY_REF_ID;

  factory CopyWith$Variables$Query$GET_KEY_BY_REF_ID.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_KEY_BY_REF_ID;

  TRes call({String? ref_id, String? publicKey});
}

class _CopyWithImpl$Variables$Query$GET_KEY_BY_REF_ID<TRes>
    implements CopyWith$Variables$Query$GET_KEY_BY_REF_ID<TRes> {
  _CopyWithImpl$Variables$Query$GET_KEY_BY_REF_ID(this._instance, this._then);

  final Variables$Query$GET_KEY_BY_REF_ID _instance;

  final TRes Function(Variables$Query$GET_KEY_BY_REF_ID) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? ref_id = _undefined, Object? publicKey = _undefined}) =>
      _then(
        Variables$Query$GET_KEY_BY_REF_ID._({
          ..._instance._$data,
          if (ref_id != _undefined && ref_id != null)
            'ref_id': (ref_id as String),
          if (publicKey != _undefined) 'publicKey': (publicKey as String?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$GET_KEY_BY_REF_ID<TRes>
    implements CopyWith$Variables$Query$GET_KEY_BY_REF_ID<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_KEY_BY_REF_ID(this._res);

  TRes _res;

  call({String? ref_id, String? publicKey}) => _res;
}

class Query$GET_KEY_BY_REF_ID {
  Query$GET_KEY_BY_REF_ID({this.getKeyByRefId, this.$__typename = 'Query'});

  factory Query$GET_KEY_BY_REF_ID.fromJson(Map<String, dynamic> json) {
    final l$getKeyByRefId = json['getKeyByRefId'];
    final l$$__typename = json['__typename'];
    return Query$GET_KEY_BY_REF_ID(
      getKeyByRefId: l$getKeyByRefId == null
          ? null
          : Query$GET_KEY_BY_REF_ID$getKeyByRefId.fromJson(
              (l$getKeyByRefId as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_KEY_BY_REF_ID$getKeyByRefId? getKeyByRefId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getKeyByRefId = getKeyByRefId;
    _resultData['getKeyByRefId'] = l$getKeyByRefId?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getKeyByRefId = getKeyByRefId;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getKeyByRefId, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_KEY_BY_REF_ID || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getKeyByRefId = getKeyByRefId;
    final lOther$getKeyByRefId = other.getKeyByRefId;
    if (l$getKeyByRefId != lOther$getKeyByRefId) {
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

extension UtilityExtension$Query$GET_KEY_BY_REF_ID on Query$GET_KEY_BY_REF_ID {
  CopyWith$Query$GET_KEY_BY_REF_ID<Query$GET_KEY_BY_REF_ID> get copyWith =>
      CopyWith$Query$GET_KEY_BY_REF_ID(this, (i) => i);
}

abstract class CopyWith$Query$GET_KEY_BY_REF_ID<TRes> {
  factory CopyWith$Query$GET_KEY_BY_REF_ID(
    Query$GET_KEY_BY_REF_ID instance,
    TRes Function(Query$GET_KEY_BY_REF_ID) then,
  ) = _CopyWithImpl$Query$GET_KEY_BY_REF_ID;

  factory CopyWith$Query$GET_KEY_BY_REF_ID.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_KEY_BY_REF_ID;

  TRes call({
    Query$GET_KEY_BY_REF_ID$getKeyByRefId? getKeyByRefId,
    String? $__typename,
  });
  CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes> get getKeyByRefId;
}

class _CopyWithImpl$Query$GET_KEY_BY_REF_ID<TRes>
    implements CopyWith$Query$GET_KEY_BY_REF_ID<TRes> {
  _CopyWithImpl$Query$GET_KEY_BY_REF_ID(this._instance, this._then);

  final Query$GET_KEY_BY_REF_ID _instance;

  final TRes Function(Query$GET_KEY_BY_REF_ID) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getKeyByRefId = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_KEY_BY_REF_ID(
      getKeyByRefId: getKeyByRefId == _undefined
          ? _instance.getKeyByRefId
          : (getKeyByRefId as Query$GET_KEY_BY_REF_ID$getKeyByRefId?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes> get getKeyByRefId {
    final local$getKeyByRefId = _instance.getKeyByRefId;
    return local$getKeyByRefId == null
        ? CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId.stub(_then(_instance))
        : CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId(
            local$getKeyByRefId,
            (e) => call(getKeyByRefId: e),
          );
  }
}

class _CopyWithStubImpl$Query$GET_KEY_BY_REF_ID<TRes>
    implements CopyWith$Query$GET_KEY_BY_REF_ID<TRes> {
  _CopyWithStubImpl$Query$GET_KEY_BY_REF_ID(this._res);

  TRes _res;

  call({
    Query$GET_KEY_BY_REF_ID$getKeyByRefId? getKeyByRefId,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes> get getKeyByRefId =>
      CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId.stub(_res);
}

const documentNodeQueryGET_KEY_BY_REF_ID = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_KEY_BY_REF_ID'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ref_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'publicKey')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getKeyByRefId'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'ref_id'),
                value: VariableNode(name: NameNode(value: 'ref_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'publicKey'),
                value: VariableNode(name: NameNode(value: 'publicKey')),
              ),
            ],
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
                  name: NameNode(value: 'ref_id'),
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
                  name: NameNode(value: 'key'),
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

class Query$GET_KEY_BY_REF_ID$getKeyByRefId {
  Query$GET_KEY_BY_REF_ID$getKeyByRefId({
    required this.id,
    required this.ref_id,
    required this.publicKey,
    required this.key,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Key',
  });

  factory Query$GET_KEY_BY_REF_ID$getKeyByRefId.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$ref_id = json['ref_id'];
    final l$publicKey = json['publicKey'];
    final l$key = json['key'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_KEY_BY_REF_ID$getKeyByRefId(
      id: (l$id as String),
      ref_id: (l$ref_id as String),
      publicKey: (l$publicKey as String),
      key: (l$key as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String ref_id;

  final String publicKey;

  final String key;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$ref_id = ref_id;
    _resultData['ref_id'] = l$ref_id;
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$key = key;
    _resultData['key'] = l$key;
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
    final l$ref_id = ref_id;
    final l$publicKey = publicKey;
    final l$key = key;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$ref_id,
      l$publicKey,
      l$key,
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
    if (other is! Query$GET_KEY_BY_REF_ID$getKeyByRefId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
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

extension UtilityExtension$Query$GET_KEY_BY_REF_ID$getKeyByRefId
    on Query$GET_KEY_BY_REF_ID$getKeyByRefId {
  CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<
    Query$GET_KEY_BY_REF_ID$getKeyByRefId
  >
  get copyWith =>
      CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId(this, (i) => i);
}

abstract class CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes> {
  factory CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId(
    Query$GET_KEY_BY_REF_ID$getKeyByRefId instance,
    TRes Function(Query$GET_KEY_BY_REF_ID$getKeyByRefId) then,
  ) = _CopyWithImpl$Query$GET_KEY_BY_REF_ID$getKeyByRefId;

  factory CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_KEY_BY_REF_ID$getKeyByRefId;

  TRes call({
    String? id,
    String? ref_id,
    String? publicKey,
    String? key,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes>
    implements CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes> {
  _CopyWithImpl$Query$GET_KEY_BY_REF_ID$getKeyByRefId(
    this._instance,
    this._then,
  );

  final Query$GET_KEY_BY_REF_ID$getKeyByRefId _instance;

  final TRes Function(Query$GET_KEY_BY_REF_ID$getKeyByRefId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? ref_id = _undefined,
    Object? publicKey = _undefined,
    Object? key = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_KEY_BY_REF_ID$getKeyByRefId(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      ref_id: ref_id == _undefined || ref_id == null
          ? _instance.ref_id
          : (ref_id as String),
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      key: key == _undefined || key == null ? _instance.key : (key as String),
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

class _CopyWithStubImpl$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes>
    implements CopyWith$Query$GET_KEY_BY_REF_ID$getKeyByRefId<TRes> {
  _CopyWithStubImpl$Query$GET_KEY_BY_REF_ID$getKeyByRefId(this._res);

  TRes _res;

  call({
    String? id,
    String? ref_id,
    String? publicKey,
    String? key,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
