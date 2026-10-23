import 'package:gql/ast.dart';

class Variables$Mutation$CREATE_FACTOR {
  factory Variables$Mutation$CREATE_FACTOR({
    required String name,
    required String type,
    required String publicKey,
    required String nonce,
  }) => Variables$Mutation$CREATE_FACTOR._({
    r'name': name,
    r'type': type,
    r'publicKey': publicKey,
    r'nonce': nonce,
  });

  Variables$Mutation$CREATE_FACTOR._(this._$data);

  factory Variables$Mutation$CREATE_FACTOR.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$type = data['type'];
    result$data['type'] = (l$type as String);
    final l$publicKey = data['publicKey'];
    result$data['publicKey'] = (l$publicKey as String);
    final l$nonce = data['nonce'];
    result$data['nonce'] = (l$nonce as String);
    return Variables$Mutation$CREATE_FACTOR._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get type => (_$data['type'] as String);

  String get publicKey => (_$data['publicKey'] as String);

  String get nonce => (_$data['nonce'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$type = type;
    result$data['type'] = l$type;
    final l$publicKey = publicKey;
    result$data['publicKey'] = l$publicKey;
    final l$nonce = nonce;
    result$data['nonce'] = l$nonce;
    return result$data;
  }

  CopyWith$Variables$Mutation$CREATE_FACTOR<Variables$Mutation$CREATE_FACTOR>
  get copyWith => CopyWith$Variables$Mutation$CREATE_FACTOR(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CREATE_FACTOR ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$nonce = nonce;
    final lOther$nonce = other.nonce;
    if (l$nonce != lOther$nonce) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$type = type;
    final l$publicKey = publicKey;
    final l$nonce = nonce;
    return Object.hashAll([l$name, l$type, l$publicKey, l$nonce]);
  }
}

abstract class CopyWith$Variables$Mutation$CREATE_FACTOR<TRes> {
  factory CopyWith$Variables$Mutation$CREATE_FACTOR(
    Variables$Mutation$CREATE_FACTOR instance,
    TRes Function(Variables$Mutation$CREATE_FACTOR) then,
  ) = _CopyWithImpl$Variables$Mutation$CREATE_FACTOR;

  factory CopyWith$Variables$Mutation$CREATE_FACTOR.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CREATE_FACTOR;

  TRes call({String? name, String? type, String? publicKey, String? nonce});
}

class _CopyWithImpl$Variables$Mutation$CREATE_FACTOR<TRes>
    implements CopyWith$Variables$Mutation$CREATE_FACTOR<TRes> {
  _CopyWithImpl$Variables$Mutation$CREATE_FACTOR(this._instance, this._then);

  final Variables$Mutation$CREATE_FACTOR _instance;

  final TRes Function(Variables$Mutation$CREATE_FACTOR) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? publicKey = _undefined,
    Object? nonce = _undefined,
  }) => _then(
    Variables$Mutation$CREATE_FACTOR._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (type != _undefined && type != null) 'type': (type as String),
      if (publicKey != _undefined && publicKey != null)
        'publicKey': (publicKey as String),
      if (nonce != _undefined && nonce != null) 'nonce': (nonce as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CREATE_FACTOR<TRes>
    implements CopyWith$Variables$Mutation$CREATE_FACTOR<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CREATE_FACTOR(this._res);

  TRes _res;

  call({String? name, String? type, String? publicKey, String? nonce}) => _res;
}

class Mutation$CREATE_FACTOR {
  Mutation$CREATE_FACTOR({
    required this.createFactor,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CREATE_FACTOR.fromJson(Map<String, dynamic> json) {
    final l$createFactor = json['createFactor'];
    final l$$__typename = json['__typename'];
    return Mutation$CREATE_FACTOR(
      createFactor: Mutation$CREATE_FACTOR$createFactor.fromJson(
        (l$createFactor as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CREATE_FACTOR$createFactor createFactor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFactor = createFactor;
    _resultData['createFactor'] = l$createFactor.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFactor = createFactor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createFactor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CREATE_FACTOR || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFactor = createFactor;
    final lOther$createFactor = other.createFactor;
    if (l$createFactor != lOther$createFactor) {
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

extension UtilityExtension$Mutation$CREATE_FACTOR on Mutation$CREATE_FACTOR {
  CopyWith$Mutation$CREATE_FACTOR<Mutation$CREATE_FACTOR> get copyWith =>
      CopyWith$Mutation$CREATE_FACTOR(this, (i) => i);
}

abstract class CopyWith$Mutation$CREATE_FACTOR<TRes> {
  factory CopyWith$Mutation$CREATE_FACTOR(
    Mutation$CREATE_FACTOR instance,
    TRes Function(Mutation$CREATE_FACTOR) then,
  ) = _CopyWithImpl$Mutation$CREATE_FACTOR;

  factory CopyWith$Mutation$CREATE_FACTOR.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CREATE_FACTOR;

  TRes call({
    Mutation$CREATE_FACTOR$createFactor? createFactor,
    String? $__typename,
  });
  CopyWith$Mutation$CREATE_FACTOR$createFactor<TRes> get createFactor;
}

class _CopyWithImpl$Mutation$CREATE_FACTOR<TRes>
    implements CopyWith$Mutation$CREATE_FACTOR<TRes> {
  _CopyWithImpl$Mutation$CREATE_FACTOR(this._instance, this._then);

  final Mutation$CREATE_FACTOR _instance;

  final TRes Function(Mutation$CREATE_FACTOR) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFactor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CREATE_FACTOR(
      createFactor: createFactor == _undefined || createFactor == null
          ? _instance.createFactor
          : (createFactor as Mutation$CREATE_FACTOR$createFactor),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CREATE_FACTOR$createFactor<TRes> get createFactor {
    final local$createFactor = _instance.createFactor;
    return CopyWith$Mutation$CREATE_FACTOR$createFactor(
      local$createFactor,
      (e) => call(createFactor: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CREATE_FACTOR<TRes>
    implements CopyWith$Mutation$CREATE_FACTOR<TRes> {
  _CopyWithStubImpl$Mutation$CREATE_FACTOR(this._res);

  TRes _res;

  call({
    Mutation$CREATE_FACTOR$createFactor? createFactor,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CREATE_FACTOR$createFactor<TRes> get createFactor =>
      CopyWith$Mutation$CREATE_FACTOR$createFactor.stub(_res);
}

const documentNodeMutationCREATE_FACTOR = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CREATE_FACTOR'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'name')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'type')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'publicKey')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'nonce')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createFactor'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'name')),
              ),
              ArgumentNode(
                name: NameNode(value: 'type'),
                value: VariableNode(name: NameNode(value: 'type')),
              ),
              ArgumentNode(
                name: NameNode(value: 'publicKey'),
                value: VariableNode(name: NameNode(value: 'publicKey')),
              ),
              ArgumentNode(
                name: NameNode(value: 'nonce'),
                value: VariableNode(name: NameNode(value: 'nonce')),
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
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'publicKey'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'nonce'),
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

class Mutation$CREATE_FACTOR$createFactor {
  Mutation$CREATE_FACTOR$createFactor({
    required this.id,
    required this.name,
    required this.type,
    required this.publicKey,
    required this.nonce,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'AuthFactor',
  });

  factory Mutation$CREATE_FACTOR$createFactor.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$type = json['type'];
    final l$publicKey = json['publicKey'];
    final l$nonce = json['nonce'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$CREATE_FACTOR$createFactor(
      id: (l$id as String),
      name: (l$name as String),
      type: (l$type as String),
      publicKey: (l$publicKey as String),
      nonce: (l$nonce as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String type;

  final String publicKey;

  final String nonce;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$nonce = nonce;
    _resultData['nonce'] = l$nonce;
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
    final l$name = name;
    final l$type = type;
    final l$publicKey = publicKey;
    final l$nonce = nonce;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$type,
      l$publicKey,
      l$nonce,
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
    if (other is! Mutation$CREATE_FACTOR$createFactor ||
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
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$nonce = nonce;
    final lOther$nonce = other.nonce;
    if (l$nonce != lOther$nonce) {
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

extension UtilityExtension$Mutation$CREATE_FACTOR$createFactor
    on Mutation$CREATE_FACTOR$createFactor {
  CopyWith$Mutation$CREATE_FACTOR$createFactor<
    Mutation$CREATE_FACTOR$createFactor
  >
  get copyWith => CopyWith$Mutation$CREATE_FACTOR$createFactor(this, (i) => i);
}

abstract class CopyWith$Mutation$CREATE_FACTOR$createFactor<TRes> {
  factory CopyWith$Mutation$CREATE_FACTOR$createFactor(
    Mutation$CREATE_FACTOR$createFactor instance,
    TRes Function(Mutation$CREATE_FACTOR$createFactor) then,
  ) = _CopyWithImpl$Mutation$CREATE_FACTOR$createFactor;

  factory CopyWith$Mutation$CREATE_FACTOR$createFactor.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CREATE_FACTOR$createFactor;

  TRes call({
    String? id,
    String? name,
    String? type,
    String? publicKey,
    String? nonce,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CREATE_FACTOR$createFactor<TRes>
    implements CopyWith$Mutation$CREATE_FACTOR$createFactor<TRes> {
  _CopyWithImpl$Mutation$CREATE_FACTOR$createFactor(this._instance, this._then);

  final Mutation$CREATE_FACTOR$createFactor _instance;

  final TRes Function(Mutation$CREATE_FACTOR$createFactor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? type = _undefined,
    Object? publicKey = _undefined,
    Object? nonce = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CREATE_FACTOR$createFactor(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      nonce: nonce == _undefined || nonce == null
          ? _instance.nonce
          : (nonce as String),
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

class _CopyWithStubImpl$Mutation$CREATE_FACTOR$createFactor<TRes>
    implements CopyWith$Mutation$CREATE_FACTOR$createFactor<TRes> {
  _CopyWithStubImpl$Mutation$CREATE_FACTOR$createFactor(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? type,
    String? publicKey,
    String? nonce,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
