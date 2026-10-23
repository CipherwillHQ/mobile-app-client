import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Query$GET_METAMODEL_TYPE_COUNTS {
  Query$GET_METAMODEL_TYPE_COUNTS({
    required this.getMetamodelTypeCounts,
    this.$__typename = 'Query',
  });

  factory Query$GET_METAMODEL_TYPE_COUNTS.fromJson(Map<String, dynamic> json) {
    final l$getMetamodelTypeCounts = json['getMetamodelTypeCounts'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODEL_TYPE_COUNTS(
      getMetamodelTypeCounts: (l$getMetamodelTypeCounts as List<dynamic>)
          .map(
            (e) =>
                Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts>
  getMetamodelTypeCounts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMetamodelTypeCounts = getMetamodelTypeCounts;
    _resultData['getMetamodelTypeCounts'] = l$getMetamodelTypeCounts
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMetamodelTypeCounts = getMetamodelTypeCounts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getMetamodelTypeCounts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_METAMODEL_TYPE_COUNTS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMetamodelTypeCounts = getMetamodelTypeCounts;
    final lOther$getMetamodelTypeCounts = other.getMetamodelTypeCounts;
    if (l$getMetamodelTypeCounts.length !=
        lOther$getMetamodelTypeCounts.length) {
      return false;
    }
    for (int i = 0; i < l$getMetamodelTypeCounts.length; i++) {
      final l$getMetamodelTypeCounts$entry = l$getMetamodelTypeCounts[i];
      final lOther$getMetamodelTypeCounts$entry =
          lOther$getMetamodelTypeCounts[i];
      if (l$getMetamodelTypeCounts$entry !=
          lOther$getMetamodelTypeCounts$entry) {
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

extension UtilityExtension$Query$GET_METAMODEL_TYPE_COUNTS
    on Query$GET_METAMODEL_TYPE_COUNTS {
  CopyWith$Query$GET_METAMODEL_TYPE_COUNTS<Query$GET_METAMODEL_TYPE_COUNTS>
  get copyWith => CopyWith$Query$GET_METAMODEL_TYPE_COUNTS(this, (i) => i);
}

abstract class CopyWith$Query$GET_METAMODEL_TYPE_COUNTS<TRes> {
  factory CopyWith$Query$GET_METAMODEL_TYPE_COUNTS(
    Query$GET_METAMODEL_TYPE_COUNTS instance,
    TRes Function(Query$GET_METAMODEL_TYPE_COUNTS) then,
  ) = _CopyWithImpl$Query$GET_METAMODEL_TYPE_COUNTS;

  factory CopyWith$Query$GET_METAMODEL_TYPE_COUNTS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_METAMODEL_TYPE_COUNTS;

  TRes call({
    List<Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts>?
    getMetamodelTypeCounts,
    String? $__typename,
  });
  TRes getMetamodelTypeCounts(
    Iterable<Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts> Function(
      Iterable<
        CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<
          Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_METAMODEL_TYPE_COUNTS<TRes>
    implements CopyWith$Query$GET_METAMODEL_TYPE_COUNTS<TRes> {
  _CopyWithImpl$Query$GET_METAMODEL_TYPE_COUNTS(this._instance, this._then);

  final Query$GET_METAMODEL_TYPE_COUNTS _instance;

  final TRes Function(Query$GET_METAMODEL_TYPE_COUNTS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMetamodelTypeCounts = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_METAMODEL_TYPE_COUNTS(
      getMetamodelTypeCounts:
          getMetamodelTypeCounts == _undefined || getMetamodelTypeCounts == null
          ? _instance.getMetamodelTypeCounts
          : (getMetamodelTypeCounts
                as List<
                  Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getMetamodelTypeCounts(
    Iterable<Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts> Function(
      Iterable<
        CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<
          Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts
        >
      >,
    )
    _fn,
  ) => call(
    getMetamodelTypeCounts: _fn(
      _instance.getMetamodelTypeCounts.map(
        (e) => CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_METAMODEL_TYPE_COUNTS<TRes>
    implements CopyWith$Query$GET_METAMODEL_TYPE_COUNTS<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODEL_TYPE_COUNTS(this._res);

  TRes _res;

  call({
    List<Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts>?
    getMetamodelTypeCounts,
    String? $__typename,
  }) => _res;

  getMetamodelTypeCounts(_fn) => _res;
}

const documentNodeQueryGET_METAMODEL_TYPE_COUNTS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_METAMODEL_TYPE_COUNTS'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getMetamodelTypeCounts'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'type'),
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

class Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts {
  Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts({
    required this.type,
    required this.count,
    this.$__typename = 'MetamodelTypeCount',
  });

  factory Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$type = json['type'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
      type: fromJson$Enum$MetamodelType((l$type as String)),
      count: (l$count as int),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$MetamodelType type;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$MetamodelType(l$type);
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([l$type, l$count, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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

extension UtilityExtension$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts
    on Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts {
  CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<
    Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts
  >
  get copyWith =>
      CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<
  TRes
> {
  factory CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
    Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts instance,
    TRes Function(Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts) then,
  ) = _CopyWithImpl$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts;

  factory CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts;

  TRes call({Enum$MetamodelType? type, int? count, String? $__typename});
}

class _CopyWithImpl$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<TRes>
    implements
        CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<TRes> {
  _CopyWithImpl$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
    this._instance,
    this._then,
  );

  final Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts _instance;

  final TRes Function(Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MetamodelType),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<
  TRes
>
    implements
        CopyWith$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODEL_TYPE_COUNTS$getMetamodelTypeCounts(
    this._res,
  );

  TRes _res;

  call({Enum$MetamodelType? type, int? count, String? $__typename}) => _res;
}
