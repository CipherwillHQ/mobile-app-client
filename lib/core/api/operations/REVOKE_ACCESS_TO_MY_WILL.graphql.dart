import 'package:gql/ast.dart';

class Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL {
  factory Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL({required String id}) =>
      Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL._({r'id': id});

  Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL._(this._$data);

  factory Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL<
    Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL
  >
  get copyWith =>
      CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL ||
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

abstract class CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes> {
  factory CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL(
    Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL instance,
    TRes Function(Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL) then,
  ) = _CopyWithImpl$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL;

  factory CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes>
    implements CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes> {
  _CopyWithImpl$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL(
    this._instance,
    this._then,
  );

  final Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL _instance;

  final TRes Function(Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes>
    implements CopyWith$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes> {
  _CopyWithStubImpl$Variables$Mutation$REVOKE_ACCESS_TO_MY_WILL(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$REVOKE_ACCESS_TO_MY_WILL {
  Mutation$REVOKE_ACCESS_TO_MY_WILL({
    this.revokeAccessToMyWill,
    this.$__typename = 'Mutation',
  });

  factory Mutation$REVOKE_ACCESS_TO_MY_WILL.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$revokeAccessToMyWill = json['revokeAccessToMyWill'];
    final l$$__typename = json['__typename'];
    return Mutation$REVOKE_ACCESS_TO_MY_WILL(
      revokeAccessToMyWill: (l$revokeAccessToMyWill as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? revokeAccessToMyWill;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$revokeAccessToMyWill = revokeAccessToMyWill;
    _resultData['revokeAccessToMyWill'] = l$revokeAccessToMyWill;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$revokeAccessToMyWill = revokeAccessToMyWill;
    final l$$__typename = $__typename;
    return Object.hashAll([l$revokeAccessToMyWill, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REVOKE_ACCESS_TO_MY_WILL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$revokeAccessToMyWill = revokeAccessToMyWill;
    final lOther$revokeAccessToMyWill = other.revokeAccessToMyWill;
    if (l$revokeAccessToMyWill != lOther$revokeAccessToMyWill) {
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

extension UtilityExtension$Mutation$REVOKE_ACCESS_TO_MY_WILL
    on Mutation$REVOKE_ACCESS_TO_MY_WILL {
  CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL<Mutation$REVOKE_ACCESS_TO_MY_WILL>
  get copyWith => CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL(this, (i) => i);
}

abstract class CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes> {
  factory CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL(
    Mutation$REVOKE_ACCESS_TO_MY_WILL instance,
    TRes Function(Mutation$REVOKE_ACCESS_TO_MY_WILL) then,
  ) = _CopyWithImpl$Mutation$REVOKE_ACCESS_TO_MY_WILL;

  factory CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL.stub(TRes res) =
      _CopyWithStubImpl$Mutation$REVOKE_ACCESS_TO_MY_WILL;

  TRes call({bool? revokeAccessToMyWill, String? $__typename});
}

class _CopyWithImpl$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes>
    implements CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes> {
  _CopyWithImpl$Mutation$REVOKE_ACCESS_TO_MY_WILL(this._instance, this._then);

  final Mutation$REVOKE_ACCESS_TO_MY_WILL _instance;

  final TRes Function(Mutation$REVOKE_ACCESS_TO_MY_WILL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? revokeAccessToMyWill = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REVOKE_ACCESS_TO_MY_WILL(
      revokeAccessToMyWill: revokeAccessToMyWill == _undefined
          ? _instance.revokeAccessToMyWill
          : (revokeAccessToMyWill as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes>
    implements CopyWith$Mutation$REVOKE_ACCESS_TO_MY_WILL<TRes> {
  _CopyWithStubImpl$Mutation$REVOKE_ACCESS_TO_MY_WILL(this._res);

  TRes _res;

  call({bool? revokeAccessToMyWill, String? $__typename}) => _res;
}

const documentNodeMutationREVOKE_ACCESS_TO_MY_WILL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'REVOKE_ACCESS_TO_MY_WILL'),
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
            name: NameNode(value: 'revokeAccessToMyWill'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
