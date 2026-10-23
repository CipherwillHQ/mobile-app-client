import 'package:gql/ast.dart';

class Mutation$DELETE_ACCOUNT {
  Mutation$DELETE_ACCOUNT({
    required this.deleteAccount,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_ACCOUNT.fromJson(Map<String, dynamic> json) {
    final l$deleteAccount = json['deleteAccount'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_ACCOUNT(
      deleteAccount: (l$deleteAccount as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteAccount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteAccount = deleteAccount;
    _resultData['deleteAccount'] = l$deleteAccount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteAccount = deleteAccount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteAccount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_ACCOUNT || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteAccount = deleteAccount;
    final lOther$deleteAccount = other.deleteAccount;
    if (l$deleteAccount != lOther$deleteAccount) {
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

extension UtilityExtension$Mutation$DELETE_ACCOUNT on Mutation$DELETE_ACCOUNT {
  CopyWith$Mutation$DELETE_ACCOUNT<Mutation$DELETE_ACCOUNT> get copyWith =>
      CopyWith$Mutation$DELETE_ACCOUNT(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_ACCOUNT<TRes> {
  factory CopyWith$Mutation$DELETE_ACCOUNT(
    Mutation$DELETE_ACCOUNT instance,
    TRes Function(Mutation$DELETE_ACCOUNT) then,
  ) = _CopyWithImpl$Mutation$DELETE_ACCOUNT;

  factory CopyWith$Mutation$DELETE_ACCOUNT.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_ACCOUNT;

  TRes call({bool? deleteAccount, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_ACCOUNT<TRes>
    implements CopyWith$Mutation$DELETE_ACCOUNT<TRes> {
  _CopyWithImpl$Mutation$DELETE_ACCOUNT(this._instance, this._then);

  final Mutation$DELETE_ACCOUNT _instance;

  final TRes Function(Mutation$DELETE_ACCOUNT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteAccount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_ACCOUNT(
      deleteAccount: deleteAccount == _undefined || deleteAccount == null
          ? _instance.deleteAccount
          : (deleteAccount as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_ACCOUNT<TRes>
    implements CopyWith$Mutation$DELETE_ACCOUNT<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_ACCOUNT(this._res);

  TRes _res;

  call({bool? deleteAccount, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_ACCOUNT = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_ACCOUNT'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteAccount'),
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
  ],
);
