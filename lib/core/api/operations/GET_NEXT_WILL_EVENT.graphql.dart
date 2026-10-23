import 'package:gql/ast.dart';

class Query$GET_NEXT_WILL_EVENT {
  Query$GET_NEXT_WILL_EVENT({
    this.getNextWillEvent,
    this.$__typename = 'Query',
  });

  factory Query$GET_NEXT_WILL_EVENT.fromJson(Map<String, dynamic> json) {
    final l$getNextWillEvent = json['getNextWillEvent'];
    final l$$__typename = json['__typename'];
    return Query$GET_NEXT_WILL_EVENT(
      getNextWillEvent: l$getNextWillEvent == null
          ? null
          : Query$GET_NEXT_WILL_EVENT$getNextWillEvent.fromJson(
              (l$getNextWillEvent as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_NEXT_WILL_EVENT$getNextWillEvent? getNextWillEvent;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getNextWillEvent = getNextWillEvent;
    _resultData['getNextWillEvent'] = l$getNextWillEvent?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getNextWillEvent = getNextWillEvent;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getNextWillEvent, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_NEXT_WILL_EVENT ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getNextWillEvent = getNextWillEvent;
    final lOther$getNextWillEvent = other.getNextWillEvent;
    if (l$getNextWillEvent != lOther$getNextWillEvent) {
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

extension UtilityExtension$Query$GET_NEXT_WILL_EVENT
    on Query$GET_NEXT_WILL_EVENT {
  CopyWith$Query$GET_NEXT_WILL_EVENT<Query$GET_NEXT_WILL_EVENT> get copyWith =>
      CopyWith$Query$GET_NEXT_WILL_EVENT(this, (i) => i);
}

abstract class CopyWith$Query$GET_NEXT_WILL_EVENT<TRes> {
  factory CopyWith$Query$GET_NEXT_WILL_EVENT(
    Query$GET_NEXT_WILL_EVENT instance,
    TRes Function(Query$GET_NEXT_WILL_EVENT) then,
  ) = _CopyWithImpl$Query$GET_NEXT_WILL_EVENT;

  factory CopyWith$Query$GET_NEXT_WILL_EVENT.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_NEXT_WILL_EVENT;

  TRes call({
    Query$GET_NEXT_WILL_EVENT$getNextWillEvent? getNextWillEvent,
    String? $__typename,
  });
  CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes>
  get getNextWillEvent;
}

class _CopyWithImpl$Query$GET_NEXT_WILL_EVENT<TRes>
    implements CopyWith$Query$GET_NEXT_WILL_EVENT<TRes> {
  _CopyWithImpl$Query$GET_NEXT_WILL_EVENT(this._instance, this._then);

  final Query$GET_NEXT_WILL_EVENT _instance;

  final TRes Function(Query$GET_NEXT_WILL_EVENT) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getNextWillEvent = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_NEXT_WILL_EVENT(
      getNextWillEvent: getNextWillEvent == _undefined
          ? _instance.getNextWillEvent
          : (getNextWillEvent as Query$GET_NEXT_WILL_EVENT$getNextWillEvent?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes>
  get getNextWillEvent {
    final local$getNextWillEvent = _instance.getNextWillEvent;
    return local$getNextWillEvent == null
        ? CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent.stub(
            _then(_instance),
          )
        : CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent(
            local$getNextWillEvent,
            (e) => call(getNextWillEvent: e),
          );
  }
}

class _CopyWithStubImpl$Query$GET_NEXT_WILL_EVENT<TRes>
    implements CopyWith$Query$GET_NEXT_WILL_EVENT<TRes> {
  _CopyWithStubImpl$Query$GET_NEXT_WILL_EVENT(this._res);

  TRes _res;

  call({
    Query$GET_NEXT_WILL_EVENT$getNextWillEvent? getNextWillEvent,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes>
  get getNextWillEvent =>
      CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent.stub(_res);
}

const documentNodeQueryGET_NEXT_WILL_EVENT = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_NEXT_WILL_EVENT'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getNextWillEvent'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'execution_time'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'created_at'),
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

class Query$GET_NEXT_WILL_EVENT$getNextWillEvent {
  Query$GET_NEXT_WILL_EVENT$getNextWillEvent({
    required this.id,
    required this.type,
    required this.execution_time,
    required this.created_at,
    this.$__typename = 'WillEvent',
  });

  factory Query$GET_NEXT_WILL_EVENT$getNextWillEvent.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$execution_time = json['execution_time'];
    final l$created_at = json['created_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_NEXT_WILL_EVENT$getNextWillEvent(
      id: (l$id as String),
      type: (l$type as String),
      execution_time: (l$execution_time as String),
      created_at: (l$created_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String type;

  final String execution_time;

  final String created_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = l$type;
    final l$execution_time = execution_time;
    _resultData['execution_time'] = l$execution_time;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$execution_time = execution_time;
    final l$created_at = created_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$execution_time,
      l$created_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_NEXT_WILL_EVENT$getNextWillEvent ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$execution_time = execution_time;
    final lOther$execution_time = other.execution_time;
    if (l$execution_time != lOther$execution_time) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

extension UtilityExtension$Query$GET_NEXT_WILL_EVENT$getNextWillEvent
    on Query$GET_NEXT_WILL_EVENT$getNextWillEvent {
  CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<
    Query$GET_NEXT_WILL_EVENT$getNextWillEvent
  >
  get copyWith =>
      CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent(this, (i) => i);
}

abstract class CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes> {
  factory CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent(
    Query$GET_NEXT_WILL_EVENT$getNextWillEvent instance,
    TRes Function(Query$GET_NEXT_WILL_EVENT$getNextWillEvent) then,
  ) = _CopyWithImpl$Query$GET_NEXT_WILL_EVENT$getNextWillEvent;

  factory CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_NEXT_WILL_EVENT$getNextWillEvent;

  TRes call({
    String? id,
    String? type,
    String? execution_time,
    String? created_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes>
    implements CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes> {
  _CopyWithImpl$Query$GET_NEXT_WILL_EVENT$getNextWillEvent(
    this._instance,
    this._then,
  );

  final Query$GET_NEXT_WILL_EVENT$getNextWillEvent _instance;

  final TRes Function(Query$GET_NEXT_WILL_EVENT$getNextWillEvent) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? execution_time = _undefined,
    Object? created_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_NEXT_WILL_EVENT$getNextWillEvent(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as String),
      execution_time: execution_time == _undefined || execution_time == null
          ? _instance.execution_time
          : (execution_time as String),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes>
    implements CopyWith$Query$GET_NEXT_WILL_EVENT$getNextWillEvent<TRes> {
  _CopyWithStubImpl$Query$GET_NEXT_WILL_EVENT$getNextWillEvent(this._res);

  TRes _res;

  call({
    String? id,
    String? type,
    String? execution_time,
    String? created_at,
    String? $__typename,
  }) => _res;
}
