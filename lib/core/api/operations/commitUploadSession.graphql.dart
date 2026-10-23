import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$commitUploadSession {
  factory Variables$Mutation$commitUploadSession({
    required String session_id,
  }) => Variables$Mutation$commitUploadSession._({r'session_id': session_id});

  Variables$Mutation$commitUploadSession._(this._$data);

  factory Variables$Mutation$commitUploadSession.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$session_id = data['session_id'];
    result$data['session_id'] = (l$session_id as String);
    return Variables$Mutation$commitUploadSession._(result$data);
  }

  Map<String, dynamic> _$data;

  String get session_id => (_$data['session_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$session_id = session_id;
    result$data['session_id'] = l$session_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$commitUploadSession<
    Variables$Mutation$commitUploadSession
  >
  get copyWith =>
      CopyWith$Variables$Mutation$commitUploadSession(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$commitUploadSession ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (l$session_id != lOther$session_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    return Object.hashAll([l$session_id]);
  }
}

abstract class CopyWith$Variables$Mutation$commitUploadSession<TRes> {
  factory CopyWith$Variables$Mutation$commitUploadSession(
    Variables$Mutation$commitUploadSession instance,
    TRes Function(Variables$Mutation$commitUploadSession) then,
  ) = _CopyWithImpl$Variables$Mutation$commitUploadSession;

  factory CopyWith$Variables$Mutation$commitUploadSession.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$commitUploadSession;

  TRes call({String? session_id});
}

class _CopyWithImpl$Variables$Mutation$commitUploadSession<TRes>
    implements CopyWith$Variables$Mutation$commitUploadSession<TRes> {
  _CopyWithImpl$Variables$Mutation$commitUploadSession(
    this._instance,
    this._then,
  );

  final Variables$Mutation$commitUploadSession _instance;

  final TRes Function(Variables$Mutation$commitUploadSession) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? session_id = _undefined}) => _then(
    Variables$Mutation$commitUploadSession._({
      ..._instance._$data,
      if (session_id != _undefined && session_id != null)
        'session_id': (session_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$commitUploadSession<TRes>
    implements CopyWith$Variables$Mutation$commitUploadSession<TRes> {
  _CopyWithStubImpl$Variables$Mutation$commitUploadSession(this._res);

  TRes _res;

  call({String? session_id}) => _res;
}

class Mutation$commitUploadSession {
  Mutation$commitUploadSession({
    required this.commitUploadSession,
    this.$__typename = 'Mutation',
  });

  factory Mutation$commitUploadSession.fromJson(Map<String, dynamic> json) {
    final l$commitUploadSession = json['commitUploadSession'];
    final l$$__typename = json['__typename'];
    return Mutation$commitUploadSession(
      commitUploadSession:
          Mutation$commitUploadSession$commitUploadSession.fromJson(
            (l$commitUploadSession as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$commitUploadSession$commitUploadSession commitUploadSession;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$commitUploadSession = commitUploadSession;
    _resultData['commitUploadSession'] = l$commitUploadSession.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$commitUploadSession = commitUploadSession;
    final l$$__typename = $__typename;
    return Object.hashAll([l$commitUploadSession, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$commitUploadSession ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$commitUploadSession = commitUploadSession;
    final lOther$commitUploadSession = other.commitUploadSession;
    if (l$commitUploadSession != lOther$commitUploadSession) {
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

extension UtilityExtension$Mutation$commitUploadSession
    on Mutation$commitUploadSession {
  CopyWith$Mutation$commitUploadSession<Mutation$commitUploadSession>
  get copyWith => CopyWith$Mutation$commitUploadSession(this, (i) => i);
}

abstract class CopyWith$Mutation$commitUploadSession<TRes> {
  factory CopyWith$Mutation$commitUploadSession(
    Mutation$commitUploadSession instance,
    TRes Function(Mutation$commitUploadSession) then,
  ) = _CopyWithImpl$Mutation$commitUploadSession;

  factory CopyWith$Mutation$commitUploadSession.stub(TRes res) =
      _CopyWithStubImpl$Mutation$commitUploadSession;

  TRes call({
    Mutation$commitUploadSession$commitUploadSession? commitUploadSession,
    String? $__typename,
  });
  CopyWith$Mutation$commitUploadSession$commitUploadSession<TRes>
  get commitUploadSession;
}

class _CopyWithImpl$Mutation$commitUploadSession<TRes>
    implements CopyWith$Mutation$commitUploadSession<TRes> {
  _CopyWithImpl$Mutation$commitUploadSession(this._instance, this._then);

  final Mutation$commitUploadSession _instance;

  final TRes Function(Mutation$commitUploadSession) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? commitUploadSession = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$commitUploadSession(
      commitUploadSession:
          commitUploadSession == _undefined || commitUploadSession == null
          ? _instance.commitUploadSession
          : (commitUploadSession
                as Mutation$commitUploadSession$commitUploadSession),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$commitUploadSession$commitUploadSession<TRes>
  get commitUploadSession {
    final local$commitUploadSession = _instance.commitUploadSession;
    return CopyWith$Mutation$commitUploadSession$commitUploadSession(
      local$commitUploadSession,
      (e) => call(commitUploadSession: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$commitUploadSession<TRes>
    implements CopyWith$Mutation$commitUploadSession<TRes> {
  _CopyWithStubImpl$Mutation$commitUploadSession(this._res);

  TRes _res;

  call({
    Mutation$commitUploadSession$commitUploadSession? commitUploadSession,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$commitUploadSession$commitUploadSession<TRes>
  get commitUploadSession =>
      CopyWith$Mutation$commitUploadSession$commitUploadSession.stub(_res);
}

const documentNodeMutationcommitUploadSession = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'commitUploadSession'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'session_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'commitUploadSession'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'session_id'),
                value: VariableNode(name: NameNode(value: 'session_id')),
              ),
            ],
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
                  name: NameNode(value: 'status'),
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

class Mutation$commitUploadSession$commitUploadSession {
  Mutation$commitUploadSession$commitUploadSession({
    required this.id,
    required this.status,
    required this.type,
    this.$__typename = 'UploadPodSession',
  });

  factory Mutation$commitUploadSession$commitUploadSession.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Mutation$commitUploadSession$commitUploadSession(
      id: (l$id as String),
      status: fromJson$Enum$UploadSessionStatus((l$status as String)),
      type: fromJson$Enum$UploadSessionType((l$type as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$UploadSessionStatus status;

  final Enum$UploadSessionType type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$UploadSessionStatus(l$status);
    final l$type = type;
    _resultData['type'] = toJson$Enum$UploadSessionType(l$type);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$type = type;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$status, l$type, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$commitUploadSession$commitUploadSession ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
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

extension UtilityExtension$Mutation$commitUploadSession$commitUploadSession
    on Mutation$commitUploadSession$commitUploadSession {
  CopyWith$Mutation$commitUploadSession$commitUploadSession<
    Mutation$commitUploadSession$commitUploadSession
  >
  get copyWith =>
      CopyWith$Mutation$commitUploadSession$commitUploadSession(this, (i) => i);
}

abstract class CopyWith$Mutation$commitUploadSession$commitUploadSession<TRes> {
  factory CopyWith$Mutation$commitUploadSession$commitUploadSession(
    Mutation$commitUploadSession$commitUploadSession instance,
    TRes Function(Mutation$commitUploadSession$commitUploadSession) then,
  ) = _CopyWithImpl$Mutation$commitUploadSession$commitUploadSession;

  factory CopyWith$Mutation$commitUploadSession$commitUploadSession.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$commitUploadSession$commitUploadSession;

  TRes call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$commitUploadSession$commitUploadSession<TRes>
    implements CopyWith$Mutation$commitUploadSession$commitUploadSession<TRes> {
  _CopyWithImpl$Mutation$commitUploadSession$commitUploadSession(
    this._instance,
    this._then,
  );

  final Mutation$commitUploadSession$commitUploadSession _instance;

  final TRes Function(Mutation$commitUploadSession$commitUploadSession) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$commitUploadSession$commitUploadSession(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$UploadSessionStatus),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$UploadSessionType),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$commitUploadSession$commitUploadSession<TRes>
    implements CopyWith$Mutation$commitUploadSession$commitUploadSession<TRes> {
  _CopyWithStubImpl$Mutation$commitUploadSession$commitUploadSession(this._res);

  TRes _res;

  call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? $__typename,
  }) => _res;
}
