import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GET_GRANTED_METAMODEL {
  factory Variables$Query$GET_GRANTED_METAMODEL({
    required String access_id,
    required String model_id,
  }) => Variables$Query$GET_GRANTED_METAMODEL._({
    r'access_id': access_id,
    r'model_id': model_id,
  });

  Variables$Query$GET_GRANTED_METAMODEL._(this._$data);

  factory Variables$Query$GET_GRANTED_METAMODEL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    final l$model_id = data['model_id'];
    result$data['model_id'] = (l$model_id as String);
    return Variables$Query$GET_GRANTED_METAMODEL._(result$data);
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  String get model_id => (_$data['model_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    final l$model_id = model_id;
    result$data['model_id'] = l$model_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_GRANTED_METAMODEL<
    Variables$Query$GET_GRANTED_METAMODEL
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_GRANTED_METAMODEL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_GRANTED_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
      return false;
    }
    final l$model_id = model_id;
    final lOther$model_id = other.model_id;
    if (l$model_id != lOther$model_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$access_id = access_id;
    final l$model_id = model_id;
    return Object.hashAll([l$access_id, l$model_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_GRANTED_METAMODEL<TRes> {
  factory CopyWith$Variables$Query$GET_GRANTED_METAMODEL(
    Variables$Query$GET_GRANTED_METAMODEL instance,
    TRes Function(Variables$Query$GET_GRANTED_METAMODEL) then,
  ) = _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODEL;

  factory CopyWith$Variables$Query$GET_GRANTED_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODEL;

  TRes call({String? access_id, String? model_id});
}

class _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODEL<TRes>
    implements CopyWith$Variables$Query$GET_GRANTED_METAMODEL<TRes> {
  _CopyWithImpl$Variables$Query$GET_GRANTED_METAMODEL(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_GRANTED_METAMODEL _instance;

  final TRes Function(Variables$Query$GET_GRANTED_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? access_id = _undefined, Object? model_id = _undefined}) =>
      _then(
        Variables$Query$GET_GRANTED_METAMODEL._({
          ..._instance._$data,
          if (access_id != _undefined && access_id != null)
            'access_id': (access_id as String),
          if (model_id != _undefined && model_id != null)
            'model_id': (model_id as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODEL<TRes>
    implements CopyWith$Variables$Query$GET_GRANTED_METAMODEL<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_GRANTED_METAMODEL(this._res);

  TRes _res;

  call({String? access_id, String? model_id}) => _res;
}

class Query$GET_GRANTED_METAMODEL {
  Query$GET_GRANTED_METAMODEL({
    required this.getGrantedMetamodel,
    this.$__typename = 'Query',
  });

  factory Query$GET_GRANTED_METAMODEL.fromJson(Map<String, dynamic> json) {
    final l$getGrantedMetamodel = json['getGrantedMetamodel'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODEL(
      getGrantedMetamodel:
          Query$GET_GRANTED_METAMODEL$getGrantedMetamodel.fromJson(
            (l$getGrantedMetamodel as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_GRANTED_METAMODEL$getGrantedMetamodel getGrantedMetamodel;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getGrantedMetamodel = getGrantedMetamodel;
    _resultData['getGrantedMetamodel'] = l$getGrantedMetamodel.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getGrantedMetamodel = getGrantedMetamodel;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getGrantedMetamodel, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getGrantedMetamodel = getGrantedMetamodel;
    final lOther$getGrantedMetamodel = other.getGrantedMetamodel;
    if (l$getGrantedMetamodel != lOther$getGrantedMetamodel) {
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

extension UtilityExtension$Query$GET_GRANTED_METAMODEL
    on Query$GET_GRANTED_METAMODEL {
  CopyWith$Query$GET_GRANTED_METAMODEL<Query$GET_GRANTED_METAMODEL>
  get copyWith => CopyWith$Query$GET_GRANTED_METAMODEL(this, (i) => i);
}

abstract class CopyWith$Query$GET_GRANTED_METAMODEL<TRes> {
  factory CopyWith$Query$GET_GRANTED_METAMODEL(
    Query$GET_GRANTED_METAMODEL instance,
    TRes Function(Query$GET_GRANTED_METAMODEL) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODEL;

  factory CopyWith$Query$GET_GRANTED_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL;

  TRes call({
    Query$GET_GRANTED_METAMODEL$getGrantedMetamodel? getGrantedMetamodel,
    String? $__typename,
  });
  CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes>
  get getGrantedMetamodel;
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODEL<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODEL<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_METAMODEL(this._instance, this._then);

  final Query$GET_GRANTED_METAMODEL _instance;

  final TRes Function(Query$GET_GRANTED_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getGrantedMetamodel = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODEL(
      getGrantedMetamodel:
          getGrantedMetamodel == _undefined || getGrantedMetamodel == null
          ? _instance.getGrantedMetamodel
          : (getGrantedMetamodel
                as Query$GET_GRANTED_METAMODEL$getGrantedMetamodel),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes>
  get getGrantedMetamodel {
    final local$getGrantedMetamodel = _instance.getGrantedMetamodel;
    return CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(
      local$getGrantedMetamodel,
      (e) => call(getGrantedMetamodel: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODEL<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL(this._res);

  TRes _res;

  call({
    Query$GET_GRANTED_METAMODEL$getGrantedMetamodel? getGrantedMetamodel,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes>
  get getGrantedMetamodel =>
      CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel.stub(_res);
}

const documentNodeQueryGET_GRANTED_METAMODEL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_GRANTED_METAMODEL'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'model_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getGrantedMetamodel'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'model_id'),
                value: VariableNode(name: NameNode(value: 'model_id')),
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
                  name: NameNode(value: 'ignored_beneficiaries'),
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

class Query$GET_GRANTED_METAMODEL$getGrantedMetamodel {
  Query$GET_GRANTED_METAMODEL$getGrantedMetamodel({
    required this.id,
    required this.type,
    this.ignored_beneficiaries,
    required this.metadata,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Query$GET_GRANTED_METAMODEL$getGrantedMetamodel.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$metadata = json['metadata'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(
      id: (l$id as String),
      type: fromJson$Enum$MetamodelType((l$type as String)),
      ignored_beneficiaries: (l$ignored_beneficiaries as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      metadata: (l$metadata as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$MetamodelType type;

  final List<String>? ignored_beneficiaries;

  final String metadata;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MetamodelType(l$type);
    final l$ignored_beneficiaries = ignored_beneficiaries;
    _resultData['ignored_beneficiaries'] = l$ignored_beneficiaries
        ?.map((e) => e)
        .toList();
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
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
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final l$metadata = metadata;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$ignored_beneficiaries == null
          ? null
          : Object.hashAll(l$ignored_beneficiaries.map((v) => v)),
      l$metadata,
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
    if (other is! Query$GET_GRANTED_METAMODEL$getGrantedMetamodel ||
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
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
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

extension UtilityExtension$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel
    on Query$GET_GRANTED_METAMODEL$getGrantedMetamodel {
  CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<
    Query$GET_GRANTED_METAMODEL$getGrantedMetamodel
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(this, (i) => i);
}

abstract class CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes> {
  factory CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(
    Query$GET_GRANTED_METAMODEL$getGrantedMetamodel instance,
    TRes Function(Query$GET_GRANTED_METAMODEL$getGrantedMetamodel) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel;

  factory CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel;

  TRes call({
    String? id,
    Enum$MetamodelType? type,
    List<String>? ignored_beneficiaries,
    String? metadata,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_METAMODEL$getGrantedMetamodel _instance;

  final TRes Function(Query$GET_GRANTED_METAMODEL$getGrantedMetamodel) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? ignored_beneficiaries = _undefined,
    Object? metadata = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MetamodelType),
      ignored_beneficiaries: ignored_beneficiaries == _undefined
          ? _instance.ignored_beneficiaries
          : (ignored_beneficiaries as List<String>?),
      metadata: metadata == _undefined || metadata == null
          ? _instance.metadata
          : (metadata as String),
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

class _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes>
    implements CopyWith$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_METAMODEL$getGrantedMetamodel(this._res);

  TRes _res;

  call({
    String? id,
    Enum$MetamodelType? type,
    List<String>? ignored_beneficiaries,
    String? metadata,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
