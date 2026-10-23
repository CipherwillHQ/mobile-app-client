import 'package:gql/ast.dart';

class Variables$Mutation$COMPLETE_GUIDED_ACTION {
  factory Variables$Mutation$COMPLETE_GUIDED_ACTION({
    required String objectiveId,
    required Object answers,
    int? version,
  }) => Variables$Mutation$COMPLETE_GUIDED_ACTION._({
    r'objectiveId': objectiveId,
    r'answers': answers,
    if (version != null) r'version': version,
  });

  Variables$Mutation$COMPLETE_GUIDED_ACTION._(this._$data);

  factory Variables$Mutation$COMPLETE_GUIDED_ACTION.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$objectiveId = data['objectiveId'];
    result$data['objectiveId'] = (l$objectiveId as String);
    final l$answers = data['answers'];
    result$data['answers'] = (l$answers as Object);
    if (data.containsKey('version')) {
      final l$version = data['version'];
      result$data['version'] = (l$version as int?);
    }
    return Variables$Mutation$COMPLETE_GUIDED_ACTION._(result$data);
  }

  Map<String, dynamic> _$data;

  String get objectiveId => (_$data['objectiveId'] as String);

  Object get answers => (_$data['answers'] as Object);

  int? get version => (_$data['version'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$objectiveId = objectiveId;
    result$data['objectiveId'] = l$objectiveId;
    final l$answers = answers;
    result$data['answers'] = l$answers;
    if (_$data.containsKey('version')) {
      final l$version = version;
      result$data['version'] = l$version;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION<
    Variables$Mutation$COMPLETE_GUIDED_ACTION
  >
  get copyWith =>
      CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$COMPLETE_GUIDED_ACTION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$objectiveId = objectiveId;
    final lOther$objectiveId = other.objectiveId;
    if (l$objectiveId != lOther$objectiveId) {
      return false;
    }
    final l$answers = answers;
    final lOther$answers = other.answers;
    if (l$answers != lOther$answers) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (_$data.containsKey('version') != other._$data.containsKey('version')) {
      return false;
    }
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$objectiveId = objectiveId;
    final l$answers = answers;
    final l$version = version;
    return Object.hashAll([
      l$objectiveId,
      l$answers,
      _$data.containsKey('version') ? l$version : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION<TRes> {
  factory CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION(
    Variables$Mutation$COMPLETE_GUIDED_ACTION instance,
    TRes Function(Variables$Mutation$COMPLETE_GUIDED_ACTION) then,
  ) = _CopyWithImpl$Variables$Mutation$COMPLETE_GUIDED_ACTION;

  factory CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$COMPLETE_GUIDED_ACTION;

  TRes call({String? objectiveId, Object? answers, int? version});
}

class _CopyWithImpl$Variables$Mutation$COMPLETE_GUIDED_ACTION<TRes>
    implements CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION<TRes> {
  _CopyWithImpl$Variables$Mutation$COMPLETE_GUIDED_ACTION(
    this._instance,
    this._then,
  );

  final Variables$Mutation$COMPLETE_GUIDED_ACTION _instance;

  final TRes Function(Variables$Mutation$COMPLETE_GUIDED_ACTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? objectiveId = _undefined,
    Object? answers = _undefined,
    Object? version = _undefined,
  }) => _then(
    Variables$Mutation$COMPLETE_GUIDED_ACTION._({
      ..._instance._$data,
      if (objectiveId != _undefined && objectiveId != null)
        'objectiveId': (objectiveId as String),
      if (answers != _undefined && answers != null)
        'answers': (answers as Object),
      if (version != _undefined) 'version': (version as int?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$COMPLETE_GUIDED_ACTION<TRes>
    implements CopyWith$Variables$Mutation$COMPLETE_GUIDED_ACTION<TRes> {
  _CopyWithStubImpl$Variables$Mutation$COMPLETE_GUIDED_ACTION(this._res);

  TRes _res;

  call({String? objectiveId, Object? answers, int? version}) => _res;
}

class Mutation$COMPLETE_GUIDED_ACTION {
  Mutation$COMPLETE_GUIDED_ACTION({
    required this.completeGuidedAction,
    this.$__typename = 'Mutation',
  });

  factory Mutation$COMPLETE_GUIDED_ACTION.fromJson(Map<String, dynamic> json) {
    final l$completeGuidedAction = json['completeGuidedAction'];
    final l$$__typename = json['__typename'];
    return Mutation$COMPLETE_GUIDED_ACTION(
      completeGuidedAction:
          Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction.fromJson(
            (l$completeGuidedAction as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction
  completeGuidedAction;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$completeGuidedAction = completeGuidedAction;
    _resultData['completeGuidedAction'] = l$completeGuidedAction.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$completeGuidedAction = completeGuidedAction;
    final l$$__typename = $__typename;
    return Object.hashAll([l$completeGuidedAction, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$COMPLETE_GUIDED_ACTION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$completeGuidedAction = completeGuidedAction;
    final lOther$completeGuidedAction = other.completeGuidedAction;
    if (l$completeGuidedAction != lOther$completeGuidedAction) {
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

extension UtilityExtension$Mutation$COMPLETE_GUIDED_ACTION
    on Mutation$COMPLETE_GUIDED_ACTION {
  CopyWith$Mutation$COMPLETE_GUIDED_ACTION<Mutation$COMPLETE_GUIDED_ACTION>
  get copyWith => CopyWith$Mutation$COMPLETE_GUIDED_ACTION(this, (i) => i);
}

abstract class CopyWith$Mutation$COMPLETE_GUIDED_ACTION<TRes> {
  factory CopyWith$Mutation$COMPLETE_GUIDED_ACTION(
    Mutation$COMPLETE_GUIDED_ACTION instance,
    TRes Function(Mutation$COMPLETE_GUIDED_ACTION) then,
  ) = _CopyWithImpl$Mutation$COMPLETE_GUIDED_ACTION;

  factory CopyWith$Mutation$COMPLETE_GUIDED_ACTION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$COMPLETE_GUIDED_ACTION;

  TRes call({
    Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction? completeGuidedAction,
    String? $__typename,
  });
  CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<TRes>
  get completeGuidedAction;
}

class _CopyWithImpl$Mutation$COMPLETE_GUIDED_ACTION<TRes>
    implements CopyWith$Mutation$COMPLETE_GUIDED_ACTION<TRes> {
  _CopyWithImpl$Mutation$COMPLETE_GUIDED_ACTION(this._instance, this._then);

  final Mutation$COMPLETE_GUIDED_ACTION _instance;

  final TRes Function(Mutation$COMPLETE_GUIDED_ACTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? completeGuidedAction = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$COMPLETE_GUIDED_ACTION(
      completeGuidedAction:
          completeGuidedAction == _undefined || completeGuidedAction == null
          ? _instance.completeGuidedAction
          : (completeGuidedAction
                as Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<TRes>
  get completeGuidedAction {
    final local$completeGuidedAction = _instance.completeGuidedAction;
    return CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
      local$completeGuidedAction,
      (e) => call(completeGuidedAction: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$COMPLETE_GUIDED_ACTION<TRes>
    implements CopyWith$Mutation$COMPLETE_GUIDED_ACTION<TRes> {
  _CopyWithStubImpl$Mutation$COMPLETE_GUIDED_ACTION(this._res);

  TRes _res;

  call({
    Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction? completeGuidedAction,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<TRes>
  get completeGuidedAction =>
      CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction.stub(_res);
}

const documentNodeMutationCOMPLETE_GUIDED_ACTION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'COMPLETE_GUIDED_ACTION'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'objectiveId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'answers')),
          type: NamedTypeNode(name: NameNode(value: 'JSON'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'version')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'completeGuidedAction'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'objectiveId'),
                value: VariableNode(name: NameNode(value: 'objectiveId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'answers'),
                value: VariableNode(name: NameNode(value: 'answers')),
              ),
              ArgumentNode(
                name: NameNode(value: 'version'),
                value: VariableNode(name: NameNode(value: 'version')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'beneficiaryPersonId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'data'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'recovery'),
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

class Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction {
  Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction({
    required this.status,
    this.beneficiaryPersonId,
    this.data,
    this.recovery,
    this.$__typename = 'GuidedObjectiveCompletion',
  });

  factory Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$status = json['status'];
    final l$beneficiaryPersonId = json['beneficiaryPersonId'];
    final l$data = json['data'];
    final l$recovery = json['recovery'];
    final l$$__typename = json['__typename'];
    return Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
      status: (l$status as String),
      beneficiaryPersonId: (l$beneficiaryPersonId as String?),
      data: (l$data as Object?),
      recovery: (l$recovery as Object?),
      $__typename: (l$$__typename as String),
    );
  }

  final String status;

  final String? beneficiaryPersonId;

  final Object? data;

  final Object? recovery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = l$status;
    final l$beneficiaryPersonId = beneficiaryPersonId;
    _resultData['beneficiaryPersonId'] = l$beneficiaryPersonId;
    final l$data = data;
    _resultData['data'] = l$data;
    final l$recovery = recovery;
    _resultData['recovery'] = l$recovery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$beneficiaryPersonId = beneficiaryPersonId;
    final l$data = data;
    final l$recovery = recovery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$status,
      l$beneficiaryPersonId,
      l$data,
      l$recovery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$beneficiaryPersonId = beneficiaryPersonId;
    final lOther$beneficiaryPersonId = other.beneficiaryPersonId;
    if (l$beneficiaryPersonId != lOther$beneficiaryPersonId) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    final l$recovery = recovery;
    final lOther$recovery = other.recovery;
    if (l$recovery != lOther$recovery) {
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

extension UtilityExtension$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction
    on Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction {
  CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<
    Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction
  >
  get copyWith => CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<
  TRes
> {
  factory CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
    Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction instance,
    TRes Function(Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction) then,
  ) = _CopyWithImpl$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction;

  factory CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction;

  TRes call({
    String? status,
    String? beneficiaryPersonId,
    Object? data,
    Object? recovery,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<TRes>
    implements
        CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<TRes> {
  _CopyWithImpl$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
    this._instance,
    this._then,
  );

  final Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction _instance;

  final TRes Function(Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? beneficiaryPersonId = _undefined,
    Object? data = _undefined,
    Object? recovery = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
      status: status == _undefined || status == null
          ? _instance.status
          : (status as String),
      beneficiaryPersonId: beneficiaryPersonId == _undefined
          ? _instance.beneficiaryPersonId
          : (beneficiaryPersonId as String?),
      data: data == _undefined ? _instance.data : (data as Object?),
      recovery: recovery == _undefined
          ? _instance.recovery
          : (recovery as Object?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<
  TRes
>
    implements
        CopyWith$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction<TRes> {
  _CopyWithStubImpl$Mutation$COMPLETE_GUIDED_ACTION$completeGuidedAction(
    this._res,
  );

  TRes _res;

  call({
    String? status,
    String? beneficiaryPersonId,
    Object? data,
    Object? recovery,
    String? $__typename,
  }) => _res;
}
