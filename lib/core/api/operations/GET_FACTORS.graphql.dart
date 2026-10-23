import 'package:gql/ast.dart';

class Query$GET_FACTORS {
  Query$GET_FACTORS({this.getFactors, this.$__typename = 'Query'});

  factory Query$GET_FACTORS.fromJson(Map<String, dynamic> json) {
    final l$getFactors = json['getFactors'];
    final l$$__typename = json['__typename'];
    return Query$GET_FACTORS(
      getFactors: (l$getFactors as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_FACTORS$getFactors.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_FACTORS$getFactors?>? getFactors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getFactors = getFactors;
    _resultData['getFactors'] = l$getFactors?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getFactors = getFactors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getFactors == null ? null : Object.hashAll(l$getFactors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_FACTORS || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getFactors = getFactors;
    final lOther$getFactors = other.getFactors;
    if (l$getFactors != null && lOther$getFactors != null) {
      if (l$getFactors.length != lOther$getFactors.length) {
        return false;
      }
      for (int i = 0; i < l$getFactors.length; i++) {
        final l$getFactors$entry = l$getFactors[i];
        final lOther$getFactors$entry = lOther$getFactors[i];
        if (l$getFactors$entry != lOther$getFactors$entry) {
          return false;
        }
      }
    } else if (l$getFactors != lOther$getFactors) {
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

extension UtilityExtension$Query$GET_FACTORS on Query$GET_FACTORS {
  CopyWith$Query$GET_FACTORS<Query$GET_FACTORS> get copyWith =>
      CopyWith$Query$GET_FACTORS(this, (i) => i);
}

abstract class CopyWith$Query$GET_FACTORS<TRes> {
  factory CopyWith$Query$GET_FACTORS(
    Query$GET_FACTORS instance,
    TRes Function(Query$GET_FACTORS) then,
  ) = _CopyWithImpl$Query$GET_FACTORS;

  factory CopyWith$Query$GET_FACTORS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_FACTORS;

  TRes call({
    List<Query$GET_FACTORS$getFactors?>? getFactors,
    String? $__typename,
  });
  TRes getFactors(
    Iterable<Query$GET_FACTORS$getFactors?>? Function(
      Iterable<
        CopyWith$Query$GET_FACTORS$getFactors<Query$GET_FACTORS$getFactors>?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_FACTORS<TRes>
    implements CopyWith$Query$GET_FACTORS<TRes> {
  _CopyWithImpl$Query$GET_FACTORS(this._instance, this._then);

  final Query$GET_FACTORS _instance;

  final TRes Function(Query$GET_FACTORS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getFactors = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_FACTORS(
      getFactors: getFactors == _undefined
          ? _instance.getFactors
          : (getFactors as List<Query$GET_FACTORS$getFactors?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getFactors(
    Iterable<Query$GET_FACTORS$getFactors?>? Function(
      Iterable<
        CopyWith$Query$GET_FACTORS$getFactors<Query$GET_FACTORS$getFactors>?
      >?,
    )
    _fn,
  ) => call(
    getFactors: _fn(
      _instance.getFactors?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_FACTORS$getFactors(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_FACTORS<TRes>
    implements CopyWith$Query$GET_FACTORS<TRes> {
  _CopyWithStubImpl$Query$GET_FACTORS(this._res);

  TRes _res;

  call({
    List<Query$GET_FACTORS$getFactors?>? getFactors,
    String? $__typename,
  }) => _res;

  getFactors(_fn) => _res;
}

const documentNodeQueryGET_FACTORS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_FACTORS'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getFactors'),
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'type'),
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
                  name: NameNode(value: 'nonce'),
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

class Query$GET_FACTORS$getFactors {
  Query$GET_FACTORS$getFactors({
    required this.id,
    required this.name,
    required this.type,
    required this.publicKey,
    required this.nonce,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'AuthFactor',
  });

  factory Query$GET_FACTORS$getFactors.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$publicKey = json['publicKey'];
    final l$nonce = json['nonce'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_FACTORS$getFactors(
      id: (l$id as String),
      name: (l$name as String),
      type: (l$type as String),
      publicKey: (l$publicKey as String),
      nonce: (l$nonce as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String type;

  final String publicKey;

  final String nonce;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$nonce = nonce;
    _resultData['nonce'] = l$nonce;
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
    final l$name = name;
    final l$type = type;
    final l$publicKey = publicKey;
    final l$nonce = nonce;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$type,
      l$publicKey,
      l$nonce,
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
    if (other is! Query$GET_FACTORS$getFactors ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$nonce = nonce;
    final lOther$nonce = other.nonce;
    if (l$nonce != lOther$nonce) {
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

extension UtilityExtension$Query$GET_FACTORS$getFactors
    on Query$GET_FACTORS$getFactors {
  CopyWith$Query$GET_FACTORS$getFactors<Query$GET_FACTORS$getFactors>
  get copyWith => CopyWith$Query$GET_FACTORS$getFactors(this, (i) => i);
}

abstract class CopyWith$Query$GET_FACTORS$getFactors<TRes> {
  factory CopyWith$Query$GET_FACTORS$getFactors(
    Query$GET_FACTORS$getFactors instance,
    TRes Function(Query$GET_FACTORS$getFactors) then,
  ) = _CopyWithImpl$Query$GET_FACTORS$getFactors;

  factory CopyWith$Query$GET_FACTORS$getFactors.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_FACTORS$getFactors;

  TRes call({
    String? id,
    String? name,
    String? type,
    String? publicKey,
    String? nonce,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_FACTORS$getFactors<TRes>
    implements CopyWith$Query$GET_FACTORS$getFactors<TRes> {
  _CopyWithImpl$Query$GET_FACTORS$getFactors(this._instance, this._then);

  final Query$GET_FACTORS$getFactors _instance;

  final TRes Function(Query$GET_FACTORS$getFactors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? publicKey = _undefined,
    Object? nonce = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_FACTORS$getFactors(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      nonce: nonce == _undefined || nonce == null
          ? _instance.nonce
          : (nonce as String),
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

class _CopyWithStubImpl$Query$GET_FACTORS$getFactors<TRes>
    implements CopyWith$Query$GET_FACTORS$getFactors<TRes> {
  _CopyWithStubImpl$Query$GET_FACTORS$getFactors(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? type,
    String? publicKey,
    String? nonce,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
