import 'package:gql/ast.dart';

class Variables$Mutation$ACK_GUIDANCE_OPERATION {
  factory Variables$Mutation$ACK_GUIDANCE_OPERATION({
    required String objectiveId,
    required String actionId,
  }) => Variables$Mutation$ACK_GUIDANCE_OPERATION._({
    r'objectiveId': objectiveId,
    r'actionId': actionId,
  });

  Variables$Mutation$ACK_GUIDANCE_OPERATION._(this._$data);

  factory Variables$Mutation$ACK_GUIDANCE_OPERATION.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$objectiveId = data['objectiveId'];
    result$data['objectiveId'] = (l$objectiveId as String);
    final l$actionId = data['actionId'];
    result$data['actionId'] = (l$actionId as String);
    return Variables$Mutation$ACK_GUIDANCE_OPERATION._(result$data);
  }

  Map<String, dynamic> _$data;

  String get objectiveId => (_$data['objectiveId'] as String);

  String get actionId => (_$data['actionId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$objectiveId = objectiveId;
    result$data['objectiveId'] = l$objectiveId;
    final l$actionId = actionId;
    result$data['actionId'] = l$actionId;
    return result$data;
  }

  CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION<
    Variables$Mutation$ACK_GUIDANCE_OPERATION
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ACK_GUIDANCE_OPERATION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$objectiveId = objectiveId;
    final lOther$objectiveId = other.objectiveId;
    if (l$objectiveId != lOther$objectiveId) {
      return false;
    }
    final l$actionId = actionId;
    final lOther$actionId = other.actionId;
    if (l$actionId != lOther$actionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$objectiveId = objectiveId;
    final l$actionId = actionId;
    return Object.hashAll([l$objectiveId, l$actionId]);
  }
}

abstract class CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION<TRes> {
  factory CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION(
    Variables$Mutation$ACK_GUIDANCE_OPERATION instance,
    TRes Function(Variables$Mutation$ACK_GUIDANCE_OPERATION) then,
  ) = _CopyWithImpl$Variables$Mutation$ACK_GUIDANCE_OPERATION;

  factory CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ACK_GUIDANCE_OPERATION;

  TRes call({String? objectiveId, String? actionId});
}

class _CopyWithImpl$Variables$Mutation$ACK_GUIDANCE_OPERATION<TRes>
    implements CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION<TRes> {
  _CopyWithImpl$Variables$Mutation$ACK_GUIDANCE_OPERATION(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ACK_GUIDANCE_OPERATION _instance;

  final TRes Function(Variables$Mutation$ACK_GUIDANCE_OPERATION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? objectiveId = _undefined,
    Object? actionId = _undefined,
  }) => _then(
    Variables$Mutation$ACK_GUIDANCE_OPERATION._({
      ..._instance._$data,
      if (objectiveId != _undefined && objectiveId != null)
        'objectiveId': (objectiveId as String),
      if (actionId != _undefined && actionId != null)
        'actionId': (actionId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ACK_GUIDANCE_OPERATION<TRes>
    implements CopyWith$Variables$Mutation$ACK_GUIDANCE_OPERATION<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ACK_GUIDANCE_OPERATION(this._res);

  TRes _res;

  call({String? objectiveId, String? actionId}) => _res;
}

class Mutation$ACK_GUIDANCE_OPERATION {
  Mutation$ACK_GUIDANCE_OPERATION({
    required this.finishGuidedActionOperation,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ACK_GUIDANCE_OPERATION.fromJson(Map<String, dynamic> json) {
    final l$finishGuidedActionOperation = json['finishGuidedActionOperation'];
    final l$$__typename = json['__typename'];
    return Mutation$ACK_GUIDANCE_OPERATION(
      finishGuidedActionOperation: (l$finishGuidedActionOperation as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool finishGuidedActionOperation;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$finishGuidedActionOperation = finishGuidedActionOperation;
    _resultData['finishGuidedActionOperation'] = l$finishGuidedActionOperation;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$finishGuidedActionOperation = finishGuidedActionOperation;
    final l$$__typename = $__typename;
    return Object.hashAll([l$finishGuidedActionOperation, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ACK_GUIDANCE_OPERATION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$finishGuidedActionOperation = finishGuidedActionOperation;
    final lOther$finishGuidedActionOperation =
        other.finishGuidedActionOperation;
    if (l$finishGuidedActionOperation != lOther$finishGuidedActionOperation) {
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

extension UtilityExtension$Mutation$ACK_GUIDANCE_OPERATION
    on Mutation$ACK_GUIDANCE_OPERATION {
  CopyWith$Mutation$ACK_GUIDANCE_OPERATION<Mutation$ACK_GUIDANCE_OPERATION>
  get copyWith => CopyWith$Mutation$ACK_GUIDANCE_OPERATION(this, (i) => i);
}

abstract class CopyWith$Mutation$ACK_GUIDANCE_OPERATION<TRes> {
  factory CopyWith$Mutation$ACK_GUIDANCE_OPERATION(
    Mutation$ACK_GUIDANCE_OPERATION instance,
    TRes Function(Mutation$ACK_GUIDANCE_OPERATION) then,
  ) = _CopyWithImpl$Mutation$ACK_GUIDANCE_OPERATION;

  factory CopyWith$Mutation$ACK_GUIDANCE_OPERATION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ACK_GUIDANCE_OPERATION;

  TRes call({bool? finishGuidedActionOperation, String? $__typename});
}

class _CopyWithImpl$Mutation$ACK_GUIDANCE_OPERATION<TRes>
    implements CopyWith$Mutation$ACK_GUIDANCE_OPERATION<TRes> {
  _CopyWithImpl$Mutation$ACK_GUIDANCE_OPERATION(this._instance, this._then);

  final Mutation$ACK_GUIDANCE_OPERATION _instance;

  final TRes Function(Mutation$ACK_GUIDANCE_OPERATION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? finishGuidedActionOperation = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ACK_GUIDANCE_OPERATION(
      finishGuidedActionOperation:
          finishGuidedActionOperation == _undefined ||
              finishGuidedActionOperation == null
          ? _instance.finishGuidedActionOperation
          : (finishGuidedActionOperation as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ACK_GUIDANCE_OPERATION<TRes>
    implements CopyWith$Mutation$ACK_GUIDANCE_OPERATION<TRes> {
  _CopyWithStubImpl$Mutation$ACK_GUIDANCE_OPERATION(this._res);

  TRes _res;

  call({bool? finishGuidedActionOperation, String? $__typename}) => _res;
}

const documentNodeMutationACK_GUIDANCE_OPERATION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ACK_GUIDANCE_OPERATION'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'objectiveId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'actionId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'finishGuidedActionOperation'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objectiveId'),
                value: VariableNode(name: NameNode(value: 'objectiveId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'actionId'),
                value: VariableNode(name: NameNode(value: 'actionId')),
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
