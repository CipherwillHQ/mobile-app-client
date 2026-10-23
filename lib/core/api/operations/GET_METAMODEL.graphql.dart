import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GET_METAMODEL {
  factory Variables$Query$GET_METAMODEL({required String id}) =>
      Variables$Query$GET_METAMODEL._({r'id': id});

  Variables$Query$GET_METAMODEL._(this._$data);

  factory Variables$Query$GET_METAMODEL.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GET_METAMODEL._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_METAMODEL<Variables$Query$GET_METAMODEL>
  get copyWith => CopyWith$Variables$Query$GET_METAMODEL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GET_METAMODEL<TRes> {
  factory CopyWith$Variables$Query$GET_METAMODEL(
    Variables$Query$GET_METAMODEL instance,
    TRes Function(Variables$Query$GET_METAMODEL) then,
  ) = _CopyWithImpl$Variables$Query$GET_METAMODEL;

  factory CopyWith$Variables$Query$GET_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_METAMODEL;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GET_METAMODEL<TRes>
    implements CopyWith$Variables$Query$GET_METAMODEL<TRes> {
  _CopyWithImpl$Variables$Query$GET_METAMODEL(this._instance, this._then);

  final Variables$Query$GET_METAMODEL _instance;

  final TRes Function(Variables$Query$GET_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GET_METAMODEL._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_METAMODEL<TRes>
    implements CopyWith$Variables$Query$GET_METAMODEL<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_METAMODEL(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GET_METAMODEL {
  Query$GET_METAMODEL({required this.getMetamodel, this.$__typename = 'Query'});

  factory Query$GET_METAMODEL.fromJson(Map<String, dynamic> json) {
    final l$getMetamodel = json['getMetamodel'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODEL(
      getMetamodel: Query$GET_METAMODEL$getMetamodel.fromJson(
        (l$getMetamodel as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_METAMODEL$getMetamodel getMetamodel;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMetamodel = getMetamodel;
    _resultData['getMetamodel'] = l$getMetamodel.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMetamodel = getMetamodel;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getMetamodel, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_METAMODEL || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMetamodel = getMetamodel;
    final lOther$getMetamodel = other.getMetamodel;
    if (l$getMetamodel != lOther$getMetamodel) {
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

extension UtilityExtension$Query$GET_METAMODEL on Query$GET_METAMODEL {
  CopyWith$Query$GET_METAMODEL<Query$GET_METAMODEL> get copyWith =>
      CopyWith$Query$GET_METAMODEL(this, (i) => i);
}

abstract class CopyWith$Query$GET_METAMODEL<TRes> {
  factory CopyWith$Query$GET_METAMODEL(
    Query$GET_METAMODEL instance,
    TRes Function(Query$GET_METAMODEL) then,
  ) = _CopyWithImpl$Query$GET_METAMODEL;

  factory CopyWith$Query$GET_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_METAMODEL;

  TRes call({
    Query$GET_METAMODEL$getMetamodel? getMetamodel,
    String? $__typename,
  });
  CopyWith$Query$GET_METAMODEL$getMetamodel<TRes> get getMetamodel;
}

class _CopyWithImpl$Query$GET_METAMODEL<TRes>
    implements CopyWith$Query$GET_METAMODEL<TRes> {
  _CopyWithImpl$Query$GET_METAMODEL(this._instance, this._then);

  final Query$GET_METAMODEL _instance;

  final TRes Function(Query$GET_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMetamodel = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_METAMODEL(
      getMetamodel: getMetamodel == _undefined || getMetamodel == null
          ? _instance.getMetamodel
          : (getMetamodel as Query$GET_METAMODEL$getMetamodel),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_METAMODEL$getMetamodel<TRes> get getMetamodel {
    final local$getMetamodel = _instance.getMetamodel;
    return CopyWith$Query$GET_METAMODEL$getMetamodel(
      local$getMetamodel,
      (e) => call(getMetamodel: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_METAMODEL<TRes>
    implements CopyWith$Query$GET_METAMODEL<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODEL(this._res);

  TRes _res;

  call({Query$GET_METAMODEL$getMetamodel? getMetamodel, String? $__typename}) =>
      _res;

  CopyWith$Query$GET_METAMODEL$getMetamodel<TRes> get getMetamodel =>
      CopyWith$Query$GET_METAMODEL$getMetamodel.stub(_res);
}

const documentNodeQueryGET_METAMODEL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_METAMODEL'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getMetamodel'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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

class Query$GET_METAMODEL$getMetamodel {
  Query$GET_METAMODEL$getMetamodel({
    required this.id,
    required this.type,
    required this.metadata,
    required this.folder_id,
    this.ignored_beneficiaries,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Query$GET_METAMODEL$getMetamodel.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$folder_id = json['folder_id'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_METAMODEL$getMetamodel(
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
    if (other is! Query$GET_METAMODEL$getMetamodel ||
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

extension UtilityExtension$Query$GET_METAMODEL$getMetamodel
    on Query$GET_METAMODEL$getMetamodel {
  CopyWith$Query$GET_METAMODEL$getMetamodel<Query$GET_METAMODEL$getMetamodel>
  get copyWith => CopyWith$Query$GET_METAMODEL$getMetamodel(this, (i) => i);
}

abstract class CopyWith$Query$GET_METAMODEL$getMetamodel<TRes> {
  factory CopyWith$Query$GET_METAMODEL$getMetamodel(
    Query$GET_METAMODEL$getMetamodel instance,
    TRes Function(Query$GET_METAMODEL$getMetamodel) then,
  ) = _CopyWithImpl$Query$GET_METAMODEL$getMetamodel;

  factory CopyWith$Query$GET_METAMODEL$getMetamodel.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_METAMODEL$getMetamodel;

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

class _CopyWithImpl$Query$GET_METAMODEL$getMetamodel<TRes>
    implements CopyWith$Query$GET_METAMODEL$getMetamodel<TRes> {
  _CopyWithImpl$Query$GET_METAMODEL$getMetamodel(this._instance, this._then);

  final Query$GET_METAMODEL$getMetamodel _instance;

  final TRes Function(Query$GET_METAMODEL$getMetamodel) _then;

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
    Query$GET_METAMODEL$getMetamodel(
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

class _CopyWithStubImpl$Query$GET_METAMODEL$getMetamodel<TRes>
    implements CopyWith$Query$GET_METAMODEL$getMetamodel<TRes> {
  _CopyWithStubImpl$Query$GET_METAMODEL$getMetamodel(this._res);

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
