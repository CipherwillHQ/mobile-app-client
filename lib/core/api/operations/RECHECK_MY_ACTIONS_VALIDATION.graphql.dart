import 'package:gql/ast.dart';

class Mutation$RECHECK_MY_ACTIONS_VALIDATION {
  Mutation$RECHECK_MY_ACTIONS_VALIDATION({
    required this.recheckMyActionsValidation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RECHECK_MY_ACTIONS_VALIDATION.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$recheckMyActionsValidation = json['recheckMyActionsValidation'];
    final l$$__typename = json['__typename'];
    return Mutation$RECHECK_MY_ACTIONS_VALIDATION(
      recheckMyActionsValidation: (l$recheckMyActionsValidation as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool recheckMyActionsValidation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recheckMyActionsValidation = recheckMyActionsValidation;
    _resultData['recheckMyActionsValidation'] = l$recheckMyActionsValidation;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recheckMyActionsValidation = recheckMyActionsValidation;
    final l$$__typename = $__typename;
    return Object.hashAll([l$recheckMyActionsValidation, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RECHECK_MY_ACTIONS_VALIDATION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recheckMyActionsValidation = recheckMyActionsValidation;
    final lOther$recheckMyActionsValidation = other.recheckMyActionsValidation;
    if (l$recheckMyActionsValidation != lOther$recheckMyActionsValidation) {
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

extension UtilityExtension$Mutation$RECHECK_MY_ACTIONS_VALIDATION
    on Mutation$RECHECK_MY_ACTIONS_VALIDATION {
  CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION<
    Mutation$RECHECK_MY_ACTIONS_VALIDATION
  >
  get copyWith =>
      CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION(this, (i) => i);
}

abstract class CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION<TRes> {
  factory CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION(
    Mutation$RECHECK_MY_ACTIONS_VALIDATION instance,
    TRes Function(Mutation$RECHECK_MY_ACTIONS_VALIDATION) then,
  ) = _CopyWithImpl$Mutation$RECHECK_MY_ACTIONS_VALIDATION;

  factory CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RECHECK_MY_ACTIONS_VALIDATION;

  TRes call({bool? recheckMyActionsValidation, String? $__typename});
}

class _CopyWithImpl$Mutation$RECHECK_MY_ACTIONS_VALIDATION<TRes>
    implements CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION<TRes> {
  _CopyWithImpl$Mutation$RECHECK_MY_ACTIONS_VALIDATION(
    this._instance,
    this._then,
  );

  final Mutation$RECHECK_MY_ACTIONS_VALIDATION _instance;

  final TRes Function(Mutation$RECHECK_MY_ACTIONS_VALIDATION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recheckMyActionsValidation = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RECHECK_MY_ACTIONS_VALIDATION(
      recheckMyActionsValidation:
          recheckMyActionsValidation == _undefined ||
              recheckMyActionsValidation == null
          ? _instance.recheckMyActionsValidation
          : (recheckMyActionsValidation as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$RECHECK_MY_ACTIONS_VALIDATION<TRes>
    implements CopyWith$Mutation$RECHECK_MY_ACTIONS_VALIDATION<TRes> {
  _CopyWithStubImpl$Mutation$RECHECK_MY_ACTIONS_VALIDATION(this._res);

  TRes _res;

  call({bool? recheckMyActionsValidation, String? $__typename}) => _res;
}

const documentNodeMutationRECHECK_MY_ACTIONS_VALIDATION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RECHECK_MY_ACTIONS_VALIDATION'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'recheckMyActionsValidation'),
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
