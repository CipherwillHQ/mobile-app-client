import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY {
  factory Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY({
    required String publicKey,
  }) =>
      Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY._({r'publicKey': publicKey});

  Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY._(this._$data);

  factory Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$publicKey = data['publicKey'];
    result$data['publicKey'] = (l$publicKey as String);
    return Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get publicKey => (_$data['publicKey'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$publicKey = publicKey;
    result$data['publicKey'] = l$publicKey;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY<
    Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$publicKey = publicKey;
    return Object.hashAll([l$publicKey]);
  }
}

abstract class CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY(
    Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY instance,
    TRes Function(Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY;

  factory CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY;

  TRes call({String? publicKey});
}

class _CopyWithImpl$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY _instance;

  final TRes Function(Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? publicKey = _undefined}) => _then(
    Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY._({
      ..._instance._$data,
      if (publicKey != _undefined && publicKey != null)
        'publicKey': (publicKey as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_KEY_BY_PUBLIC_KEY(this._res);

  TRes _res;

  call({String? publicKey}) => _res;
}

class Mutation$DELETE_KEY_BY_PUBLIC_KEY {
  Mutation$DELETE_KEY_BY_PUBLIC_KEY({
    this.deleteKeyForPublicKey,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_KEY_BY_PUBLIC_KEY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$deleteKeyForPublicKey = json['deleteKeyForPublicKey'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_KEY_BY_PUBLIC_KEY(
      deleteKeyForPublicKey: (l$deleteKeyForPublicKey as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteKeyForPublicKey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteKeyForPublicKey = deleteKeyForPublicKey;
    _resultData['deleteKeyForPublicKey'] = l$deleteKeyForPublicKey;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteKeyForPublicKey = deleteKeyForPublicKey;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteKeyForPublicKey, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_KEY_BY_PUBLIC_KEY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteKeyForPublicKey = deleteKeyForPublicKey;
    final lOther$deleteKeyForPublicKey = other.deleteKeyForPublicKey;
    if (l$deleteKeyForPublicKey != lOther$deleteKeyForPublicKey) {
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

extension UtilityExtension$Mutation$DELETE_KEY_BY_PUBLIC_KEY
    on Mutation$DELETE_KEY_BY_PUBLIC_KEY {
  CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY<Mutation$DELETE_KEY_BY_PUBLIC_KEY>
  get copyWith => CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes> {
  factory CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY(
    Mutation$DELETE_KEY_BY_PUBLIC_KEY instance,
    TRes Function(Mutation$DELETE_KEY_BY_PUBLIC_KEY) then,
  ) = _CopyWithImpl$Mutation$DELETE_KEY_BY_PUBLIC_KEY;

  factory CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_KEY_BY_PUBLIC_KEY;

  TRes call({bool? deleteKeyForPublicKey, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes> {
  _CopyWithImpl$Mutation$DELETE_KEY_BY_PUBLIC_KEY(this._instance, this._then);

  final Mutation$DELETE_KEY_BY_PUBLIC_KEY _instance;

  final TRes Function(Mutation$DELETE_KEY_BY_PUBLIC_KEY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteKeyForPublicKey = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_KEY_BY_PUBLIC_KEY(
      deleteKeyForPublicKey: deleteKeyForPublicKey == _undefined
          ? _instance.deleteKeyForPublicKey
          : (deleteKeyForPublicKey as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Mutation$DELETE_KEY_BY_PUBLIC_KEY<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_KEY_BY_PUBLIC_KEY(this._res);

  TRes _res;

  call({bool? deleteKeyForPublicKey, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_KEY_BY_PUBLIC_KEY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_KEY_BY_PUBLIC_KEY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'publicKey')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteKeyForPublicKey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'publicKey'),
                value: VariableNode(name: NameNode(value: 'publicKey')),
              ),
            ],
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
  ],
);
