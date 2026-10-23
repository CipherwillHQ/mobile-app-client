import 'package:gql/ast.dart';

class Variables$Query$GET_MY_KEY_COUNT {
  factory Variables$Query$GET_MY_KEY_COUNT({bool? exclude_files}) =>
      Variables$Query$GET_MY_KEY_COUNT._({
        if (exclude_files != null) r'exclude_files': exclude_files,
      });

  Variables$Query$GET_MY_KEY_COUNT._(this._$data);

  factory Variables$Query$GET_MY_KEY_COUNT.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('exclude_files')) {
      final l$exclude_files = data['exclude_files'];
      result$data['exclude_files'] = (l$exclude_files as bool?);
    }
    return Variables$Query$GET_MY_KEY_COUNT._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get exclude_files => (_$data['exclude_files'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('exclude_files')) {
      final l$exclude_files = exclude_files;
      result$data['exclude_files'] = l$exclude_files;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GET_MY_KEY_COUNT<Variables$Query$GET_MY_KEY_COUNT>
  get copyWith => CopyWith$Variables$Query$GET_MY_KEY_COUNT(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_MY_KEY_COUNT ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$exclude_files = exclude_files;
    final lOther$exclude_files = other.exclude_files;
    if (_$data.containsKey('exclude_files') !=
        other._$data.containsKey('exclude_files')) {
      return false;
    }
    if (l$exclude_files != lOther$exclude_files) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$exclude_files = exclude_files;
    return Object.hashAll([
      _$data.containsKey('exclude_files') ? l$exclude_files : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GET_MY_KEY_COUNT<TRes> {
  factory CopyWith$Variables$Query$GET_MY_KEY_COUNT(
    Variables$Query$GET_MY_KEY_COUNT instance,
    TRes Function(Variables$Query$GET_MY_KEY_COUNT) then,
  ) = _CopyWithImpl$Variables$Query$GET_MY_KEY_COUNT;

  factory CopyWith$Variables$Query$GET_MY_KEY_COUNT.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_MY_KEY_COUNT;

  TRes call({bool? exclude_files});
}

class _CopyWithImpl$Variables$Query$GET_MY_KEY_COUNT<TRes>
    implements CopyWith$Variables$Query$GET_MY_KEY_COUNT<TRes> {
  _CopyWithImpl$Variables$Query$GET_MY_KEY_COUNT(this._instance, this._then);

  final Variables$Query$GET_MY_KEY_COUNT _instance;

  final TRes Function(Variables$Query$GET_MY_KEY_COUNT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? exclude_files = _undefined}) => _then(
    Variables$Query$GET_MY_KEY_COUNT._({
      ..._instance._$data,
      if (exclude_files != _undefined)
        'exclude_files': (exclude_files as bool?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_MY_KEY_COUNT<TRes>
    implements CopyWith$Variables$Query$GET_MY_KEY_COUNT<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_MY_KEY_COUNT(this._res);

  TRes _res;

  call({bool? exclude_files}) => _res;
}

class Query$GET_MY_KEY_COUNT {
  Query$GET_MY_KEY_COUNT({this.getMyKeyCount, this.$__typename = 'Query'});

  factory Query$GET_MY_KEY_COUNT.fromJson(Map<String, dynamic> json) {
    final l$getMyKeyCount = json['getMyKeyCount'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_KEY_COUNT(
      getMyKeyCount: (l$getMyKeyCount as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_MY_KEY_COUNT$getMyKeyCount.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_MY_KEY_COUNT$getMyKeyCount?>? getMyKeyCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMyKeyCount = getMyKeyCount;
    _resultData['getMyKeyCount'] = l$getMyKeyCount
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMyKeyCount = getMyKeyCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMyKeyCount == null
          ? null
          : Object.hashAll(l$getMyKeyCount.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_MY_KEY_COUNT || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMyKeyCount = getMyKeyCount;
    final lOther$getMyKeyCount = other.getMyKeyCount;
    if (l$getMyKeyCount != null && lOther$getMyKeyCount != null) {
      if (l$getMyKeyCount.length != lOther$getMyKeyCount.length) {
        return false;
      }
      for (int i = 0; i < l$getMyKeyCount.length; i++) {
        final l$getMyKeyCount$entry = l$getMyKeyCount[i];
        final lOther$getMyKeyCount$entry = lOther$getMyKeyCount[i];
        if (l$getMyKeyCount$entry != lOther$getMyKeyCount$entry) {
          return false;
        }
      }
    } else if (l$getMyKeyCount != lOther$getMyKeyCount) {
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

extension UtilityExtension$Query$GET_MY_KEY_COUNT on Query$GET_MY_KEY_COUNT {
  CopyWith$Query$GET_MY_KEY_COUNT<Query$GET_MY_KEY_COUNT> get copyWith =>
      CopyWith$Query$GET_MY_KEY_COUNT(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_KEY_COUNT<TRes> {
  factory CopyWith$Query$GET_MY_KEY_COUNT(
    Query$GET_MY_KEY_COUNT instance,
    TRes Function(Query$GET_MY_KEY_COUNT) then,
  ) = _CopyWithImpl$Query$GET_MY_KEY_COUNT;

  factory CopyWith$Query$GET_MY_KEY_COUNT.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_KEY_COUNT;

  TRes call({
    List<Query$GET_MY_KEY_COUNT$getMyKeyCount?>? getMyKeyCount,
    String? $__typename,
  });
  TRes getMyKeyCount(
    Iterable<Query$GET_MY_KEY_COUNT$getMyKeyCount?>? Function(
      Iterable<
        CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount<
          Query$GET_MY_KEY_COUNT$getMyKeyCount
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_MY_KEY_COUNT<TRes>
    implements CopyWith$Query$GET_MY_KEY_COUNT<TRes> {
  _CopyWithImpl$Query$GET_MY_KEY_COUNT(this._instance, this._then);

  final Query$GET_MY_KEY_COUNT _instance;

  final TRes Function(Query$GET_MY_KEY_COUNT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMyKeyCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_KEY_COUNT(
      getMyKeyCount: getMyKeyCount == _undefined
          ? _instance.getMyKeyCount
          : (getMyKeyCount as List<Query$GET_MY_KEY_COUNT$getMyKeyCount?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getMyKeyCount(
    Iterable<Query$GET_MY_KEY_COUNT$getMyKeyCount?>? Function(
      Iterable<
        CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount<
          Query$GET_MY_KEY_COUNT$getMyKeyCount
        >?
      >?,
    )
    _fn,
  ) => call(
    getMyKeyCount: _fn(
      _instance.getMyKeyCount?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_MY_KEY_COUNT<TRes>
    implements CopyWith$Query$GET_MY_KEY_COUNT<TRes> {
  _CopyWithStubImpl$Query$GET_MY_KEY_COUNT(this._res);

  TRes _res;

  call({
    List<Query$GET_MY_KEY_COUNT$getMyKeyCount?>? getMyKeyCount,
    String? $__typename,
  }) => _res;

  getMyKeyCount(_fn) => _res;
}

const documentNodeQueryGET_MY_KEY_COUNT = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_MY_KEY_COUNT'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'exclude_files')),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
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
            name: NameNode(value: 'getMyKeyCount'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'exclude_files'),
                value: VariableNode(name: NameNode(value: 'exclude_files')),
              ),
            ],
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
  ],
);

class Query$GET_MY_KEY_COUNT$getMyKeyCount {
  Query$GET_MY_KEY_COUNT$getMyKeyCount({
    required this.publicKey,
    required this.count,
    this.$__typename = 'Count',
  });

  factory Query$GET_MY_KEY_COUNT$getMyKeyCount.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$publicKey = json['publicKey'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_KEY_COUNT$getMyKeyCount(
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
    if (other is! Query$GET_MY_KEY_COUNT$getMyKeyCount ||
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

extension UtilityExtension$Query$GET_MY_KEY_COUNT$getMyKeyCount
    on Query$GET_MY_KEY_COUNT$getMyKeyCount {
  CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount<
    Query$GET_MY_KEY_COUNT$getMyKeyCount
  >
  get copyWith => CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount<TRes> {
  factory CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount(
    Query$GET_MY_KEY_COUNT$getMyKeyCount instance,
    TRes Function(Query$GET_MY_KEY_COUNT$getMyKeyCount) then,
  ) = _CopyWithImpl$Query$GET_MY_KEY_COUNT$getMyKeyCount;

  factory CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_KEY_COUNT$getMyKeyCount;

  TRes call({String? publicKey, int? count, String? $__typename});
}

class _CopyWithImpl$Query$GET_MY_KEY_COUNT$getMyKeyCount<TRes>
    implements CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount<TRes> {
  _CopyWithImpl$Query$GET_MY_KEY_COUNT$getMyKeyCount(
    this._instance,
    this._then,
  );

  final Query$GET_MY_KEY_COUNT$getMyKeyCount _instance;

  final TRes Function(Query$GET_MY_KEY_COUNT$getMyKeyCount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? publicKey = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_KEY_COUNT$getMyKeyCount(
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

class _CopyWithStubImpl$Query$GET_MY_KEY_COUNT$getMyKeyCount<TRes>
    implements CopyWith$Query$GET_MY_KEY_COUNT$getMyKeyCount<TRes> {
  _CopyWithStubImpl$Query$GET_MY_KEY_COUNT$getMyKeyCount(this._res);

  TRes _res;

  call({String? publicKey, int? count, String? $__typename}) => _res;
}
