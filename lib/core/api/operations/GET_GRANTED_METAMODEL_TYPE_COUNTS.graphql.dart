import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS {
  factory Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS({
    required String access_id,
  }) => Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS._({
    r'access_id': access_id,
  });

  Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS._(this._$data);

  factory Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    return Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS._(result$data);
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<
    Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS
  >
  get copyWith => CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
    this,
    (i) => i,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$access_id = access_id;
    return Object.hashAll([l$access_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<
  TRes
> {
  factory CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
    Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS instance,
    TRes Function(Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS) then,
  ) = _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS;

  factory CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS;

  TRes call({String? access_id});
}

class _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes>
    implements
        CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes> {
  _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS _instance;

  final TRes Function(Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? access_id = _undefined}) => _then(
    Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS._({
      ..._instance._$data,
      if (access_id != _undefined && access_id != null)
        'access_id': (access_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes>
    implements
        CopyWith$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
    this._res,
  );

  TRes _res;

  call({String? access_id}) => _res;
}

class Query$GET_GRANTED_METAMODEL_TYPE_COUNTS {
  Query$GET_GRANTED_METAMODEL_TYPE_COUNTS({
    required this.getGrantedMetamodelTypeCounts,
    this.$__typename = 'Query',
  });

  factory Query$GET_GRANTED_METAMODEL_TYPE_COUNTS.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getGrantedMetamodelTypeCounts =
        json['getGrantedMetamodelTypeCounts'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
      getGrantedMetamodelTypeCounts:
          (l$getGrantedMetamodelTypeCounts as List<dynamic>)
              .map(
                (e) =>
                    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts.fromJson(
                      (e as Map<String, dynamic>),
                    ),
              )
              .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
  >
  getGrantedMetamodelTypeCounts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getGrantedMetamodelTypeCounts = getGrantedMetamodelTypeCounts;
    _resultData['getGrantedMetamodelTypeCounts'] =
        l$getGrantedMetamodelTypeCounts.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getGrantedMetamodelTypeCounts = getGrantedMetamodelTypeCounts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getGrantedMetamodelTypeCounts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_METAMODEL_TYPE_COUNTS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getGrantedMetamodelTypeCounts = getGrantedMetamodelTypeCounts;
    final lOther$getGrantedMetamodelTypeCounts =
        other.getGrantedMetamodelTypeCounts;
    if (l$getGrantedMetamodelTypeCounts.length !=
        lOther$getGrantedMetamodelTypeCounts.length) {
      return false;
    }
    for (int i = 0; i < l$getGrantedMetamodelTypeCounts.length; i++) {
      final l$getGrantedMetamodelTypeCounts$entry =
          l$getGrantedMetamodelTypeCounts[i];
      final lOther$getGrantedMetamodelTypeCounts$entry =
          lOther$getGrantedMetamodelTypeCounts[i];
      if (l$getGrantedMetamodelTypeCounts$entry !=
          lOther$getGrantedMetamodelTypeCounts$entry) {
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

extension UtilityExtension$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS
    on Query$GET_GRANTED_METAMODEL_TYPE_COUNTS {
  CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(this, (i) => i);
}

abstract class CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes> {
  factory CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS instance,
    TRes Function(Query$GET_GRANTED_METAMODEL_TYPE_COUNTS) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS;

  factory CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS;

  TRes call({
    List<Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts>?
    getGrantedMetamodelTypeCounts,
    String? $__typename,
  });
  TRes getGrantedMetamodelTypeCounts(
    Iterable<
      Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
    >
    Function(
      Iterable<
        CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
          Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_METAMODEL_TYPE_COUNTS _instance;

  final TRes Function(Query$GET_GRANTED_METAMODEL_TYPE_COUNTS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getGrantedMetamodelTypeCounts = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(
      getGrantedMetamodelTypeCounts:
          getGrantedMetamodelTypeCounts == _undefined ||
              getGrantedMetamodelTypeCounts == null
          ? _instance.getGrantedMetamodelTypeCounts
          : (getGrantedMetamodelTypeCounts
                as List<
                  Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getGrantedMetamodelTypeCounts(
    Iterable<
      Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
    >
    Function(
      Iterable<
        CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
          Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
        >
      >,
    )
    _fn,
  ) => call(
    getGrantedMetamodelTypeCounts: _fn(
      _instance.getGrantedMetamodelTypeCounts.map(
        (e) =>
            CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS(this._res);

  TRes _res;

  call({
    List<Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts>?
    getGrantedMetamodelTypeCounts,
    String? $__typename,
  }) => _res;

  getGrantedMetamodelTypeCounts(_fn) => _res;
}

const documentNodeQueryGET_GRANTED_METAMODEL_TYPE_COUNTS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_GRANTED_METAMODEL_TYPE_COUNTS'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getGrantedMetamodelTypeCounts'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
              ),
            ],
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

class Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts {
  Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts({
    required this.type,
    required this.count,
    this.$__typename = 'MetamodelTypeCount',
  });

  factory Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$type = json['type'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
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
    if (other
            is! Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts ||
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

extension UtilityExtension$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
    on Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts {
  CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
  TRes
> {
  factory CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
    instance,
    TRes Function(
      Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts,
    )
    then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts;

  factory CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts;

  TRes call({Enum$MetamodelType? type, int? count, String? $__typename});
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
          TRes
        > {
  _CopyWithImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts
  _instance;

  final TRes Function(
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
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

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL_TYPE_COUNTS$getGrantedMetamodelTypeCounts(
    this._res,
  );

  TRes _res;

  call({Enum$MetamodelType? type, int? count, String? $__typename}) => _res;
}
