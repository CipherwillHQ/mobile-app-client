import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GET_GRANTED_METAMODELS {
  factory Variables$Query$GET_GRANTED_METAMODELS({
    required String access_id,
    Enum$MetamodelType? type,
    String? cursor,
    String? folder_id,
  }) => Variables$Query$GET_GRANTED_METAMODELS._({
    r'access_id': access_id,
    if (type != null) r'type': type,
    if (cursor != null) r'cursor': cursor,
    if (folder_id != null) r'folder_id': folder_id,
  });

  Variables$Query$GET_GRANTED_METAMODELS._(this._$data);

  factory Variables$Query$GET_GRANTED_METAMODELS.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : fromJson$Enum$MetamodelType((l$type as String));
    }
    if (data.containsKey('cursor')) {
      final l$cursor = data['cursor'];
      result$data['cursor'] = (l$cursor as String?);
    }
    if (data.containsKey('folder_id')) {
      final l$folder_id = data['folder_id'];
      result$data['folder_id'] = (l$folder_id as String?);
    }
    return Variables$Query$GET_GRANTED_METAMODELS._(result$data);
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  Enum$MetamodelType? get type => (_$data['type'] as Enum$MetamodelType?);

  String? get cursor => (_$data['cursor'] as String?);

  String? get folder_id => (_$data['folder_id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type == null
          ? null
          : toJson$Enum$MetamodelType(l$type);
    }
    if (_$data.containsKey('cursor')) {
      final l$cursor = cursor;
      result$data['cursor'] = l$cursor;
    }
    if (_$data.containsKey('folder_id')) {
      final l$folder_id = folder_id;
      result$data['folder_id'] = l$folder_id;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GET_GRANTED_METAMODELS<
    Variables$Query$GET_GRANTED_METAMODELS
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_GRANTED_METAMODELS(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_GRANTED_METAMODELS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (_$data.containsKey('cursor') != other._$data.containsKey('cursor')) {
      return false;
    }
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$folder_id = folder_id;
    final lOther$folder_id = other.folder_id;
    if (_$data.containsKey('folder_id') !=
        other._$data.containsKey('folder_id')) {
      return false;
    }
    if (l$folder_id != lOther$folder_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$access_id = access_id;
    final l$type = type;
    final l$cursor = cursor;
    final l$folder_id = folder_id;
    return Object.hashAll([
      l$access_id,
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('cursor') ? l$cursor : const {},
      _$data.containsKey('folder_id') ? l$folder_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GET_GRANTED_METAMODELS<TRes> {
  factory CopyWith$Variables$Query$GET_GRANTED_METAMODELS(
    Variables$Query$GET_GRANTED_METAMODELS instance,
    TRes Function(Variables$Query$GET_GRANTED_METAMODELS) then,
  ) = _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODELS;

  factory CopyWith$Variables$Query$GET_GRANTED_METAMODELS.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODELS;

  TRes call({
    String? access_id,
    Enum$MetamodelType? type,
    String? cursor,
    String? folder_id,
  });
}

class _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODELS<TRes>
    implements CopyWith$Variables$Query$GET_GRANTED_METAMODELS<TRes> {
  _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODELS(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_GRANTED_METAMODELS _instance;

  final TRes Function(Variables$Query$GET_GRANTED_METAMODELS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? access_id = _undefined,
    Object? type = _undefined,
    Object? cursor = _undefined,
    Object? folder_id = _undefined,
  }) => _then(
    Variables$Query$GET_GRANTED_METAMODELS._({
      ..._instance._$data,
      if (access_id != _undefined && access_id != null)
        'access_id': (access_id as String),
      if (type != _undefined) 'type': (type as Enum$MetamodelType?),
      if (cursor != _undefined) 'cursor': (cursor as String?),
      if (folder_id != _undefined) 'folder_id': (folder_id as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODELS<TRes>
    implements CopyWith$Variables$Query$GET_GRANTED_METAMODELS<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODELS(this._res);

  TRes _res;

  call({
    String? access_id,
    Enum$MetamodelType? type,
    String? cursor,
    String? folder_id,
  }) => _res;
}

class Query$GET_GRANTED_METAMODELS {
  Query$GET_GRANTED_METAMODELS({
    required this.getGrantedMetamodels,
    this.$__typename = 'Query',
  });

  factory Query$GET_GRANTED_METAMODELS.fromJson(Map<String, dynamic> json) {
    final l$getGrantedMetamodels = json['getGrantedMetamodels'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODELS(
      getGrantedMetamodels:
          Query$GET_GRANTED_METAMODELS$getGrantedMetamodels.fromJson(
            (l$getGrantedMetamodels as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_GRANTED_METAMODELS$getGrantedMetamodels getGrantedMetamodels;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getGrantedMetamodels = getGrantedMetamodels;
    _resultData['getGrantedMetamodels'] = l$getGrantedMetamodels.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getGrantedMetamodels = getGrantedMetamodels;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getGrantedMetamodels, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_METAMODELS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getGrantedMetamodels = getGrantedMetamodels;
    final lOther$getGrantedMetamodels = other.getGrantedMetamodels;
    if (l$getGrantedMetamodels != lOther$getGrantedMetamodels) {
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

extension UtilityExtension$Query$GET_GRANTED_METAMODELS
    on Query$GET_GRANTED_METAMODELS {
  CopyWith$Query$GET_GRANTED_METAMODELS<Query$GET_GRANTED_METAMODELS>
  get copyWith => CopyWith$Query$GET_GRANTED_METAMODELS(this, (i) => i);
}

abstract class CopyWith$Query$GET_GRANTED_METAMODELS<TRes> {
  factory CopyWith$Query$GET_GRANTED_METAMODELS(
    Query$GET_GRANTED_METAMODELS instance,
    TRes Function(Query$GET_GRANTED_METAMODELS) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODELS;

  factory CopyWith$Query$GET_GRANTED_METAMODELS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS;

  TRes call({
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels? getGrantedMetamodels,
    String? $__typename,
  });
  CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes>
  get getGrantedMetamodels;
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODELS<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODELS<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_METAMODELS(this._instance, this._then);

  final Query$GET_GRANTED_METAMODELS _instance;

  final TRes Function(Query$GET_GRANTED_METAMODELS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getGrantedMetamodels = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODELS(
      getGrantedMetamodels:
          getGrantedMetamodels == _undefined || getGrantedMetamodels == null
          ? _instance.getGrantedMetamodels
          : (getGrantedMetamodels
                as Query$GET_GRANTED_METAMODELS$getGrantedMetamodels),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes>
  get getGrantedMetamodels {
    final local$getGrantedMetamodels = _instance.getGrantedMetamodels;
    return CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
      local$getGrantedMetamodels,
      (e) => call(getGrantedMetamodels: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODELS<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS(this._res);

  TRes _res;

  call({
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels? getGrantedMetamodels,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes>
  get getGrantedMetamodels =>
      CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels.stub(_res);
}

const documentNodeQueryGET_GRANTED_METAMODELS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_GRANTED_METAMODELS'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'type')),
          type: NamedTypeNode(
            name: NameNode(value: 'MetamodelType'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cursor')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'folder_id')),
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
            name: NameNode(value: 'getGrantedMetamodels'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: VariableNode(name: NameNode(value: 'type')),
              ),
              ArgumentNode(
                name: NameNode(value: 'cursor'),
                value: VariableNode(name: NameNode(value: 'cursor')),
              ),
              ArgumentNode(
                name: NameNode(value: 'folder_id'),
                value: VariableNode(name: NameNode(value: 'folder_id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'models'),
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
                        name: NameNode(value: 'type'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'metadata'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'ignored_beneficiaries'),
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
                  name: NameNode(value: 'has_more'),
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

class Query$GET_GRANTED_METAMODELS$getGrantedMetamodels {
  Query$GET_GRANTED_METAMODELS$getGrantedMetamodels({
    required this.models,
    required this.has_more,
    this.$__typename = 'MetamodelList',
  });

  factory Query$GET_GRANTED_METAMODELS$getGrantedMetamodels.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$models = json['models'];
    final l$has_more = json['has_more'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
      models: (l$models as List<dynamic>)
          .map(
            (e) =>
                Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      has_more: (l$has_more as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models> models;

  final bool has_more;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$models = models;
    _resultData['models'] = l$models.map((e) => e.toJson()).toList();
    final l$has_more = has_more;
    _resultData['has_more'] = l$has_more;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$models = models;
    final l$has_more = has_more;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$models.map((v) => v)),
      l$has_more,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_METAMODELS$getGrantedMetamodels ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$models = models;
    final lOther$models = other.models;
    if (l$models.length != lOther$models.length) {
      return false;
    }
    for (int i = 0; i < l$models.length; i++) {
      final l$models$entry = l$models[i];
      final lOther$models$entry = lOther$models[i];
      if (l$models$entry != lOther$models$entry) {
        return false;
      }
    }
    final l$has_more = has_more;
    final lOther$has_more = other.has_more;
    if (l$has_more != lOther$has_more) {
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

extension UtilityExtension$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels
    on Query$GET_GRANTED_METAMODELS$getGrantedMetamodels {
  CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels
  >
  get copyWith => CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<
  TRes
> {
  factory CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels instance,
    TRes Function(Query$GET_GRANTED_METAMODELS$getGrantedMetamodels) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels;

  factory CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels;

  TRes call({
    List<Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models>? models,
    bool? has_more,
    String? $__typename,
  });
  TRes models(
    Iterable<Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models> Function(
      Iterable<
        CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
          Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes>
    implements
        CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_METAMODELS$getGrantedMetamodels _instance;

  final TRes Function(Query$GET_GRANTED_METAMODELS$getGrantedMetamodels) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? models = _undefined,
    Object? has_more = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
      models: models == _undefined || models == null
          ? _instance.models
          : (models
                as List<
                  Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models
                >),
      has_more: has_more == _undefined || has_more == null
          ? _instance.has_more
          : (has_more as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes models(
    Iterable<Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models> Function(
      Iterable<
        CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
          Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models
        >
      >,
    )
    _fn,
  ) => call(
    models: _fn(
      _instance.models.map(
        (e) =>
            CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes>
    implements
        CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models>? models,
    bool? has_more,
    String? $__typename,
  }) => _res;

  models(_fn) => _res;
}

class Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models {
  Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models({
    required this.id,
    required this.type,
    required this.metadata,
    this.ignored_beneficiaries,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
      id: (l$id as String),
      type: fromJson$Enum$MetamodelType((l$type as String)),
      metadata: (l$metadata as String),
      ignored_beneficiaries: (l$ignored_beneficiaries as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$MetamodelType type;

  final String metadata;

  final List<String>? ignored_beneficiaries;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MetamodelType(l$type);
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$ignored_beneficiaries = ignored_beneficiaries;
    _resultData['ignored_beneficiaries'] = l$ignored_beneficiaries
        ?.map((e) => e)
        .toList();
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
    final l$type = type;
    final l$metadata = metadata;
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$metadata,
      l$ignored_beneficiaries == null
          ? null
          : Object.hashAll(l$ignored_beneficiaries.map((v) => v)),
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
    if (other is! Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final lOther$ignored_beneficiaries = other.ignored_beneficiaries;
    if (l$ignored_beneficiaries != null &&
        lOther$ignored_beneficiaries != null) {
      if (l$ignored_beneficiaries.length !=
          lOther$ignored_beneficiaries.length) {
        return false;
      }
      for (int i = 0; i < l$ignored_beneficiaries.length; i++) {
        final l$ignored_beneficiaries$entry = l$ignored_beneficiaries[i];
        final lOther$ignored_beneficiaries$entry =
            lOther$ignored_beneficiaries[i];
        if (l$ignored_beneficiaries$entry !=
            lOther$ignored_beneficiaries$entry) {
          return false;
        }
      }
    } else if (l$ignored_beneficiaries != lOther$ignored_beneficiaries) {
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

extension UtilityExtension$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models
    on Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models {
  CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
  TRes
> {
  factory CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models instance,
    TRes Function(Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models)
    then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models;

  factory CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models;

  TRes call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    List<String>? ignored_beneficiaries,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
          TRes
        > {
  _CopyWithImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models _instance;

  final TRes Function(Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? metadata = _undefined,
    Object? ignored_beneficiaries = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MetamodelType),
      metadata: metadata == _undefined || metadata == null
          ? _instance.metadata
          : (metadata as String),
      ignored_beneficiaries: ignored_beneficiaries == _undefined
          ? _instance.ignored_beneficiaries
          : (ignored_beneficiaries as List<String>?),
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

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODELS$getGrantedMetamodels$models(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    List<String>? ignored_beneficiaries,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
