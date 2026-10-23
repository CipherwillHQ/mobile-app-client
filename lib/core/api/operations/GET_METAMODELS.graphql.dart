import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GET_METAMODELS {
  factory Variables$Query$GET_METAMODELS({
    Enum$MetamodelType? type,
    String? cursor,
    String? folder_id,
  }) => Variables$Query$GET_METAMODELS._({
    if (type != null) r'type': type,
    if (cursor != null) r'cursor': cursor,
    if (folder_id != null) r'folder_id': folder_id,
  });

  Variables$Query$GET_METAMODELS._(this._$data);

  factory Variables$Query$GET_METAMODELS.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
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
    return Variables$Query$GET_METAMODELS._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$MetamodelType? get type => (_$data['type'] as Enum$MetamodelType?);

  String? get cursor => (_$data['cursor'] as String?);

  String? get folder_id => (_$data['folder_id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
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

  CopyWith$Variables$Query$GET_METAMODELS<Variables$Query$GET_METAMODELS>
  get copyWith => CopyWith$Variables$Query$GET_METAMODELS(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_METAMODELS ||
        runtimeType != other.runtimeType) {
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
    final l$type = type;
    final l$cursor = cursor;
    final l$folder_id = folder_id;
    return Object.hashAll([
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('cursor') ? l$cursor : const {},
      _$data.containsKey('folder_id') ? l$folder_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GET_METAMODELS<TRes> {
  factory CopyWith$Variables$Query$GET_METAMODELS(
    Variables$Query$GET_METAMODELS instance,
    TRes Function(Variables$Query$GET_METAMODELS) then,
  ) = _CopyWithImpl$Variables$Query$GET_METAMODELS;

  factory CopyWith$Variables$Query$GET_METAMODELS.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_METAMODELS;

  TRes call({Enum$MetamodelType? type, String? cursor, String? folder_id});
}

class _CopyWithImpl$Variables$Query$GET_METAMODELS<TRes>
    implements CopyWith$Variables$Query$GET_METAMODELS<TRes> {
  _CopyWithImpl$Variables$Query$GET_METAMODELS(this._instance, this._then);

  final Variables$Query$GET_METAMODELS _instance;

  final TRes Function(Variables$Query$GET_METAMODELS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? type = _undefined,
    Object? cursor = _undefined,
    Object? folder_id = _undefined,
  }) => _then(
    Variables$Query$GET_METAMODELS._({
      ..._instance._$data,
      if (type != _undefined) 'type': (type as Enum$MetamodelType?),
      if (cursor != _undefined) 'cursor': (cursor as String?),
      if (folder_id != _undefined) 'folder_id': (folder_id as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_METAMODELS<TRes>
    implements CopyWith$Variables$Query$GET_METAMODELS<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_METAMODELS(this._res);

  TRes _res;

  call({Enum$MetamodelType? type, String? cursor, String? folder_id}) => _res;
}

class Query$GET_METAMODELS {
  Query$GET_METAMODELS({
    required this.getMetamodels,
    this.$__typename = 'Query',
  });

  factory Query$GET_METAMODELS.fromJson(Map<String, dynamic> json) {
    final l$getMetamodels = json['getMetamodels'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODELS(
      getMetamodels: Query$GET_METAMODELS$getMetamodels.fromJson(
        (l$getMetamodels as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_METAMODELS$getMetamodels getMetamodels;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMetamodels = getMetamodels;
    _resultData['getMetamodels'] = l$getMetamodels.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMetamodels = getMetamodels;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getMetamodels, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_METAMODELS || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMetamodels = getMetamodels;
    final lOther$getMetamodels = other.getMetamodels;
    if (l$getMetamodels != lOther$getMetamodels) {
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

extension UtilityExtension$Query$GET_METAMODELS on Query$GET_METAMODELS {
  CopyWith$Query$GET_METAMODELS<Query$GET_METAMODELS> get copyWith =>
      CopyWith$Query$GET_METAMODELS(this, (i) => i);
}

abstract class CopyWith$Query$GET_METAMODELS<TRes> {
  factory CopyWith$Query$GET_METAMODELS(
    Query$GET_METAMODELS instance,
    TRes Function(Query$GET_METAMODELS) then,
  ) = _CopyWithImpl$Query$GET_METAMODELS;

  factory CopyWith$Query$GET_METAMODELS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_METAMODELS;

  TRes call({
    Query$GET_METAMODELS$getMetamodels? getMetamodels,
    String? $__typename,
  });
  CopyWith$Query$GET_METAMODELS$getMetamodels<TRes> get getMetamodels;
}

class _CopyWithImpl$Query$GET_METAMODELS<TRes>
    implements CopyWith$Query$GET_METAMODELS<TRes> {
  _CopyWithImpl$Query$GET_METAMODELS(this._instance, this._then);

  final Query$GET_METAMODELS _instance;

  final TRes Function(Query$GET_METAMODELS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMetamodels = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_METAMODELS(
      getMetamodels: getMetamodels == _undefined || getMetamodels == null
          ? _instance.getMetamodels
          : (getMetamodels as Query$GET_METAMODELS$getMetamodels),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_METAMODELS$getMetamodels<TRes> get getMetamodels {
    final local$getMetamodels = _instance.getMetamodels;
    return CopyWith$Query$GET_METAMODELS$getMetamodels(
      local$getMetamodels,
      (e) => call(getMetamodels: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_METAMODELS<TRes>
    implements CopyWith$Query$GET_METAMODELS<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODELS(this._res);

  TRes _res;

  call({
    Query$GET_METAMODELS$getMetamodels? getMetamodels,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_METAMODELS$getMetamodels<TRes> get getMetamodels =>
      CopyWith$Query$GET_METAMODELS$getMetamodels.stub(_res);
}

const documentNodeQueryGET_METAMODELS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_METAMODELS'),
      variableDefinitions: [
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
            name: NameNode(value: 'getMetamodels'),
            alias: null,
            arguments: [
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
                        name: NameNode(value: 'folder_id'),
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

class Query$GET_METAMODELS$getMetamodels {
  Query$GET_METAMODELS$getMetamodels({
    required this.models,
    required this.has_more,
    this.$__typename = 'MetamodelList',
  });

  factory Query$GET_METAMODELS$getMetamodels.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$models = json['models'];
    final l$has_more = json['has_more'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODELS$getMetamodels(
      models: (l$models as List<dynamic>)
          .map(
            (e) => Query$GET_METAMODELS$getMetamodels$models.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      has_more: (l$has_more as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_METAMODELS$getMetamodels$models> models;

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
    if (other is! Query$GET_METAMODELS$getMetamodels ||
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

extension UtilityExtension$Query$GET_METAMODELS$getMetamodels
    on Query$GET_METAMODELS$getMetamodels {
  CopyWith$Query$GET_METAMODELS$getMetamodels<
    Query$GET_METAMODELS$getMetamodels
  >
  get copyWith => CopyWith$Query$GET_METAMODELS$getMetamodels(this, (i) => i);
}

abstract class CopyWith$Query$GET_METAMODELS$getMetamodels<TRes> {
  factory CopyWith$Query$GET_METAMODELS$getMetamodels(
    Query$GET_METAMODELS$getMetamodels instance,
    TRes Function(Query$GET_METAMODELS$getMetamodels) then,
  ) = _CopyWithImpl$Query$GET_METAMODELS$getMetamodels;

  factory CopyWith$Query$GET_METAMODELS$getMetamodels.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_METAMODELS$getMetamodels;

  TRes call({
    List<Query$GET_METAMODELS$getMetamodels$models>? models,
    bool? has_more,
    String? $__typename,
  });
  TRes models(
    Iterable<Query$GET_METAMODELS$getMetamodels$models> Function(
      Iterable<
        CopyWith$Query$GET_METAMODELS$getMetamodels$models<
          Query$GET_METAMODELS$getMetamodels$models
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_METAMODELS$getMetamodels<TRes>
    implements CopyWith$Query$GET_METAMODELS$getMetamodels<TRes> {
  _CopyWithImpl$Query$GET_METAMODELS$getMetamodels(this._instance, this._then);

  final Query$GET_METAMODELS$getMetamodels _instance;

  final TRes Function(Query$GET_METAMODELS$getMetamodels) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? models = _undefined,
    Object? has_more = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_METAMODELS$getMetamodels(
      models: models == _undefined || models == null
          ? _instance.models
          : (models as List<Query$GET_METAMODELS$getMetamodels$models>),
      has_more: has_more == _undefined || has_more == null
          ? _instance.has_more
          : (has_more as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes models(
    Iterable<Query$GET_METAMODELS$getMetamodels$models> Function(
      Iterable<
        CopyWith$Query$GET_METAMODELS$getMetamodels$models<
          Query$GET_METAMODELS$getMetamodels$models
        >
      >,
    )
    _fn,
  ) => call(
    models: _fn(
      _instance.models.map(
        (e) => CopyWith$Query$GET_METAMODELS$getMetamodels$models(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_METAMODELS$getMetamodels<TRes>
    implements CopyWith$Query$GET_METAMODELS$getMetamodels<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODELS$getMetamodels(this._res);

  TRes _res;

  call({
    List<Query$GET_METAMODELS$getMetamodels$models>? models,
    bool? has_more,
    String? $__typename,
  }) => _res;

  models(_fn) => _res;
}

class Query$GET_METAMODELS$getMetamodels$models {
  Query$GET_METAMODELS$getMetamodels$models({
    required this.id,
    required this.type,
    required this.metadata,
    required this.folder_id,
    this.ignored_beneficiaries,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Query$GET_METAMODELS$getMetamodels$models.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$folder_id = json['folder_id'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODELS$getMetamodels$models(
      id: (l$id as String),
      type: fromJson$Enum$MetamodelType((l$type as String)),
      metadata: (l$metadata as String),
      folder_id: (l$folder_id as String),
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

  final String folder_id;

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
    final l$folder_id = folder_id;
    _resultData['folder_id'] = l$folder_id;
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
    final l$folder_id = folder_id;
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$metadata,
      l$folder_id,
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
    if (other is! Query$GET_METAMODELS$getMetamodels$models ||
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
    final l$folder_id = folder_id;
    final lOther$folder_id = other.folder_id;
    if (l$folder_id != lOther$folder_id) {
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

extension UtilityExtension$Query$GET_METAMODELS$getMetamodels$models
    on Query$GET_METAMODELS$getMetamodels$models {
  CopyWith$Query$GET_METAMODELS$getMetamodels$models<
    Query$GET_METAMODELS$getMetamodels$models
  >
  get copyWith =>
      CopyWith$Query$GET_METAMODELS$getMetamodels$models(this, (i) => i);
}

abstract class CopyWith$Query$GET_METAMODELS$getMetamodels$models<TRes> {
  factory CopyWith$Query$GET_METAMODELS$getMetamodels$models(
    Query$GET_METAMODELS$getMetamodels$models instance,
    TRes Function(Query$GET_METAMODELS$getMetamodels$models) then,
  ) = _CopyWithImpl$Query$GET_METAMODELS$getMetamodels$models;

  factory CopyWith$Query$GET_METAMODELS$getMetamodels$models.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_METAMODELS$getMetamodels$models;

  TRes call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    String? folder_id,
    List<String>? ignored_beneficiaries,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_METAMODELS$getMetamodels$models<TRes>
    implements CopyWith$Query$GET_METAMODELS$getMetamodels$models<TRes> {
  _CopyWithImpl$Query$GET_METAMODELS$getMetamodels$models(
    this._instance,
    this._then,
  );

  final Query$GET_METAMODELS$getMetamodels$models _instance;

  final TRes Function(Query$GET_METAMODELS$getMetamodels$models) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? metadata = _undefined,
    Object? folder_id = _undefined,
    Object? ignored_beneficiaries = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_METAMODELS$getMetamodels$models(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MetamodelType),
      metadata: metadata == _undefined || metadata == null
          ? _instance.metadata
          : (metadata as String),
      folder_id: folder_id == _undefined || folder_id == null
          ? _instance.folder_id
          : (folder_id as String),
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

class _CopyWithStubImpl$Query$GET_METAMODELS$getMetamodels$models<TRes>
    implements CopyWith$Query$GET_METAMODELS$getMetamodels$models<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODELS$getMetamodels$models(this._res);

  TRes _res;

  call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    String? folder_id,
    List<String>? ignored_beneficiaries,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
