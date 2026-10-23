import 'package:gql/ast.dart';

class Variables$Mutation$UPDATE_FACTOR {
  factory Variables$Mutation$UPDATE_FACTOR({
    required String id,
    required String name,
  }) => Variables$Mutation$UPDATE_FACTOR._({r'id': id, r'name': name});

  Variables$Mutation$UPDATE_FACTOR._(this._$data);

  factory Variables$Mutation$UPDATE_FACTOR.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    return Variables$Mutation$UPDATE_FACTOR._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get name => (_$data['name'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$name = name;
    result$data['name'] = l$name;
    return result$data;
  }

  CopyWith$Variables$Mutation$UPDATE_FACTOR<Variables$Mutation$UPDATE_FACTOR>
  get copyWith => CopyWith$Variables$Mutation$UPDATE_FACTOR(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UPDATE_FACTOR ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([l$id, l$name]);
  }
}

abstract class CopyWith$Variables$Mutation$UPDATE_FACTOR<TRes> {
  factory CopyWith$Variables$Mutation$UPDATE_FACTOR(
    Variables$Mutation$UPDATE_FACTOR instance,
    TRes Function(Variables$Mutation$UPDATE_FACTOR) then,
  ) = _CopyWithImpl$Variables$Mutation$UPDATE_FACTOR;

  factory CopyWith$Variables$Mutation$UPDATE_FACTOR.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UPDATE_FACTOR;

  TRes call({String? id, String? name});
}

class _CopyWithImpl$Variables$Mutation$UPDATE_FACTOR<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_FACTOR<TRes> {
  _CopyWithImpl$Variables$Mutation$UPDATE_FACTOR(this._instance, this._then);

  final Variables$Mutation$UPDATE_FACTOR _instance;

  final TRes Function(Variables$Mutation$UPDATE_FACTOR) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? name = _undefined}) => _then(
    Variables$Mutation$UPDATE_FACTOR._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined && name != null) 'name': (name as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UPDATE_FACTOR<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_FACTOR<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UPDATE_FACTOR(this._res);

  TRes _res;

  call({String? id, String? name}) => _res;
}

class Mutation$UPDATE_FACTOR {
  Mutation$UPDATE_FACTOR({
    required this.updateFactor,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UPDATE_FACTOR.fromJson(Map<String, dynamic> json) {
    final l$updateFactor = json['updateFactor'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_FACTOR(
      updateFactor: Mutation$UPDATE_FACTOR$updateFactor.fromJson(
        (l$updateFactor as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UPDATE_FACTOR$updateFactor updateFactor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateFactor = updateFactor;
    _resultData['updateFactor'] = l$updateFactor.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateFactor = updateFactor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateFactor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPDATE_FACTOR || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateFactor = updateFactor;
    final lOther$updateFactor = other.updateFactor;
    if (l$updateFactor != lOther$updateFactor) {
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

extension UtilityExtension$Mutation$UPDATE_FACTOR on Mutation$UPDATE_FACTOR {
  CopyWith$Mutation$UPDATE_FACTOR<Mutation$UPDATE_FACTOR> get copyWith =>
      CopyWith$Mutation$UPDATE_FACTOR(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_FACTOR<TRes> {
  factory CopyWith$Mutation$UPDATE_FACTOR(
    Mutation$UPDATE_FACTOR instance,
    TRes Function(Mutation$UPDATE_FACTOR) then,
  ) = _CopyWithImpl$Mutation$UPDATE_FACTOR;

  factory CopyWith$Mutation$UPDATE_FACTOR.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_FACTOR;

  TRes call({
    Mutation$UPDATE_FACTOR$updateFactor? updateFactor,
    String? $__typename,
  });
  CopyWith$Mutation$UPDATE_FACTOR$updateFactor<TRes> get updateFactor;
}

class _CopyWithImpl$Mutation$UPDATE_FACTOR<TRes>
    implements CopyWith$Mutation$UPDATE_FACTOR<TRes> {
  _CopyWithImpl$Mutation$UPDATE_FACTOR(this._instance, this._then);

  final Mutation$UPDATE_FACTOR _instance;

  final TRes Function(Mutation$UPDATE_FACTOR) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateFactor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_FACTOR(
      updateFactor: updateFactor == _undefined || updateFactor == null
          ? _instance.updateFactor
          : (updateFactor as Mutation$UPDATE_FACTOR$updateFactor),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UPDATE_FACTOR$updateFactor<TRes> get updateFactor {
    final local$updateFactor = _instance.updateFactor;
    return CopyWith$Mutation$UPDATE_FACTOR$updateFactor(
      local$updateFactor,
      (e) => call(updateFactor: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UPDATE_FACTOR<TRes>
    implements CopyWith$Mutation$UPDATE_FACTOR<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_FACTOR(this._res);

  TRes _res;

  call({
    Mutation$UPDATE_FACTOR$updateFactor? updateFactor,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UPDATE_FACTOR$updateFactor<TRes> get updateFactor =>
      CopyWith$Mutation$UPDATE_FACTOR$updateFactor.stub(_res);
}

const documentNodeMutationUPDATE_FACTOR = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UPDATE_FACTOR'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'name')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateFactor'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'name')),
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
                  name: NameNode(value: 'name'),
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

class Mutation$UPDATE_FACTOR$updateFactor {
  Mutation$UPDATE_FACTOR$updateFactor({
    required this.id,
    required this.name,
    required this.updated_at,
    this.$__typename = 'AuthFactor',
  });

  factory Mutation$UPDATE_FACTOR$updateFactor.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_FACTOR$updateFactor(
      id: (l$id as String),
      name: (l$name as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$updated_at, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPDATE_FACTOR$updateFactor ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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

extension UtilityExtension$Mutation$UPDATE_FACTOR$updateFactor
    on Mutation$UPDATE_FACTOR$updateFactor {
  CopyWith$Mutation$UPDATE_FACTOR$updateFactor<
    Mutation$UPDATE_FACTOR$updateFactor
  >
  get copyWith => CopyWith$Mutation$UPDATE_FACTOR$updateFactor(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_FACTOR$updateFactor<TRes> {
  factory CopyWith$Mutation$UPDATE_FACTOR$updateFactor(
    Mutation$UPDATE_FACTOR$updateFactor instance,
    TRes Function(Mutation$UPDATE_FACTOR$updateFactor) then,
  ) = _CopyWithImpl$Mutation$UPDATE_FACTOR$updateFactor;

  factory CopyWith$Mutation$UPDATE_FACTOR$updateFactor.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_FACTOR$updateFactor;

  TRes call({
    String? id,
    String? name,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UPDATE_FACTOR$updateFactor<TRes>
    implements CopyWith$Mutation$UPDATE_FACTOR$updateFactor<TRes> {
  _CopyWithImpl$Mutation$UPDATE_FACTOR$updateFactor(this._instance, this._then);

  final Mutation$UPDATE_FACTOR$updateFactor _instance;

  final TRes Function(Mutation$UPDATE_FACTOR$updateFactor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_FACTOR$updateFactor(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      updated_at: updated_at == _undefined || updated_at == null
          ? _instance.updated_at
          : (updated_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UPDATE_FACTOR$updateFactor<TRes>
    implements CopyWith$Mutation$UPDATE_FACTOR$updateFactor<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_FACTOR$updateFactor(this._res);

  TRes _res;

  call({String? id, String? name, String? updated_at, String? $__typename}) =>
      _res;
}
