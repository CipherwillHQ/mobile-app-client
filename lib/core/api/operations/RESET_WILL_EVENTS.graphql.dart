import 'package:gql/ast.dart';

class Mutation$RESET_WILL_EVENTS {
  Mutation$RESET_WILL_EVENTS({
    required this.resetWillEvents,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RESET_WILL_EVENTS.fromJson(Map<String, dynamic> json) {
    final l$resetWillEvents = json['resetWillEvents'];
    final l$$__typename = json['__typename'];
    return Mutation$RESET_WILL_EVENTS(
      resetWillEvents: (l$resetWillEvents as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool resetWillEvents;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$resetWillEvents = resetWillEvents;
    _resultData['resetWillEvents'] = l$resetWillEvents;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$resetWillEvents = resetWillEvents;
    final l$$__typename = $__typename;
    return Object.hashAll([l$resetWillEvents, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RESET_WILL_EVENTS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$resetWillEvents = resetWillEvents;
    final lOther$resetWillEvents = other.resetWillEvents;
    if (l$resetWillEvents != lOther$resetWillEvents) {
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

extension UtilityExtension$Mutation$RESET_WILL_EVENTS
    on Mutation$RESET_WILL_EVENTS {
  CopyWith$Mutation$RESET_WILL_EVENTS<Mutation$RESET_WILL_EVENTS>
  get copyWith => CopyWith$Mutation$RESET_WILL_EVENTS(this, (i) => i);
}

abstract class CopyWith$Mutation$RESET_WILL_EVENTS<TRes> {
  factory CopyWith$Mutation$RESET_WILL_EVENTS(
    Mutation$RESET_WILL_EVENTS instance,
    TRes Function(Mutation$RESET_WILL_EVENTS) then,
  ) = _CopyWithImpl$Mutation$RESET_WILL_EVENTS;

  factory CopyWith$Mutation$RESET_WILL_EVENTS.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RESET_WILL_EVENTS;

  TRes call({bool? resetWillEvents, String? $__typename});
}

class _CopyWithImpl$Mutation$RESET_WILL_EVENTS<TRes>
    implements CopyWith$Mutation$RESET_WILL_EVENTS<TRes> {
  _CopyWithImpl$Mutation$RESET_WILL_EVENTS(this._instance, this._then);

  final Mutation$RESET_WILL_EVENTS _instance;

  final TRes Function(Mutation$RESET_WILL_EVENTS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? resetWillEvents = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RESET_WILL_EVENTS(
      resetWillEvents: resetWillEvents == _undefined || resetWillEvents == null
          ? _instance.resetWillEvents
          : (resetWillEvents as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$RESET_WILL_EVENTS<TRes>
    implements CopyWith$Mutation$RESET_WILL_EVENTS<TRes> {
  _CopyWithStubImpl$Mutation$RESET_WILL_EVENTS(this._res);

  TRes _res;

  call({bool? resetWillEvents, String? $__typename}) => _res;
}

const documentNodeMutationRESET_WILL_EVENTS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RESET_WILL_EVENTS'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'resetWillEvents'),
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
