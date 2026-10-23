import 'package:gql/ast.dart';

class Variables$Mutation$RESUME_GUIDED_ACTION {
  factory Variables$Mutation$RESUME_GUIDED_ACTION({
    required String objectiveId,
  }) =>
      Variables$Mutation$RESUME_GUIDED_ACTION._({r'objectiveId': objectiveId});

  Variables$Mutation$RESUME_GUIDED_ACTION._(this._$data);

  factory Variables$Mutation$RESUME_GUIDED_ACTION.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$objectiveId = data['objectiveId'];
    result$data['objectiveId'] = (l$objectiveId as String);
    return Variables$Mutation$RESUME_GUIDED_ACTION._(result$data);
  }

  Map<String, dynamic> _$data;

  String get objectiveId => (_$data['objectiveId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$objectiveId = objectiveId;
    result$data['objectiveId'] = l$objectiveId;
    return result$data;
  }

  CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION<
    Variables$Mutation$RESUME_GUIDED_ACTION
  >
  get copyWith =>
      CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RESUME_GUIDED_ACTION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$objectiveId = objectiveId;
    final lOther$objectiveId = other.objectiveId;
    if (l$objectiveId != lOther$objectiveId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$objectiveId = objectiveId;
    return Object.hashAll([l$objectiveId]);
  }
}

abstract class CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION<TRes> {
  factory CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION(
    Variables$Mutation$RESUME_GUIDED_ACTION instance,
    TRes Function(Variables$Mutation$RESUME_GUIDED_ACTION) then,
  ) = _CopyWithImpl$Variables$Mutation$RESUME_GUIDED_ACTION;

  factory CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RESUME_GUIDED_ACTION;

  TRes call({String? objectiveId});
}

class _CopyWithImpl$Variables$Mutation$RESUME_GUIDED_ACTION<TRes>
    implements CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION<TRes> {
  _CopyWithImpl$Variables$Mutation$RESUME_GUIDED_ACTION(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RESUME_GUIDED_ACTION _instance;

  final TRes Function(Variables$Mutation$RESUME_GUIDED_ACTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? objectiveId = _undefined}) => _then(
    Variables$Mutation$RESUME_GUIDED_ACTION._({
      ..._instance._$data,
      if (objectiveId != _undefined && objectiveId != null)
        'objectiveId': (objectiveId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$RESUME_GUIDED_ACTION<TRes>
    implements CopyWith$Variables$Mutation$RESUME_GUIDED_ACTION<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RESUME_GUIDED_ACTION(this._res);

  TRes _res;

  call({String? objectiveId}) => _res;
}

class Mutation$RESUME_GUIDED_ACTION {
  Mutation$RESUME_GUIDED_ACTION({
    required this.resumeGuidedAction,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RESUME_GUIDED_ACTION.fromJson(Map<String, dynamic> json) {
    final l$resumeGuidedAction = json['resumeGuidedAction'];
    final l$$__typename = json['__typename'];
    return Mutation$RESUME_GUIDED_ACTION(
      resumeGuidedAction: (l$resumeGuidedAction as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool resumeGuidedAction;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$resumeGuidedAction = resumeGuidedAction;
    _resultData['resumeGuidedAction'] = l$resumeGuidedAction;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$resumeGuidedAction = resumeGuidedAction;
    final l$$__typename = $__typename;
    return Object.hashAll([l$resumeGuidedAction, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RESUME_GUIDED_ACTION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$resumeGuidedAction = resumeGuidedAction;
    final lOther$resumeGuidedAction = other.resumeGuidedAction;
    if (l$resumeGuidedAction != lOther$resumeGuidedAction) {
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

extension UtilityExtension$Mutation$RESUME_GUIDED_ACTION
    on Mutation$RESUME_GUIDED_ACTION {
  CopyWith$Mutation$RESUME_GUIDED_ACTION<Mutation$RESUME_GUIDED_ACTION>
  get copyWith => CopyWith$Mutation$RESUME_GUIDED_ACTION(this, (i) => i);
}

abstract class CopyWith$Mutation$RESUME_GUIDED_ACTION<TRes> {
  factory CopyWith$Mutation$RESUME_GUIDED_ACTION(
    Mutation$RESUME_GUIDED_ACTION instance,
    TRes Function(Mutation$RESUME_GUIDED_ACTION) then,
  ) = _CopyWithImpl$Mutation$RESUME_GUIDED_ACTION;

  factory CopyWith$Mutation$RESUME_GUIDED_ACTION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RESUME_GUIDED_ACTION;

  TRes call({bool? resumeGuidedAction, String? $__typename});
}

class _CopyWithImpl$Mutation$RESUME_GUIDED_ACTION<TRes>
    implements CopyWith$Mutation$RESUME_GUIDED_ACTION<TRes> {
  _CopyWithImpl$Mutation$RESUME_GUIDED_ACTION(this._instance, this._then);

  final Mutation$RESUME_GUIDED_ACTION _instance;

  final TRes Function(Mutation$RESUME_GUIDED_ACTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? resumeGuidedAction = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RESUME_GUIDED_ACTION(
      resumeGuidedAction:
          resumeGuidedAction == _undefined || resumeGuidedAction == null
          ? _instance.resumeGuidedAction
          : (resumeGuidedAction as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$RESUME_GUIDED_ACTION<TRes>
    implements CopyWith$Mutation$RESUME_GUIDED_ACTION<TRes> {
  _CopyWithStubImpl$Mutation$RESUME_GUIDED_ACTION(this._res);

  TRes _res;

  call({bool? resumeGuidedAction, String? $__typename}) => _res;
}

const documentNodeMutationRESUME_GUIDED_ACTION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RESUME_GUIDED_ACTION'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'objectiveId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'resumeGuidedAction'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objectiveId'),
                value: VariableNode(name: NameNode(value: 'objectiveId')),
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
