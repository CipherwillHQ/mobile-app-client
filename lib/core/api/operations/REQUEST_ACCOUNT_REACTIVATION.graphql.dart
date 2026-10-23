import 'package:gql/ast.dart';

class Mutation$REQUEST_ACCOUNT_REACTIVATION {
  Mutation$REQUEST_ACCOUNT_REACTIVATION({
    required this.requestAccountReactivation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$REQUEST_ACCOUNT_REACTIVATION.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$requestAccountReactivation = json['requestAccountReactivation'];
    final l$$__typename = json['__typename'];
    return Mutation$REQUEST_ACCOUNT_REACTIVATION(
      requestAccountReactivation: (l$requestAccountReactivation as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool requestAccountReactivation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestAccountReactivation = requestAccountReactivation;
    _resultData['requestAccountReactivation'] = l$requestAccountReactivation;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestAccountReactivation = requestAccountReactivation;
    final l$$__typename = $__typename;
    return Object.hashAll([l$requestAccountReactivation, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REQUEST_ACCOUNT_REACTIVATION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestAccountReactivation = requestAccountReactivation;
    final lOther$requestAccountReactivation = other.requestAccountReactivation;
    if (l$requestAccountReactivation != lOther$requestAccountReactivation) {
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

extension UtilityExtension$Mutation$REQUEST_ACCOUNT_REACTIVATION
    on Mutation$REQUEST_ACCOUNT_REACTIVATION {
  CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION<
    Mutation$REQUEST_ACCOUNT_REACTIVATION
  >
  get copyWith =>
      CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION(this, (i) => i);
}

abstract class CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION<TRes> {
  factory CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION(
    Mutation$REQUEST_ACCOUNT_REACTIVATION instance,
    TRes Function(Mutation$REQUEST_ACCOUNT_REACTIVATION) then,
  ) = _CopyWithImpl$Mutation$REQUEST_ACCOUNT_REACTIVATION;

  factory CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$REQUEST_ACCOUNT_REACTIVATION;

  TRes call({bool? requestAccountReactivation, String? $__typename});
}

class _CopyWithImpl$Mutation$REQUEST_ACCOUNT_REACTIVATION<TRes>
    implements CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION<TRes> {
  _CopyWithImpl$Mutation$REQUEST_ACCOUNT_REACTIVATION(
    this._instance,
    this._then,
  );

  final Mutation$REQUEST_ACCOUNT_REACTIVATION _instance;

  final TRes Function(Mutation$REQUEST_ACCOUNT_REACTIVATION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? requestAccountReactivation = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REQUEST_ACCOUNT_REACTIVATION(
      requestAccountReactivation:
          requestAccountReactivation == _undefined ||
              requestAccountReactivation == null
          ? _instance.requestAccountReactivation
          : (requestAccountReactivation as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$REQUEST_ACCOUNT_REACTIVATION<TRes>
    implements CopyWith$Mutation$REQUEST_ACCOUNT_REACTIVATION<TRes> {
  _CopyWithStubImpl$Mutation$REQUEST_ACCOUNT_REACTIVATION(this._res);

  TRes _res;

  call({bool? requestAccountReactivation, String? $__typename}) => _res;
}

const documentNodeMutationREQUEST_ACCOUNT_REACTIVATION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'REQUEST_ACCOUNT_REACTIVATION'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'requestAccountReactivation'),
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
