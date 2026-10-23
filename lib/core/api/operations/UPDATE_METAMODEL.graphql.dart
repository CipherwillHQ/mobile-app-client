import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$UPDATE_METAMODEL {
  factory Variables$Mutation$UPDATE_METAMODEL({
    required Input$UpdateMetamodelInput data,
  }) => Variables$Mutation$UPDATE_METAMODEL._({r'data': data});

  Variables$Mutation$UPDATE_METAMODEL._(this._$data);

  factory Variables$Mutation$UPDATE_METAMODEL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = Input$UpdateMetamodelInput.fromJson(
      (l$data as Map<String, dynamic>),
    );
    return Variables$Mutation$UPDATE_METAMODEL._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateMetamodelInput get data =>
      (_$data['data'] as Input$UpdateMetamodelInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UPDATE_METAMODEL<
    Variables$Mutation$UPDATE_METAMODEL
  >
  get copyWith => CopyWith$Variables$Mutation$UPDATE_METAMODEL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UPDATE_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }
}

abstract class CopyWith$Variables$Mutation$UPDATE_METAMODEL<TRes> {
  factory CopyWith$Variables$Mutation$UPDATE_METAMODEL(
    Variables$Mutation$UPDATE_METAMODEL instance,
    TRes Function(Variables$Mutation$UPDATE_METAMODEL) then,
  ) = _CopyWithImpl$Variables$Mutation$UPDATE_METAMODEL;

  factory CopyWith$Variables$Mutation$UPDATE_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UPDATE_METAMODEL;

  TRes call({Input$UpdateMetamodelInput? data});
}

class _CopyWithImpl$Variables$Mutation$UPDATE_METAMODEL<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_METAMODEL<TRes> {
  _CopyWithImpl$Variables$Mutation$UPDATE_METAMODEL(this._instance, this._then);

  final Variables$Mutation$UPDATE_METAMODEL _instance;

  final TRes Function(Variables$Mutation$UPDATE_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? data = _undefined}) => _then(
    Variables$Mutation$UPDATE_METAMODEL._({
      ..._instance._$data,
      if (data != _undefined && data != null)
        'data': (data as Input$UpdateMetamodelInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UPDATE_METAMODEL<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_METAMODEL<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UPDATE_METAMODEL(this._res);

  TRes _res;

  call({Input$UpdateMetamodelInput? data}) => _res;
}

class Mutation$UPDATE_METAMODEL {
  Mutation$UPDATE_METAMODEL({
    required this.updateMetamodel,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UPDATE_METAMODEL.fromJson(Map<String, dynamic> json) {
    final l$updateMetamodel = json['updateMetamodel'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_METAMODEL(
      updateMetamodel: Mutation$UPDATE_METAMODEL$updateMetamodel.fromJson(
        (l$updateMetamodel as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UPDATE_METAMODEL$updateMetamodel updateMetamodel;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMetamodel = updateMetamodel;
    _resultData['updateMetamodel'] = l$updateMetamodel.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMetamodel = updateMetamodel;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateMetamodel, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPDATE_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMetamodel = updateMetamodel;
    final lOther$updateMetamodel = other.updateMetamodel;
    if (l$updateMetamodel != lOther$updateMetamodel) {
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

extension UtilityExtension$Mutation$UPDATE_METAMODEL
    on Mutation$UPDATE_METAMODEL {
  CopyWith$Mutation$UPDATE_METAMODEL<Mutation$UPDATE_METAMODEL> get copyWith =>
      CopyWith$Mutation$UPDATE_METAMODEL(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_METAMODEL<TRes> {
  factory CopyWith$Mutation$UPDATE_METAMODEL(
    Mutation$UPDATE_METAMODEL instance,
    TRes Function(Mutation$UPDATE_METAMODEL) then,
  ) = _CopyWithImpl$Mutation$UPDATE_METAMODEL;

  factory CopyWith$Mutation$UPDATE_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_METAMODEL;

  TRes call({
    Mutation$UPDATE_METAMODEL$updateMetamodel? updateMetamodel,
    String? $__typename,
  });
  CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes> get updateMetamodel;
}

class _CopyWithImpl$Mutation$UPDATE_METAMODEL<TRes>
    implements CopyWith$Mutation$UPDATE_METAMODEL<TRes> {
  _CopyWithImpl$Mutation$UPDATE_METAMODEL(this._instance, this._then);

  final Mutation$UPDATE_METAMODEL _instance;

  final TRes Function(Mutation$UPDATE_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMetamodel = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_METAMODEL(
      updateMetamodel: updateMetamodel == _undefined || updateMetamodel == null
          ? _instance.updateMetamodel
          : (updateMetamodel as Mutation$UPDATE_METAMODEL$updateMetamodel),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes> get updateMetamodel {
    final local$updateMetamodel = _instance.updateMetamodel;
    return CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel(
      local$updateMetamodel,
      (e) => call(updateMetamodel: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UPDATE_METAMODEL<TRes>
    implements CopyWith$Mutation$UPDATE_METAMODEL<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_METAMODEL(this._res);

  TRes _res;

  call({
    Mutation$UPDATE_METAMODEL$updateMetamodel? updateMetamodel,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes>
  get updateMetamodel =>
      CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel.stub(_res);
}

const documentNodeMutationUPDATE_METAMODEL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UPDATE_METAMODEL'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'data')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdateMetamodelInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateMetamodel'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'data'),
                value: VariableNode(name: NameNode(value: 'data')),
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

class Mutation$UPDATE_METAMODEL$updateMetamodel {
  Mutation$UPDATE_METAMODEL$updateMetamodel({
    required this.id,
    required this.type,
    required this.metadata,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Mutation$UPDATE_METAMODEL$updateMetamodel.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_METAMODEL$updateMetamodel(
      id: (l$id as String),
      type: fromJson$Enum$MetamodelType((l$type as String)),
      metadata: (l$metadata as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$MetamodelType type;

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
    final l$metadata = metadata;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
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
    if (other is! Mutation$UPDATE_METAMODEL$updateMetamodel ||
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

extension UtilityExtension$Mutation$UPDATE_METAMODEL$updateMetamodel
    on Mutation$UPDATE_METAMODEL$updateMetamodel {
  CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<
    Mutation$UPDATE_METAMODEL$updateMetamodel
  >
  get copyWith =>
      CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes> {
  factory CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel(
    Mutation$UPDATE_METAMODEL$updateMetamodel instance,
    TRes Function(Mutation$UPDATE_METAMODEL$updateMetamodel) then,
  ) = _CopyWithImpl$Mutation$UPDATE_METAMODEL$updateMetamodel;

  factory CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_METAMODEL$updateMetamodel;

  TRes call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes>
    implements CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes> {
  _CopyWithImpl$Mutation$UPDATE_METAMODEL$updateMetamodel(
    this._instance,
    this._then,
  );

  final Mutation$UPDATE_METAMODEL$updateMetamodel _instance;

  final TRes Function(Mutation$UPDATE_METAMODEL$updateMetamodel) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? metadata = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_METAMODEL$updateMetamodel(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MetamodelType),
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

class _CopyWithStubImpl$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes>
    implements CopyWith$Mutation$UPDATE_METAMODEL$updateMetamodel<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_METAMODEL$updateMetamodel(this._res);

  TRes _res;

  call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
