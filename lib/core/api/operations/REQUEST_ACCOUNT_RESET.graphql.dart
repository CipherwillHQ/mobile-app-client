import 'package:gql/ast.dart';

class Mutation$REQUEST_ACCOUNT_RESET {
  Mutation$REQUEST_ACCOUNT_RESET({
    required this.requestAccountReset,
    this.$__typename = 'Mutation',
  });

  factory Mutation$REQUEST_ACCOUNT_RESET.fromJson(Map<String, dynamic> json) {
    final l$requestAccountReset = json['requestAccountReset'];
    final l$$__typename = json['__typename'];
    return Mutation$REQUEST_ACCOUNT_RESET(
      requestAccountReset: (l$requestAccountReset as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool requestAccountReset;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestAccountReset = requestAccountReset;
    _resultData['requestAccountReset'] = l$requestAccountReset;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestAccountReset = requestAccountReset;
    final l$$__typename = $__typename;
    return Object.hashAll([l$requestAccountReset, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REQUEST_ACCOUNT_RESET ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestAccountReset = requestAccountReset;
    final lOther$requestAccountReset = other.requestAccountReset;
    if (l$requestAccountReset != lOther$requestAccountReset) {
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

extension UtilityExtension$Mutation$REQUEST_ACCOUNT_RESET
    on Mutation$REQUEST_ACCOUNT_RESET {
  CopyWith$Mutation$REQUEST_ACCOUNT_RESET<Mutation$REQUEST_ACCOUNT_RESET>
  get copyWith => CopyWith$Mutation$REQUEST_ACCOUNT_RESET(this, (i) => i);
}

abstract class CopyWith$Mutation$REQUEST_ACCOUNT_RESET<TRes> {
  factory CopyWith$Mutation$REQUEST_ACCOUNT_RESET(
    Mutation$REQUEST_ACCOUNT_RESET instance,
    TRes Function(Mutation$REQUEST_ACCOUNT_RESET) then,
  ) = _CopyWithImpl$Mutation$REQUEST_ACCOUNT_RESET;

  factory CopyWith$Mutation$REQUEST_ACCOUNT_RESET.stub(TRes res) =
      _CopyWithStubImpl$Mutation$REQUEST_ACCOUNT_RESET;

  TRes call({bool? requestAccountReset, String? $__typename});
}

class _CopyWithImpl$Mutation$REQUEST_ACCOUNT_RESET<TRes>
    implements CopyWith$Mutation$REQUEST_ACCOUNT_RESET<TRes> {
  _CopyWithImpl$Mutation$REQUEST_ACCOUNT_RESET(this._instance, this._then);

  final Mutation$REQUEST_ACCOUNT_RESET _instance;

  final TRes Function(Mutation$REQUEST_ACCOUNT_RESET) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? requestAccountReset = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REQUEST_ACCOUNT_RESET(
      requestAccountReset:
          requestAccountReset == _undefined || requestAccountReset == null
          ? _instance.requestAccountReset
          : (requestAccountReset as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$REQUEST_ACCOUNT_RESET<TRes>
    implements CopyWith$Mutation$REQUEST_ACCOUNT_RESET<TRes> {
  _CopyWithStubImpl$Mutation$REQUEST_ACCOUNT_RESET(this._res);

  TRes _res;

  call({bool? requestAccountReset, String? $__typename}) => _res;
}

const documentNodeMutationREQUEST_ACCOUNT_RESET = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'REQUEST_ACCOUNT_RESET'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'requestAccountReset'),
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
