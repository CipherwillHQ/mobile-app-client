import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_METAMODEL {
  factory Variables$Mutation$DELETE_METAMODEL({required String id}) =>
      Variables$Mutation$DELETE_METAMODEL._({r'id': id});

  Variables$Mutation$DELETE_METAMODEL._(this._$data);

  factory Variables$Mutation$DELETE_METAMODEL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DELETE_METAMODEL._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_METAMODEL<
    Variables$Mutation$DELETE_METAMODEL
  >
  get copyWith => CopyWith$Variables$Mutation$DELETE_METAMODEL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_METAMODEL ||
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

abstract class CopyWith$Variables$Mutation$DELETE_METAMODEL<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_METAMODEL(
    Variables$Mutation$DELETE_METAMODEL instance,
    TRes Function(Variables$Mutation$DELETE_METAMODEL) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_METAMODEL;

  factory CopyWith$Variables$Mutation$DELETE_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DELETE_METAMODEL;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_METAMODEL<TRes>
    implements CopyWith$Variables$Mutation$DELETE_METAMODEL<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_METAMODEL(this._instance, this._then);

  final Variables$Mutation$DELETE_METAMODEL _instance;

  final TRes Function(Variables$Mutation$DELETE_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DELETE_METAMODEL._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_METAMODEL<TRes>
    implements CopyWith$Variables$Mutation$DELETE_METAMODEL<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_METAMODEL(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DELETE_METAMODEL {
  Mutation$DELETE_METAMODEL({
    required this.deleteMetamodel,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_METAMODEL.fromJson(Map<String, dynamic> json) {
    final l$deleteMetamodel = json['deleteMetamodel'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_METAMODEL(
      deleteMetamodel: Mutation$DELETE_METAMODEL$deleteMetamodel.fromJson(
        (l$deleteMetamodel as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DELETE_METAMODEL$deleteMetamodel deleteMetamodel;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMetamodel = deleteMetamodel;
    _resultData['deleteMetamodel'] = l$deleteMetamodel.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMetamodel = deleteMetamodel;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteMetamodel, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_METAMODEL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMetamodel = deleteMetamodel;
    final lOther$deleteMetamodel = other.deleteMetamodel;
    if (l$deleteMetamodel != lOther$deleteMetamodel) {
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

extension UtilityExtension$Mutation$DELETE_METAMODEL
    on Mutation$DELETE_METAMODEL {
  CopyWith$Mutation$DELETE_METAMODEL<Mutation$DELETE_METAMODEL> get copyWith =>
      CopyWith$Mutation$DELETE_METAMODEL(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_METAMODEL<TRes> {
  factory CopyWith$Mutation$DELETE_METAMODEL(
    Mutation$DELETE_METAMODEL instance,
    TRes Function(Mutation$DELETE_METAMODEL) then,
  ) = _CopyWithImpl$Mutation$DELETE_METAMODEL;

  factory CopyWith$Mutation$DELETE_METAMODEL.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_METAMODEL;

  TRes call({
    Mutation$DELETE_METAMODEL$deleteMetamodel? deleteMetamodel,
    String? $__typename,
  });
  CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes> get deleteMetamodel;
}

class _CopyWithImpl$Mutation$DELETE_METAMODEL<TRes>
    implements CopyWith$Mutation$DELETE_METAMODEL<TRes> {
  _CopyWithImpl$Mutation$DELETE_METAMODEL(this._instance, this._then);

  final Mutation$DELETE_METAMODEL _instance;

  final TRes Function(Mutation$DELETE_METAMODEL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMetamodel = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_METAMODEL(
      deleteMetamodel: deleteMetamodel == _undefined || deleteMetamodel == null
          ? _instance.deleteMetamodel
          : (deleteMetamodel as Mutation$DELETE_METAMODEL$deleteMetamodel),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes> get deleteMetamodel {
    final local$deleteMetamodel = _instance.deleteMetamodel;
    return CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel(
      local$deleteMetamodel,
      (e) => call(deleteMetamodel: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$DELETE_METAMODEL<TRes>
    implements CopyWith$Mutation$DELETE_METAMODEL<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_METAMODEL(this._res);

  TRes _res;

  call({
    Mutation$DELETE_METAMODEL$deleteMetamodel? deleteMetamodel,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes>
  get deleteMetamodel =>
      CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel.stub(_res);
}

const documentNodeMutationDELETE_METAMODEL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_METAMODEL'),
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
            name: NameNode(value: 'deleteMetamodel'),
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
                  name: NameNode(value: 'folder_id'),
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

class Mutation$DELETE_METAMODEL$deleteMetamodel {
  Mutation$DELETE_METAMODEL$deleteMetamodel({
    required this.id,
    required this.folder_id,
    this.$__typename = 'Metamodel',
  });

  factory Mutation$DELETE_METAMODEL$deleteMetamodel.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$folder_id = json['folder_id'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_METAMODEL$deleteMetamodel(
      id: (l$id as String),
      folder_id: (l$folder_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String folder_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$folder_id = folder_id;
    _resultData['folder_id'] = l$folder_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$folder_id = folder_id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$folder_id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_METAMODEL$deleteMetamodel ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$folder_id = folder_id;
    final lOther$folder_id = other.folder_id;
    if (l$folder_id != lOther$folder_id) {
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

extension UtilityExtension$Mutation$DELETE_METAMODEL$deleteMetamodel
    on Mutation$DELETE_METAMODEL$deleteMetamodel {
  CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<
    Mutation$DELETE_METAMODEL$deleteMetamodel
  >
  get copyWith =>
      CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes> {
  factory CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel(
    Mutation$DELETE_METAMODEL$deleteMetamodel instance,
    TRes Function(Mutation$DELETE_METAMODEL$deleteMetamodel) then,
  ) = _CopyWithImpl$Mutation$DELETE_METAMODEL$deleteMetamodel;

  factory CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_METAMODEL$deleteMetamodel;

  TRes call({String? id, String? folder_id, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes>
    implements CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes> {
  _CopyWithImpl$Mutation$DELETE_METAMODEL$deleteMetamodel(
    this._instance,
    this._then,
  );

  final Mutation$DELETE_METAMODEL$deleteMetamodel _instance;

  final TRes Function(Mutation$DELETE_METAMODEL$deleteMetamodel) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? folder_id = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_METAMODEL$deleteMetamodel(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      folder_id: folder_id == _undefined || folder_id == null
          ? _instance.folder_id
          : (folder_id as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes>
    implements CopyWith$Mutation$DELETE_METAMODEL$deleteMetamodel<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_METAMODEL$deleteMetamodel(this._res);

  TRes _res;

  call({String? id, String? folder_id, String? $__typename}) => _res;
}
