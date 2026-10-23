import 'package:gql/ast.dart';

class Variables$Mutation$DEFER_GUIDED_ACTION {
  factory Variables$Mutation$DEFER_GUIDED_ACTION({
    required String objectiveId,
  }) => Variables$Mutation$DEFER_GUIDED_ACTION._({r'objectiveId': objectiveId});

  Variables$Mutation$DEFER_GUIDED_ACTION._(this._$data);

  factory Variables$Mutation$DEFER_GUIDED_ACTION.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$objectiveId = data['objectiveId'];
    result$data['objectiveId'] = (l$objectiveId as String);
    return Variables$Mutation$DEFER_GUIDED_ACTION._(result$data);
  }

  Map<String, dynamic> _$data;

  String get objectiveId => (_$data['objectiveId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$objectiveId = objectiveId;
    result$data['objectiveId'] = l$objectiveId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION<
    Variables$Mutation$DEFER_GUIDED_ACTION
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DEFER_GUIDED_ACTION ||
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

abstract class CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION<TRes> {
  factory CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION(
    Variables$Mutation$DEFER_GUIDED_ACTION instance,
    TRes Function(Variables$Mutation$DEFER_GUIDED_ACTION) then,
  ) = _CopyWithImpl$Variables$Mutation$DEFER_GUIDED_ACTION;

  factory CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DEFER_GUIDED_ACTION;

  TRes call({String? objectiveId});
}

class _CopyWithImpl$Variables$Mutation$DEFER_GUIDED_ACTION<TRes>
    implements CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION<TRes> {
  _CopyWithImpl$Variables$Mutation$DEFER_GUIDED_ACTION(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DEFER_GUIDED_ACTION _instance;

  final TRes Function(Variables$Mutation$DEFER_GUIDED_ACTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? objectiveId = _undefined}) => _then(
    Variables$Mutation$DEFER_GUIDED_ACTION._({
      ..._instance._$data,
      if (objectiveId != _undefined && objectiveId != null)
        'objectiveId': (objectiveId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DEFER_GUIDED_ACTION<TRes>
    implements CopyWith$Variables$Mutation$DEFER_GUIDED_ACTION<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DEFER_GUIDED_ACTION(this._res);

  TRes _res;

  call({String? objectiveId}) => _res;
}

class Mutation$DEFER_GUIDED_ACTION {
  Mutation$DEFER_GUIDED_ACTION({
    required this.deferGuidedAction,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DEFER_GUIDED_ACTION.fromJson(Map<String, dynamic> json) {
    final l$deferGuidedAction = json['deferGuidedAction'];
    final l$$__typename = json['__typename'];
    return Mutation$DEFER_GUIDED_ACTION(
      deferGuidedAction:
          Mutation$DEFER_GUIDED_ACTION$deferGuidedAction.fromJson(
            (l$deferGuidedAction as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DEFER_GUIDED_ACTION$deferGuidedAction deferGuidedAction;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deferGuidedAction = deferGuidedAction;
    _resultData['deferGuidedAction'] = l$deferGuidedAction.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deferGuidedAction = deferGuidedAction;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deferGuidedAction, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DEFER_GUIDED_ACTION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deferGuidedAction = deferGuidedAction;
    final lOther$deferGuidedAction = other.deferGuidedAction;
    if (l$deferGuidedAction != lOther$deferGuidedAction) {
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

extension UtilityExtension$Mutation$DEFER_GUIDED_ACTION
    on Mutation$DEFER_GUIDED_ACTION {
  CopyWith$Mutation$DEFER_GUIDED_ACTION<Mutation$DEFER_GUIDED_ACTION>
  get copyWith => CopyWith$Mutation$DEFER_GUIDED_ACTION(this, (i) => i);
}

abstract class CopyWith$Mutation$DEFER_GUIDED_ACTION<TRes> {
  factory CopyWith$Mutation$DEFER_GUIDED_ACTION(
    Mutation$DEFER_GUIDED_ACTION instance,
    TRes Function(Mutation$DEFER_GUIDED_ACTION) then,
  ) = _CopyWithImpl$Mutation$DEFER_GUIDED_ACTION;

  factory CopyWith$Mutation$DEFER_GUIDED_ACTION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DEFER_GUIDED_ACTION;

  TRes call({
    Mutation$DEFER_GUIDED_ACTION$deferGuidedAction? deferGuidedAction,
    String? $__typename,
  });
  CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes>
  get deferGuidedAction;
}

class _CopyWithImpl$Mutation$DEFER_GUIDED_ACTION<TRes>
    implements CopyWith$Mutation$DEFER_GUIDED_ACTION<TRes> {
  _CopyWithImpl$Mutation$DEFER_GUIDED_ACTION(this._instance, this._then);

  final Mutation$DEFER_GUIDED_ACTION _instance;

  final TRes Function(Mutation$DEFER_GUIDED_ACTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deferGuidedAction = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DEFER_GUIDED_ACTION(
      deferGuidedAction:
          deferGuidedAction == _undefined || deferGuidedAction == null
          ? _instance.deferGuidedAction
          : (deferGuidedAction
                as Mutation$DEFER_GUIDED_ACTION$deferGuidedAction),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes>
  get deferGuidedAction {
    final local$deferGuidedAction = _instance.deferGuidedAction;
    return CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(
      local$deferGuidedAction,
      (e) => call(deferGuidedAction: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$DEFER_GUIDED_ACTION<TRes>
    implements CopyWith$Mutation$DEFER_GUIDED_ACTION<TRes> {
  _CopyWithStubImpl$Mutation$DEFER_GUIDED_ACTION(this._res);

  TRes _res;

  call({
    Mutation$DEFER_GUIDED_ACTION$deferGuidedAction? deferGuidedAction,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes>
  get deferGuidedAction =>
      CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction.stub(_res);
}

const documentNodeMutationDEFER_GUIDED_ACTION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DEFER_GUIDED_ACTION'),
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
            name: NameNode(value: 'deferGuidedAction'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objectiveId'),
                value: VariableNode(name: NameNode(value: 'objectiveId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'objectiveId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'resumeAfter'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dismissed'),
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

class Mutation$DEFER_GUIDED_ACTION$deferGuidedAction {
  Mutation$DEFER_GUIDED_ACTION$deferGuidedAction({
    required this.objectiveId,
    this.resumeAfter,
    required this.dismissed,
    this.$__typename = 'GuidedActionDeferral',
  });

  factory Mutation$DEFER_GUIDED_ACTION$deferGuidedAction.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$objectiveId = json['objectiveId'];
    final l$resumeAfter = json['resumeAfter'];
    final l$dismissed = json['dismissed'];
    final l$$__typename = json['__typename'];
    return Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(
      objectiveId: (l$objectiveId as String),
      resumeAfter: (l$resumeAfter as String?),
      dismissed: (l$dismissed as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String objectiveId;

  final String? resumeAfter;

  final bool dismissed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$objectiveId = objectiveId;
    _resultData['objectiveId'] = l$objectiveId;
    final l$resumeAfter = resumeAfter;
    _resultData['resumeAfter'] = l$resumeAfter;
    final l$dismissed = dismissed;
    _resultData['dismissed'] = l$dismissed;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$objectiveId = objectiveId;
    final l$resumeAfter = resumeAfter;
    final l$dismissed = dismissed;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$objectiveId,
      l$resumeAfter,
      l$dismissed,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DEFER_GUIDED_ACTION$deferGuidedAction ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$objectiveId = objectiveId;
    final lOther$objectiveId = other.objectiveId;
    if (l$objectiveId != lOther$objectiveId) {
      return false;
    }
    final l$resumeAfter = resumeAfter;
    final lOther$resumeAfter = other.resumeAfter;
    if (l$resumeAfter != lOther$resumeAfter) {
      return false;
    }
    final l$dismissed = dismissed;
    final lOther$dismissed = other.dismissed;
    if (l$dismissed != lOther$dismissed) {
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

extension UtilityExtension$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction
    on Mutation$DEFER_GUIDED_ACTION$deferGuidedAction {
  CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<
    Mutation$DEFER_GUIDED_ACTION$deferGuidedAction
  >
  get copyWith =>
      CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(this, (i) => i);
}

abstract class CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes> {
  factory CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(
    Mutation$DEFER_GUIDED_ACTION$deferGuidedAction instance,
    TRes Function(Mutation$DEFER_GUIDED_ACTION$deferGuidedAction) then,
  ) = _CopyWithImpl$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction;

  factory CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction;

  TRes call({
    String? objectiveId,
    String? resumeAfter,
    bool? dismissed,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes>
    implements CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes> {
  _CopyWithImpl$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(
    this._instance,
    this._then,
  );

  final Mutation$DEFER_GUIDED_ACTION$deferGuidedAction _instance;

  final TRes Function(Mutation$DEFER_GUIDED_ACTION$deferGuidedAction) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? objectiveId = _undefined,
    Object? resumeAfter = _undefined,
    Object? dismissed = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(
      objectiveId: objectiveId == _undefined || objectiveId == null
          ? _instance.objectiveId
          : (objectiveId as String),
      resumeAfter: resumeAfter == _undefined
          ? _instance.resumeAfter
          : (resumeAfter as String?),
      dismissed: dismissed == _undefined || dismissed == null
          ? _instance.dismissed
          : (dismissed as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes>
    implements CopyWith$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction<TRes> {
  _CopyWithStubImpl$Mutation$DEFER_GUIDED_ACTION$deferGuidedAction(this._res);

  TRes _res;

  call({
    String? objectiveId,
    String? resumeAfter,
    bool? dismissed,
    String? $__typename,
  }) => _res;
}
