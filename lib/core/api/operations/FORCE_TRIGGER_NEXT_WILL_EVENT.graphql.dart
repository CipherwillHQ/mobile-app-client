import 'package:gql/ast.dart';

class Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT {
  Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT({
    required this.forceTriggerNextWillEvent,
    this.$__typename = 'Mutation',
  });

  factory Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$forceTriggerNextWillEvent = json['forceTriggerNextWillEvent'];
    final l$$__typename = json['__typename'];
    return Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT(
      forceTriggerNextWillEvent: (l$forceTriggerNextWillEvent as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool forceTriggerNextWillEvent;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$forceTriggerNextWillEvent = forceTriggerNextWillEvent;
    _resultData['forceTriggerNextWillEvent'] = l$forceTriggerNextWillEvent;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$forceTriggerNextWillEvent = forceTriggerNextWillEvent;
    final l$$__typename = $__typename;
    return Object.hashAll([l$forceTriggerNextWillEvent, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$forceTriggerNextWillEvent = forceTriggerNextWillEvent;
    final lOther$forceTriggerNextWillEvent = other.forceTriggerNextWillEvent;
    if (l$forceTriggerNextWillEvent != lOther$forceTriggerNextWillEvent) {
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

extension UtilityExtension$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT
    on Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT {
  CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT<
    Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT
  >
  get copyWith =>
      CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT(this, (i) => i);
}

abstract class CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT<TRes> {
  factory CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT(
    Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT instance,
    TRes Function(Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT) then,
  ) = _CopyWithImpl$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT;

  factory CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT.stub(TRes res) =
      _CopyWithStubImpl$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT;

  TRes call({bool? forceTriggerNextWillEvent, String? $__typename});
}

class _CopyWithImpl$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT<TRes>
    implements CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT<TRes> {
  _CopyWithImpl$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT(
    this._instance,
    this._then,
  );

  final Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT _instance;

  final TRes Function(Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? forceTriggerNextWillEvent = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT(
      forceTriggerNextWillEvent:
          forceTriggerNextWillEvent == _undefined ||
              forceTriggerNextWillEvent == null
          ? _instance.forceTriggerNextWillEvent
          : (forceTriggerNextWillEvent as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT<TRes>
    implements CopyWith$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT<TRes> {
  _CopyWithStubImpl$Mutation$FORCE_TRIGGER_NEXT_WILL_EVENT(this._res);

  TRes _res;

  call({bool? forceTriggerNextWillEvent, String? $__typename}) => _res;
}

const documentNodeMutationFORCE_TRIGGER_NEXT_WILL_EVENT = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'FORCE_TRIGGER_NEXT_WILL_EVENT'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'forceTriggerNextWillEvent'),
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
