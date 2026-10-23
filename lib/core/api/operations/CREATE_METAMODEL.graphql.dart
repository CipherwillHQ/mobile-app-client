import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$CREATE_METAMODEL {
  factory Variables$Mutation$CREATE_METAMODEL({
    String? id,
    required Enum$MetamodelType type,
    required String metadata,
    String? folder_id,
    List<String>? ignored_beneficiaries,
    bool? restore,
  }) => Variables$Mutation$CREATE_METAMODEL._({
    if (id != null) r'id': id,
    r'type': type,
    r'metadata': metadata,
    if (folder_id != null) r'folder_id': folder_id,
    if (ignored_beneficiaries != null)
      r'ignored_beneficiaries': ignored_beneficiaries,
    if (restore != null) r'restore': restore,
  });

  Variables$Mutation$CREATE_METAMODEL._(this._$data);

  factory Variables$Mutation$CREATE_METAMODEL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    final l$type = data['type'];
    result$data['type'] = fromJson$Enum$MetamodelType((l$type as String));
    final l$metadata = data['metadata'];
    result$data['metadata'] = (l$metadata as String);
    if (data.containsKey('folder_id')) {
      final l$folder_id = data['folder_id'];
      result$data['folder_id'] = (l$folder_id as String?);
    }
    if (data.containsKey('ignored_beneficiaries')) {
      final l$ignored_beneficiaries = data['ignored_beneficiaries'];
      result$data['ignored_beneficiaries'] =
          (l$ignored_beneficiaries as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('restore')) {
      final l$restore = data['restore'];
      result$data['restore'] = (l$restore as bool?);
    }
    return Variables$Mutation$CREATE_METAMODEL._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  Enum$MetamodelType get type => (_$data['type'] as Enum$MetamodelType);

  String get metadata => (_$data['metadata'] as String);

  String? get folder_id => (_$data['folder_id'] as String?);

  List<String>? get ignored_beneficiaries =>
      (_$data['ignored_beneficiaries'] as List<String>?);

  bool? get restore => (_$data['restore'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    final l$type = type;
    result$data['type'] = toJson$Enum$MetamodelType(l$type);
    final l$metadata = metadata;
    result$data['metadata'] = l$metadata;
    if (_$data.containsKey('folder_id')) {
      final l$folder_id = folder_id;
      result$data['folder_id'] = l$folder_id;
    }
    if (_$data.containsKey('ignored_beneficiaries')) {
      final l$ignored_beneficiaries = ignored_beneficiaries;
      result$data['ignored_beneficiaries'] = l$ignored_beneficiaries
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('restore')) {
      final l$restore = restore;
      result$data['restore'] = l$restore;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CREATE_METAMODEL<
    Variables$Mutation$CREATE_METAMODEL
  >
  get copyWith => CopyWith$Variables$Mutation$CREATE_METAMODEL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CREATE_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
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
    if (_$data.containsKey('folder_id') !=
        other._$data.containsKey('folder_id')) {
      return false;
    }
    if (l$folder_id != lOther$folder_id) {
      return false;
    }
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final lOther$ignored_beneficiaries = other.ignored_beneficiaries;
    if (_$data.containsKey('ignored_beneficiaries') !=
        other._$data.containsKey('ignored_beneficiaries')) {
      return false;
    }
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
    final l$restore = restore;
    final lOther$restore = other.restore;
    if (_$data.containsKey('restore') != other._$data.containsKey('restore')) {
      return false;
    }
    if (l$restore != lOther$restore) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$metadata = metadata;
    final l$folder_id = folder_id;
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final l$restore = restore;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      l$type,
      l$metadata,
      _$data.containsKey('folder_id') ? l$folder_id : const {},
      _$data.containsKey('ignored_beneficiaries')
          ? l$ignored_beneficiaries == null
                ? null
                : Object.hashAll(l$ignored_beneficiaries.map((v) => v))
          : const {},
      _$data.containsKey('restore') ? l$restore : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CREATE_METAMODEL<TRes> {
  factory CopyWith$Variables$Mutation$CREATE_METAMODEL(
    Variables$Mutation$CREATE_METAMODEL instance,
    TRes Function(Variables$Mutation$CREATE_METAMODEL) then,
  ) = _CopyWithImpl$Variables$Mutation$CREATE_METAMODEL;

  factory CopyWith$Variables$Mutation$CREATE_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CREATE_METAMODEL;

  TRes call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    String? folder_id,
    List<String>? ignored_beneficiaries,
    bool? restore,
  });
}

class _CopyWithImpl$Variables$Mutation$CREATE_METAMODEL<TRes>
    implements CopyWith$Variables$Mutation$CREATE_METAMODEL<TRes> {
  _CopyWithImpl$Variables$Mutation$CREATE_METAMODEL(this._instance, this._then);

  final Variables$Mutation$CREATE_METAMODEL _instance;

  final TRes Function(Variables$Mutation$CREATE_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? metadata = _undefined,
    Object? folder_id = _undefined,
    Object? ignored_beneficiaries = _undefined,
    Object? restore = _undefined,
  }) => _then(
    Variables$Mutation$CREATE_METAMODEL._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (type != _undefined && type != null)
        'type': (type as Enum$MetamodelType),
      if (metadata != _undefined && metadata != null)
        'metadata': (metadata as String),
      if (folder_id != _undefined) 'folder_id': (folder_id as String?),
      if (ignored_beneficiaries != _undefined)
        'ignored_beneficiaries': (ignored_beneficiaries as List<String>?),
      if (restore != _undefined) 'restore': (restore as bool?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CREATE_METAMODEL<TRes>
    implements CopyWith$Variables$Mutation$CREATE_METAMODEL<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CREATE_METAMODEL(this._res);

  TRes _res;

  call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    String? folder_id,
    List<String>? ignored_beneficiaries,
    bool? restore,
  }) => _res;
}

class Mutation$CREATE_METAMODEL {
  Mutation$CREATE_METAMODEL({
    required this.createMetamodel,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CREATE_METAMODEL.fromJson(Map<String, dynamic> json) {
    final l$createMetamodel = json['createMetamodel'];
    final l$$__typename = json['__typename'];
    return Mutation$CREATE_METAMODEL(
      createMetamodel: Mutation$CREATE_METAMODEL$createMetamodel.fromJson(
        (l$createMetamodel as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CREATE_METAMODEL$createMetamodel createMetamodel;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createMetamodel = createMetamodel;
    _resultData['createMetamodel'] = l$createMetamodel.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createMetamodel = createMetamodel;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createMetamodel, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CREATE_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createMetamodel = createMetamodel;
    final lOther$createMetamodel = other.createMetamodel;
    if (l$createMetamodel != lOther$createMetamodel) {
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

extension UtilityExtension$Mutation$CREATE_METAMODEL
    on Mutation$CREATE_METAMODEL {
  CopyWith$Mutation$CREATE_METAMODEL<Mutation$CREATE_METAMODEL> get copyWith =>
      CopyWith$Mutation$CREATE_METAMODEL(this, (i) => i);
}

abstract class CopyWith$Mutation$CREATE_METAMODEL<TRes> {
  factory CopyWith$Mutation$CREATE_METAMODEL(
    Mutation$CREATE_METAMODEL instance,
    TRes Function(Mutation$CREATE_METAMODEL) then,
  ) = _CopyWithImpl$Mutation$CREATE_METAMODEL;

  factory CopyWith$Mutation$CREATE_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CREATE_METAMODEL;

  TRes call({
    Mutation$CREATE_METAMODEL$createMetamodel? createMetamodel,
    String? $__typename,
  });
  CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<TRes> get createMetamodel;
}

class _CopyWithImpl$Mutation$CREATE_METAMODEL<TRes>
    implements CopyWith$Mutation$CREATE_METAMODEL<TRes> {
  _CopyWithImpl$Mutation$CREATE_METAMODEL(this._instance, this._then);

  final Mutation$CREATE_METAMODEL _instance;

  final TRes Function(Mutation$CREATE_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createMetamodel = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CREATE_METAMODEL(
      createMetamodel: createMetamodel == _undefined || createMetamodel == null
          ? _instance.createMetamodel
          : (createMetamodel as Mutation$CREATE_METAMODEL$createMetamodel),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<TRes> get createMetamodel {
    final local$createMetamodel = _instance.createMetamodel;
    return CopyWith$Mutation$CREATE_METAMODEL$createMetamodel(
      local$createMetamodel,
      (e) => call(createMetamodel: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CREATE_METAMODEL<TRes>
    implements CopyWith$Mutation$CREATE_METAMODEL<TRes> {
  _CopyWithStubImpl$Mutation$CREATE_METAMODEL(this._res);

  TRes _res;

  call({
    Mutation$CREATE_METAMODEL$createMetamodel? createMetamodel,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<TRes>
  get createMetamodel =>
      CopyWith$Mutation$CREATE_METAMODEL$createMetamodel.stub(_res);
}

const documentNodeMutationCREATE_METAMODEL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CREATE_METAMODEL'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'type')),
          type: NamedTypeNode(
            name: NameNode(value: 'MetamodelType'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'metadata')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
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
        VariableDefinitionNode(
          variable: VariableNode(
            name: NameNode(value: 'ignored_beneficiaries'),
          ),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'String'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'restore')),
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
            name: NameNode(value: 'createMetamodel'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: VariableNode(name: NameNode(value: 'type')),
              ),
              ArgumentNode(
                name: NameNode(value: 'metadata'),
                value: VariableNode(name: NameNode(value: 'metadata')),
              ),
              ArgumentNode(
                name: NameNode(value: 'folder_id'),
                value: VariableNode(name: NameNode(value: 'folder_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ignored_beneficiaries'),
                value: VariableNode(
                  name: NameNode(value: 'ignored_beneficiaries'),
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'restore'),
                value: VariableNode(name: NameNode(value: 'restore')),
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

class Mutation$CREATE_METAMODEL$createMetamodel {
  Mutation$CREATE_METAMODEL$createMetamodel({
    required this.id,
    required this.type,
    required this.metadata,
    this.ignored_beneficiaries,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Mutation$CREATE_METAMODEL$createMetamodel.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$CREATE_METAMODEL$createMetamodel(
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
    if (other is! Mutation$CREATE_METAMODEL$createMetamodel ||
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

extension UtilityExtension$Mutation$CREATE_METAMODEL$createMetamodel
    on Mutation$CREATE_METAMODEL$createMetamodel {
  CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<
    Mutation$CREATE_METAMODEL$createMetamodel
  >
  get copyWith =>
      CopyWith$Mutation$CREATE_METAMODEL$createMetamodel(this, (i) => i);
}

abstract class CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<TRes> {
  factory CopyWith$Mutation$CREATE_METAMODEL$createMetamodel(
    Mutation$CREATE_METAMODEL$createMetamodel instance,
    TRes Function(Mutation$CREATE_METAMODEL$createMetamodel) then,
  ) = _CopyWithImpl$Mutation$CREATE_METAMODEL$createMetamodel;

  factory CopyWith$Mutation$CREATE_METAMODEL$createMetamodel.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CREATE_METAMODEL$createMetamodel;

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

class _CopyWithImpl$Mutation$CREATE_METAMODEL$createMetamodel<TRes>
    implements CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<TRes> {
  _CopyWithImpl$Mutation$CREATE_METAMODEL$createMetamodel(
    this._instance,
    this._then,
  );

  final Mutation$CREATE_METAMODEL$createMetamodel _instance;

  final TRes Function(Mutation$CREATE_METAMODEL$createMetamodel) _then;

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
    Mutation$CREATE_METAMODEL$createMetamodel(
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

class _CopyWithStubImpl$Mutation$CREATE_METAMODEL$createMetamodel<TRes>
    implements CopyWith$Mutation$CREATE_METAMODEL$createMetamodel<TRes> {
  _CopyWithStubImpl$Mutation$CREATE_METAMODEL$createMetamodel(this._res);

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
