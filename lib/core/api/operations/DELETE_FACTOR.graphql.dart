import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_FACTOR {
  factory Variables$Mutation$DELETE_FACTOR({required String id}) =>
      Variables$Mutation$DELETE_FACTOR._({r'id': id});

  Variables$Mutation$DELETE_FACTOR._(this._$data);

  factory Variables$Mutation$DELETE_FACTOR.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DELETE_FACTOR._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_FACTOR<Variables$Mutation$DELETE_FACTOR>
  get copyWith => CopyWith$Variables$Mutation$DELETE_FACTOR(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_FACTOR ||
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

abstract class CopyWith$Variables$Mutation$DELETE_FACTOR<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_FACTOR(
    Variables$Mutation$DELETE_FACTOR instance,
    TRes Function(Variables$Mutation$DELETE_FACTOR) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_FACTOR;

  factory CopyWith$Variables$Mutation$DELETE_FACTOR.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DELETE_FACTOR;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_FACTOR<TRes>
    implements CopyWith$Variables$Mutation$DELETE_FACTOR<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_FACTOR(this._instance, this._then);

  final Variables$Mutation$DELETE_FACTOR _instance;

  final TRes Function(Variables$Mutation$DELETE_FACTOR) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DELETE_FACTOR._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_FACTOR<TRes>
    implements CopyWith$Variables$Mutation$DELETE_FACTOR<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_FACTOR(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DELETE_FACTOR {
  Mutation$DELETE_FACTOR({
    required this.deleteFactor,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_FACTOR.fromJson(Map<String, dynamic> json) {
    final l$deleteFactor = json['deleteFactor'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_FACTOR(
      deleteFactor: Mutation$DELETE_FACTOR$deleteFactor.fromJson(
        (l$deleteFactor as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DELETE_FACTOR$deleteFactor deleteFactor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFactor = deleteFactor;
    _resultData['deleteFactor'] = l$deleteFactor.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFactor = deleteFactor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFactor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_FACTOR || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFactor = deleteFactor;
    final lOther$deleteFactor = other.deleteFactor;
    if (l$deleteFactor != lOther$deleteFactor) {
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

extension UtilityExtension$Mutation$DELETE_FACTOR on Mutation$DELETE_FACTOR {
  CopyWith$Mutation$DELETE_FACTOR<Mutation$DELETE_FACTOR> get copyWith =>
      CopyWith$Mutation$DELETE_FACTOR(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_FACTOR<TRes> {
  factory CopyWith$Mutation$DELETE_FACTOR(
    Mutation$DELETE_FACTOR instance,
    TRes Function(Mutation$DELETE_FACTOR) then,
  ) = _CopyWithImpl$Mutation$DELETE_FACTOR;

  factory CopyWith$Mutation$DELETE_FACTOR.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_FACTOR;

  TRes call({
    Mutation$DELETE_FACTOR$deleteFactor? deleteFactor,
    String? $__typename,
  });
  CopyWith$Mutation$DELETE_FACTOR$deleteFactor<TRes> get deleteFactor;
}

class _CopyWithImpl$Mutation$DELETE_FACTOR<TRes>
    implements CopyWith$Mutation$DELETE_FACTOR<TRes> {
  _CopyWithImpl$Mutation$DELETE_FACTOR(this._instance, this._then);

  final Mutation$DELETE_FACTOR _instance;

  final TRes Function(Mutation$DELETE_FACTOR) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteFactor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_FACTOR(
      deleteFactor: deleteFactor == _undefined || deleteFactor == null
          ? _instance.deleteFactor
          : (deleteFactor as Mutation$DELETE_FACTOR$deleteFactor),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DELETE_FACTOR$deleteFactor<TRes> get deleteFactor {
    final local$deleteFactor = _instance.deleteFactor;
    return CopyWith$Mutation$DELETE_FACTOR$deleteFactor(
      local$deleteFactor,
      (e) => call(deleteFactor: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$DELETE_FACTOR<TRes>
    implements CopyWith$Mutation$DELETE_FACTOR<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_FACTOR(this._res);

  TRes _res;

  call({
    Mutation$DELETE_FACTOR$deleteFactor? deleteFactor,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DELETE_FACTOR$deleteFactor<TRes> get deleteFactor =>
      CopyWith$Mutation$DELETE_FACTOR$deleteFactor.stub(_res);
}

const documentNodeMutationDELETE_FACTOR = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_FACTOR'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteFactor'),
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

class Mutation$DELETE_FACTOR$deleteFactor {
  Mutation$DELETE_FACTOR$deleteFactor({
    required this.id,
    this.$__typename = 'AuthFactor',
  });

  factory Mutation$DELETE_FACTOR$deleteFactor.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_FACTOR$deleteFactor(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_FACTOR$deleteFactor ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$DELETE_FACTOR$deleteFactor
    on Mutation$DELETE_FACTOR$deleteFactor {
  CopyWith$Mutation$DELETE_FACTOR$deleteFactor<
    Mutation$DELETE_FACTOR$deleteFactor
  >
  get copyWith => CopyWith$Mutation$DELETE_FACTOR$deleteFactor(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_FACTOR$deleteFactor<TRes> {
  factory CopyWith$Mutation$DELETE_FACTOR$deleteFactor(
    Mutation$DELETE_FACTOR$deleteFactor instance,
    TRes Function(Mutation$DELETE_FACTOR$deleteFactor) then,
  ) = _CopyWithImpl$Mutation$DELETE_FACTOR$deleteFactor;

  factory CopyWith$Mutation$DELETE_FACTOR$deleteFactor.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_FACTOR$deleteFactor;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_FACTOR$deleteFactor<TRes>
    implements CopyWith$Mutation$DELETE_FACTOR$deleteFactor<TRes> {
  _CopyWithImpl$Mutation$DELETE_FACTOR$deleteFactor(this._instance, this._then);

  final Mutation$DELETE_FACTOR$deleteFactor _instance;

  final TRes Function(Mutation$DELETE_FACTOR$deleteFactor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DELETE_FACTOR$deleteFactor(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DELETE_FACTOR$deleteFactor<TRes>
    implements CopyWith$Mutation$DELETE_FACTOR$deleteFactor<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_FACTOR$deleteFactor(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
