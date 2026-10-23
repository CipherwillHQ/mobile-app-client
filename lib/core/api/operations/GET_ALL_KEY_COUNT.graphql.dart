import 'package:gql/ast.dart';

class Query$GET_ALL_KEY_COUNT {
  Query$GET_ALL_KEY_COUNT({this.getAllKeyCount, this.$__typename = 'Query'});

  factory Query$GET_ALL_KEY_COUNT.fromJson(Map<String, dynamic> json) {
    final l$getAllKeyCount = json['getAllKeyCount'];
    final l$$__typename = json['__typename'];
    return Query$GET_ALL_KEY_COUNT(
      getAllKeyCount: (l$getAllKeyCount as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_ALL_KEY_COUNT$getAllKeyCount.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_ALL_KEY_COUNT$getAllKeyCount?>? getAllKeyCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getAllKeyCount = getAllKeyCount;
    _resultData['getAllKeyCount'] = l$getAllKeyCount
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getAllKeyCount = getAllKeyCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getAllKeyCount == null
          ? null
          : Object.hashAll(l$getAllKeyCount.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_ALL_KEY_COUNT || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getAllKeyCount = getAllKeyCount;
    final lOther$getAllKeyCount = other.getAllKeyCount;
    if (l$getAllKeyCount != null && lOther$getAllKeyCount != null) {
      if (l$getAllKeyCount.length != lOther$getAllKeyCount.length) {
        return false;
      }
      for (int i = 0; i < l$getAllKeyCount.length; i++) {
        final l$getAllKeyCount$entry = l$getAllKeyCount[i];
        final lOther$getAllKeyCount$entry = lOther$getAllKeyCount[i];
        if (l$getAllKeyCount$entry != lOther$getAllKeyCount$entry) {
          return false;
        }
      }
    } else if (l$getAllKeyCount != lOther$getAllKeyCount) {
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

extension UtilityExtension$Query$GET_ALL_KEY_COUNT on Query$GET_ALL_KEY_COUNT {
  CopyWith$Query$GET_ALL_KEY_COUNT<Query$GET_ALL_KEY_COUNT> get copyWith =>
      CopyWith$Query$GET_ALL_KEY_COUNT(this, (i) => i);
}

abstract class CopyWith$Query$GET_ALL_KEY_COUNT<TRes> {
  factory CopyWith$Query$GET_ALL_KEY_COUNT(
    Query$GET_ALL_KEY_COUNT instance,
    TRes Function(Query$GET_ALL_KEY_COUNT) then,
  ) = _CopyWithImpl$Query$GET_ALL_KEY_COUNT;

  factory CopyWith$Query$GET_ALL_KEY_COUNT.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_ALL_KEY_COUNT;

  TRes call({
    List<Query$GET_ALL_KEY_COUNT$getAllKeyCount?>? getAllKeyCount,
    String? $__typename,
  });
  TRes getAllKeyCount(
    Iterable<Query$GET_ALL_KEY_COUNT$getAllKeyCount?>? Function(
      Iterable<
        CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount<
          Query$GET_ALL_KEY_COUNT$getAllKeyCount
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_ALL_KEY_COUNT<TRes>
    implements CopyWith$Query$GET_ALL_KEY_COUNT<TRes> {
  _CopyWithImpl$Query$GET_ALL_KEY_COUNT(this._instance, this._then);

  final Query$GET_ALL_KEY_COUNT _instance;

  final TRes Function(Query$GET_ALL_KEY_COUNT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getAllKeyCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_ALL_KEY_COUNT(
      getAllKeyCount: getAllKeyCount == _undefined
          ? _instance.getAllKeyCount
          : (getAllKeyCount as List<Query$GET_ALL_KEY_COUNT$getAllKeyCount?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getAllKeyCount(
    Iterable<Query$GET_ALL_KEY_COUNT$getAllKeyCount?>? Function(
      Iterable<
        CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount<
          Query$GET_ALL_KEY_COUNT$getAllKeyCount
        >?
      >?,
    )
    _fn,
  ) => call(
    getAllKeyCount: _fn(
      _instance.getAllKeyCount?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_ALL_KEY_COUNT<TRes>
    implements CopyWith$Query$GET_ALL_KEY_COUNT<TRes> {
  _CopyWithStubImpl$Query$GET_ALL_KEY_COUNT(this._res);

  TRes _res;

  call({
    List<Query$GET_ALL_KEY_COUNT$getAllKeyCount?>? getAllKeyCount,
    String? $__typename,
  }) => _res;

  getAllKeyCount(_fn) => _res;
}

const documentNodeQueryGET_ALL_KEY_COUNT = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_ALL_KEY_COUNT'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getAllKeyCount'),
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
  ],
);

class Query$GET_ALL_KEY_COUNT$getAllKeyCount {
  Query$GET_ALL_KEY_COUNT$getAllKeyCount({
    required this.publicKey,
    required this.count,
    this.$__typename = 'Count',
  });

  factory Query$GET_ALL_KEY_COUNT$getAllKeyCount.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$publicKey = json['publicKey'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$GET_ALL_KEY_COUNT$getAllKeyCount(
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
    if (other is! Query$GET_ALL_KEY_COUNT$getAllKeyCount ||
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

extension UtilityExtension$Query$GET_ALL_KEY_COUNT$getAllKeyCount
    on Query$GET_ALL_KEY_COUNT$getAllKeyCount {
  CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount<
    Query$GET_ALL_KEY_COUNT$getAllKeyCount
  >
  get copyWith =>
      CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount(this, (i) => i);
}

abstract class CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount<TRes> {
  factory CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount(
    Query$GET_ALL_KEY_COUNT$getAllKeyCount instance,
    TRes Function(Query$GET_ALL_KEY_COUNT$getAllKeyCount) then,
  ) = _CopyWithImpl$Query$GET_ALL_KEY_COUNT$getAllKeyCount;

  factory CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_ALL_KEY_COUNT$getAllKeyCount;

  TRes call({String? publicKey, int? count, String? $__typename});
}

class _CopyWithImpl$Query$GET_ALL_KEY_COUNT$getAllKeyCount<TRes>
    implements CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount<TRes> {
  _CopyWithImpl$Query$GET_ALL_KEY_COUNT$getAllKeyCount(
    this._instance,
    this._then,
  );

  final Query$GET_ALL_KEY_COUNT$getAllKeyCount _instance;

  final TRes Function(Query$GET_ALL_KEY_COUNT$getAllKeyCount) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? publicKey = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_ALL_KEY_COUNT$getAllKeyCount(
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

class _CopyWithStubImpl$Query$GET_ALL_KEY_COUNT$getAllKeyCount<TRes>
    implements CopyWith$Query$GET_ALL_KEY_COUNT$getAllKeyCount<TRes> {
  _CopyWithStubImpl$Query$GET_ALL_KEY_COUNT$getAllKeyCount(this._res);

  TRes _res;

  call({String? publicKey, int? count, String? $__typename}) => _res;
}
