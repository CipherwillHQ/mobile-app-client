import 'package:gql/ast.dart';

class Query$GET_BENEFICIARY_FACTORS {
  Query$GET_BENEFICIARY_FACTORS({
    this.getBeneficiaryFactors,
    this.$__typename = 'Query',
  });

  factory Query$GET_BENEFICIARY_FACTORS.fromJson(Map<String, dynamic> json) {
    final l$getBeneficiaryFactors = json['getBeneficiaryFactors'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_FACTORS(
      getBeneficiaryFactors: (l$getBeneficiaryFactors as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors?>?
  getBeneficiaryFactors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getBeneficiaryFactors = getBeneficiaryFactors;
    _resultData['getBeneficiaryFactors'] = l$getBeneficiaryFactors
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getBeneficiaryFactors = getBeneficiaryFactors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getBeneficiaryFactors == null
          ? null
          : Object.hashAll(l$getBeneficiaryFactors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_BENEFICIARY_FACTORS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getBeneficiaryFactors = getBeneficiaryFactors;
    final lOther$getBeneficiaryFactors = other.getBeneficiaryFactors;
    if (l$getBeneficiaryFactors != null &&
        lOther$getBeneficiaryFactors != null) {
      if (l$getBeneficiaryFactors.length !=
          lOther$getBeneficiaryFactors.length) {
        return false;
      }
      for (int i = 0; i < l$getBeneficiaryFactors.length; i++) {
        final l$getBeneficiaryFactors$entry = l$getBeneficiaryFactors[i];
        final lOther$getBeneficiaryFactors$entry =
            lOther$getBeneficiaryFactors[i];
        if (l$getBeneficiaryFactors$entry !=
            lOther$getBeneficiaryFactors$entry) {
          return false;
        }
      }
    } else if (l$getBeneficiaryFactors != lOther$getBeneficiaryFactors) {
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

extension UtilityExtension$Query$GET_BENEFICIARY_FACTORS
    on Query$GET_BENEFICIARY_FACTORS {
  CopyWith$Query$GET_BENEFICIARY_FACTORS<Query$GET_BENEFICIARY_FACTORS>
  get copyWith => CopyWith$Query$GET_BENEFICIARY_FACTORS(this, (i) => i);
}

abstract class CopyWith$Query$GET_BENEFICIARY_FACTORS<TRes> {
  factory CopyWith$Query$GET_BENEFICIARY_FACTORS(
    Query$GET_BENEFICIARY_FACTORS instance,
    TRes Function(Query$GET_BENEFICIARY_FACTORS) then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS;

  factory CopyWith$Query$GET_BENEFICIARY_FACTORS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS;

  TRes call({
    List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors?>?
    getBeneficiaryFactors,
    String? $__typename,
  });
  TRes getBeneficiaryFactors(
    Iterable<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors?>? Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<
          Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS<TRes>
    implements CopyWith$Query$GET_BENEFICIARY_FACTORS<TRes> {
  _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS(this._instance, this._then);

  final Query$GET_BENEFICIARY_FACTORS _instance;

  final TRes Function(Query$GET_BENEFICIARY_FACTORS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getBeneficiaryFactors = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_FACTORS(
      getBeneficiaryFactors: getBeneficiaryFactors == _undefined
          ? _instance.getBeneficiaryFactors
          : (getBeneficiaryFactors
                as List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getBeneficiaryFactors(
    Iterable<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors?>? Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<
          Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors
        >?
      >?,
    )
    _fn,
  ) => call(
    getBeneficiaryFactors: _fn(
      _instance.getBeneficiaryFactors?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS<TRes>
    implements CopyWith$Query$GET_BENEFICIARY_FACTORS<TRes> {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS(this._res);

  TRes _res;

  call({
    List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors?>?
    getBeneficiaryFactors,
    String? $__typename,
  }) => _res;

  getBeneficiaryFactors(_fn) => _res;
}

const documentNodeQueryGET_BENEFICIARY_FACTORS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_BENEFICIARY_FACTORS'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getBeneficiaryFactors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'beneficiary_id'),
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
                  name: NameNode(value: 'factors'),
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

class Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors {
  Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors({
    required this.beneficiary_id,
    required this.publicKey,
    this.factors,
    this.$__typename = 'BeneficiaryFactorsList',
  });

  factory Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$beneficiary_id = json['beneficiary_id'];
    final l$publicKey = json['publicKey'];
    final l$factors = json['factors'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
      beneficiary_id: (l$beneficiary_id as String),
      publicKey: (l$publicKey as String),
      factors: (l$factors as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String beneficiary_id;

  final String publicKey;

  final List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors?>?
  factors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$beneficiary_id = beneficiary_id;
    _resultData['beneficiary_id'] = l$beneficiary_id;
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$factors = factors;
    _resultData['factors'] = l$factors?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$beneficiary_id = beneficiary_id;
    final l$publicKey = publicKey;
    final l$factors = factors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$beneficiary_id,
      l$publicKey,
      l$factors == null ? null : Object.hashAll(l$factors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (l$beneficiary_id != lOther$beneficiary_id) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$factors = factors;
    final lOther$factors = other.factors;
    if (l$factors != null && lOther$factors != null) {
      if (l$factors.length != lOther$factors.length) {
        return false;
      }
      for (int i = 0; i < l$factors.length; i++) {
        final l$factors$entry = l$factors[i];
        final lOther$factors$entry = lOther$factors[i];
        if (l$factors$entry != lOther$factors$entry) {
          return false;
        }
      }
    } else if (l$factors != lOther$factors) {
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

extension UtilityExtension$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors
    on Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors {
  CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors
  >
  get copyWith => CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<
  TRes
> {
  factory CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors instance,
    TRes Function(Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors) then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors;

  factory CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors;

  TRes call({
    String? beneficiary_id,
    String? publicKey,
    List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors?>? factors,
    String? $__typename,
  });
  TRes factors(
    Iterable<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors?>?
    Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
          Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<TRes>
    implements
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<TRes> {
  _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
    this._instance,
    this._then,
  );

  final Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors _instance;

  final TRes Function(Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? beneficiary_id = _undefined,
    Object? publicKey = _undefined,
    Object? factors = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
      beneficiary_id: beneficiary_id == _undefined || beneficiary_id == null
          ? _instance.beneficiary_id
          : (beneficiary_id as String),
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      factors: factors == _undefined
          ? _instance.factors
          : (factors
                as List<
                  Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors?
                >?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes factors(
    Iterable<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors?>?
    Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
          Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors
        >?
      >?,
    )
    _fn,
  ) => call(
    factors: _fn(
      _instance.factors?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<
  TRes
>
    implements
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors<TRes> {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors(
    this._res,
  );

  TRes _res;

  call({
    String? beneficiary_id,
    String? publicKey,
    List<Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors?>? factors,
    String? $__typename,
  }) => _res;

  factors(_fn) => _res;
}

class Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors {
  Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors({
    required this.id,
    required this.name,
    required this.type,
    required this.publicKey,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'AuthFactor',
  });

  factory Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$publicKey = json['publicKey'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
      id: (l$id as String),
      name: (l$name as String),
      type: (l$type as String),
      publicKey: (l$publicKey as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String type;

  final String publicKey;

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
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$type,
      l$publicKey,
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
    if (other is! Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors ||
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

extension UtilityExtension$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors
    on Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors {
  CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors
  >
  get copyWith =>
      CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
  TRes
> {
  factory CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors instance,
    TRes Function(Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors)
    then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors;

  factory CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors;

  TRes call({
    String? id,
    String? name,
    String? type,
    String? publicKey,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
  TRes
>
    implements
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
          TRes
        > {
  _CopyWithImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
    this._instance,
    this._then,
  );

  final Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors _instance;

  final TRes Function(
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? publicKey = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
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

class _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
  TRes
>
    implements
        CopyWith$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_FACTORS$getBeneficiaryFactors$factors(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    String? type,
    String? publicKey,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
