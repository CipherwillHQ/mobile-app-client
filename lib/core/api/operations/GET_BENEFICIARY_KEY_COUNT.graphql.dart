import 'package:gql/ast.dart';

class Query$GET_BENEFICIARY_KEY_COUNT {
  Query$GET_BENEFICIARY_KEY_COUNT({
    this.getBeneficiaryKeyCount,
    this.$__typename = 'Query',
  });

  factory Query$GET_BENEFICIARY_KEY_COUNT.fromJson(Map<String, dynamic> json) {
    final l$getBeneficiaryKeyCount = json['getBeneficiaryKeyCount'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_KEY_COUNT(
      getBeneficiaryKeyCount: (l$getBeneficiaryKeyCount as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount?>?
  getBeneficiaryKeyCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getBeneficiaryKeyCount = getBeneficiaryKeyCount;
    _resultData['getBeneficiaryKeyCount'] = l$getBeneficiaryKeyCount
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getBeneficiaryKeyCount = getBeneficiaryKeyCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getBeneficiaryKeyCount == null
          ? null
          : Object.hashAll(l$getBeneficiaryKeyCount.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_BENEFICIARY_KEY_COUNT ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getBeneficiaryKeyCount = getBeneficiaryKeyCount;
    final lOther$getBeneficiaryKeyCount = other.getBeneficiaryKeyCount;
    if (l$getBeneficiaryKeyCount != null &&
        lOther$getBeneficiaryKeyCount != null) {
      if (l$getBeneficiaryKeyCount.length !=
          lOther$getBeneficiaryKeyCount.length) {
        return false;
      }
      for (int i = 0; i < l$getBeneficiaryKeyCount.length; i++) {
        final l$getBeneficiaryKeyCount$entry = l$getBeneficiaryKeyCount[i];
        final lOther$getBeneficiaryKeyCount$entry =
            lOther$getBeneficiaryKeyCount[i];
        if (l$getBeneficiaryKeyCount$entry !=
            lOther$getBeneficiaryKeyCount$entry) {
          return false;
        }
      }
    } else if (l$getBeneficiaryKeyCount != lOther$getBeneficiaryKeyCount) {
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

extension UtilityExtension$Query$GET_BENEFICIARY_KEY_COUNT
    on Query$GET_BENEFICIARY_KEY_COUNT {
  CopyWith$Query$GET_BENEFICIARY_KEY_COUNT<Query$GET_BENEFICIARY_KEY_COUNT>
  get copyWith => CopyWith$Query$GET_BENEFICIARY_KEY_COUNT(this, (i) => i);
}

abstract class CopyWith$Query$GET_BENEFICIARY_KEY_COUNT<TRes> {
  factory CopyWith$Query$GET_BENEFICIARY_KEY_COUNT(
    Query$GET_BENEFICIARY_KEY_COUNT instance,
    TRes Function(Query$GET_BENEFICIARY_KEY_COUNT) then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT;

  factory CopyWith$Query$GET_BENEFICIARY_KEY_COUNT.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT;

  TRes call({
    List<Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount?>?
    getBeneficiaryKeyCount,
    String? $__typename,
  });
  TRes getBeneficiaryKeyCount(
    Iterable<Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount?>? Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<
          Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT<TRes>
    implements CopyWith$Query$GET_BENEFICIARY_KEY_COUNT<TRes> {
  _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT(this._instance, this._then);

  final Query$GET_BENEFICIARY_KEY_COUNT _instance;

  final TRes Function(Query$GET_BENEFICIARY_KEY_COUNT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getBeneficiaryKeyCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_KEY_COUNT(
      getBeneficiaryKeyCount: getBeneficiaryKeyCount == _undefined
          ? _instance.getBeneficiaryKeyCount
          : (getBeneficiaryKeyCount
                as List<
                  Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount?
                >?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getBeneficiaryKeyCount(
    Iterable<Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount?>? Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<
          Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount
        >?
      >?,
    )
    _fn,
  ) => call(
    getBeneficiaryKeyCount: _fn(
      _instance.getBeneficiaryKeyCount?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT<TRes>
    implements CopyWith$Query$GET_BENEFICIARY_KEY_COUNT<TRes> {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT(this._res);

  TRes _res;

  call({
    List<Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount?>?
    getBeneficiaryKeyCount,
    String? $__typename,
  }) => _res;

  getBeneficiaryKeyCount(_fn) => _res;
}

const documentNodeQueryGET_BENEFICIARY_KEY_COUNT = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_BENEFICIARY_KEY_COUNT'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getBeneficiaryKeyCount'),
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
                  name: NameNode(value: 'factor_wise_count'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'publicKey'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'count'),
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

class Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount {
  Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount({
    required this.beneficiary_id,
    this.factor_wise_count,
    this.$__typename = 'BeneficiaryCount',
  });

  factory Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$beneficiary_id = json['beneficiary_id'];
    final l$factor_wise_count = json['factor_wise_count'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
      beneficiary_id: (l$beneficiary_id as String),
      factor_wise_count: (l$factor_wise_count as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String beneficiary_id;

  final List<
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count?
  >?
  factor_wise_count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$beneficiary_id = beneficiary_id;
    _resultData['beneficiary_id'] = l$beneficiary_id;
    final l$factor_wise_count = factor_wise_count;
    _resultData['factor_wise_count'] = l$factor_wise_count
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$beneficiary_id = beneficiary_id;
    final l$factor_wise_count = factor_wise_count;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$beneficiary_id,
      l$factor_wise_count == null
          ? null
          : Object.hashAll(l$factor_wise_count.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (l$beneficiary_id != lOther$beneficiary_id) {
      return false;
    }
    final l$factor_wise_count = factor_wise_count;
    final lOther$factor_wise_count = other.factor_wise_count;
    if (l$factor_wise_count != null && lOther$factor_wise_count != null) {
      if (l$factor_wise_count.length != lOther$factor_wise_count.length) {
        return false;
      }
      for (int i = 0; i < l$factor_wise_count.length; i++) {
        final l$factor_wise_count$entry = l$factor_wise_count[i];
        final lOther$factor_wise_count$entry = lOther$factor_wise_count[i];
        if (l$factor_wise_count$entry != lOther$factor_wise_count$entry) {
          return false;
        }
      }
    } else if (l$factor_wise_count != lOther$factor_wise_count) {
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

extension UtilityExtension$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount
    on Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount {
  CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount
  >
  get copyWith =>
      CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<
  TRes
> {
  factory CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount instance,
    TRes Function(Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount) then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount;

  factory CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount;

  TRes call({
    String? beneficiary_id,
    List<
      Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count?
    >?
    factor_wise_count,
    String? $__typename,
  });
  TRes factor_wise_count(
    Iterable<
      Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count?
    >?
    Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
          Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<TRes>
    implements
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<TRes> {
  _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
    this._instance,
    this._then,
  );

  final Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount _instance;

  final TRes Function(Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? beneficiary_id = _undefined,
    Object? factor_wise_count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
      beneficiary_id: beneficiary_id == _undefined || beneficiary_id == null
          ? _instance.beneficiary_id
          : (beneficiary_id as String),
      factor_wise_count: factor_wise_count == _undefined
          ? _instance.factor_wise_count
          : (factor_wise_count
                as List<
                  Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count?
                >?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes factor_wise_count(
    Iterable<
      Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count?
    >?
    Function(
      Iterable<
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
          Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count
        >?
      >?,
    )
    _fn,
  ) => call(
    factor_wise_count: _fn(
      _instance.factor_wise_count?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<
  TRes
>
    implements
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount<TRes> {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount(
    this._res,
  );

  TRes _res;

  call({
    String? beneficiary_id,
    List<
      Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count?
    >?
    factor_wise_count,
    String? $__typename,
  }) => _res;

  factor_wise_count(_fn) => _res;
}

class Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count {
  Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count({
    required this.publicKey,
    required this.count,
    this.$__typename = 'Count',
  });

  factory Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$publicKey = json['publicKey'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
      publicKey: (l$publicKey as String),
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String publicKey;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$publicKey = publicKey;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$publicKey, l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count
    on Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count {
  CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count
  >
  get copyWith =>
      CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
  TRes
> {
  factory CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count
    instance,
    TRes Function(
      Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count,
    )
    then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count;

  factory CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count;

  TRes call({String? publicKey, int? count, String? $__typename});
}

class _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
  TRes
>
    implements
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
          TRes
        > {
  _CopyWithImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
    this._instance,
    this._then,
  );

  final Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count
  _instance;

  final TRes Function(
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? publicKey = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
  TRes
>
    implements
        CopyWith$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_KEY_COUNT$getBeneficiaryKeyCount$factor_wise_count(
    this._res,
  );

  TRes _res;

  call({String? publicKey, int? count, String? $__typename}) => _res;
}
