import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GET_UPLOAD_POD_SESSION {
  factory Variables$Query$GET_UPLOAD_POD_SESSION({required String ref_id}) =>
      Variables$Query$GET_UPLOAD_POD_SESSION._({r'ref_id': ref_id});

  Variables$Query$GET_UPLOAD_POD_SESSION._(this._$data);

  factory Variables$Query$GET_UPLOAD_POD_SESSION.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    return Variables$Query$GET_UPLOAD_POD_SESSION._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ref_id => (_$data['ref_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION<
    Variables$Query$GET_UPLOAD_POD_SESSION
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_UPLOAD_POD_SESSION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ref_id = ref_id;
    return Object.hashAll([l$ref_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION<TRes> {
  factory CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION(
    Variables$Query$GET_UPLOAD_POD_SESSION instance,
    TRes Function(Variables$Query$GET_UPLOAD_POD_SESSION) then,
  ) = _CopyWithImpl$Variables$Query$GET_UPLOAD_POD_SESSION;

  factory CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_UPLOAD_POD_SESSION;

  TRes call({String? ref_id});
}

class _CopyWithImpl$Variables$Query$GET_UPLOAD_POD_SESSION<TRes>
    implements CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION<TRes> {
  _CopyWithImpl$Variables$Query$GET_UPLOAD_POD_SESSION(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_UPLOAD_POD_SESSION _instance;

  final TRes Function(Variables$Query$GET_UPLOAD_POD_SESSION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? ref_id = _undefined}) => _then(
    Variables$Query$GET_UPLOAD_POD_SESSION._({
      ..._instance._$data,
      if (ref_id != _undefined && ref_id != null) 'ref_id': (ref_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_UPLOAD_POD_SESSION<TRes>
    implements CopyWith$Variables$Query$GET_UPLOAD_POD_SESSION<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_UPLOAD_POD_SESSION(this._res);

  TRes _res;

  call({String? ref_id}) => _res;
}

class Query$GET_UPLOAD_POD_SESSION {
  Query$GET_UPLOAD_POD_SESSION({
    this.getUploadPodSession,
    this.$__typename = 'Query',
  });

  factory Query$GET_UPLOAD_POD_SESSION.fromJson(Map<String, dynamic> json) {
    final l$getUploadPodSession = json['getUploadPodSession'];
    final l$$__typename = json['__typename'];
    return Query$GET_UPLOAD_POD_SESSION(
      getUploadPodSession: l$getUploadPodSession == null
          ? null
          : Query$GET_UPLOAD_POD_SESSION$getUploadPodSession.fromJson(
              (l$getUploadPodSession as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_UPLOAD_POD_SESSION$getUploadPodSession? getUploadPodSession;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUploadPodSession = getUploadPodSession;
    _resultData['getUploadPodSession'] = l$getUploadPodSession?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUploadPodSession = getUploadPodSession;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getUploadPodSession, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_UPLOAD_POD_SESSION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUploadPodSession = getUploadPodSession;
    final lOther$getUploadPodSession = other.getUploadPodSession;
    if (l$getUploadPodSession != lOther$getUploadPodSession) {
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

extension UtilityExtension$Query$GET_UPLOAD_POD_SESSION
    on Query$GET_UPLOAD_POD_SESSION {
  CopyWith$Query$GET_UPLOAD_POD_SESSION<Query$GET_UPLOAD_POD_SESSION>
  get copyWith => CopyWith$Query$GET_UPLOAD_POD_SESSION(this, (i) => i);
}

abstract class CopyWith$Query$GET_UPLOAD_POD_SESSION<TRes> {
  factory CopyWith$Query$GET_UPLOAD_POD_SESSION(
    Query$GET_UPLOAD_POD_SESSION instance,
    TRes Function(Query$GET_UPLOAD_POD_SESSION) then,
  ) = _CopyWithImpl$Query$GET_UPLOAD_POD_SESSION;

  factory CopyWith$Query$GET_UPLOAD_POD_SESSION.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_UPLOAD_POD_SESSION;

  TRes call({
    Query$GET_UPLOAD_POD_SESSION$getUploadPodSession? getUploadPodSession,
    String? $__typename,
  });
  CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes>
  get getUploadPodSession;
}

class _CopyWithImpl$Query$GET_UPLOAD_POD_SESSION<TRes>
    implements CopyWith$Query$GET_UPLOAD_POD_SESSION<TRes> {
  _CopyWithImpl$Query$GET_UPLOAD_POD_SESSION(this._instance, this._then);

  final Query$GET_UPLOAD_POD_SESSION _instance;

  final TRes Function(Query$GET_UPLOAD_POD_SESSION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUploadPodSession = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_UPLOAD_POD_SESSION(
      getUploadPodSession: getUploadPodSession == _undefined
          ? _instance.getUploadPodSession
          : (getUploadPodSession
                as Query$GET_UPLOAD_POD_SESSION$getUploadPodSession?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes>
  get getUploadPodSession {
    final local$getUploadPodSession = _instance.getUploadPodSession;
    return local$getUploadPodSession == null
        ? CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession.stub(
            _then(_instance),
          )
        : CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(
            local$getUploadPodSession,
            (e) => call(getUploadPodSession: e),
          );
  }
}

class _CopyWithStubImpl$Query$GET_UPLOAD_POD_SESSION<TRes>
    implements CopyWith$Query$GET_UPLOAD_POD_SESSION<TRes> {
  _CopyWithStubImpl$Query$GET_UPLOAD_POD_SESSION(this._res);

  TRes _res;

  call({
    Query$GET_UPLOAD_POD_SESSION$getUploadPodSession? getUploadPodSession,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes>
  get getUploadPodSession =>
      CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession.stub(_res);
}

const documentNodeQueryGET_UPLOAD_POD_SESSION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_UPLOAD_POD_SESSION'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ref_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getUploadPodSession'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'ref_id'),
                value: VariableNode(name: NameNode(value: 'ref_id')),
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
                  name: NameNode(value: 'pod_committed'),
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

class Query$GET_UPLOAD_POD_SESSION$getUploadPodSession {
  Query$GET_UPLOAD_POD_SESSION$getUploadPodSession({
    required this.id,
    required this.status,
    required this.type,
    this.pod_committed,
    this.$__typename = 'UploadPodSession',
  });

  factory Query$GET_UPLOAD_POD_SESSION$getUploadPodSession.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$type = json['type'];
    final l$pod_committed = json['pod_committed'];
    final l$$__typename = json['__typename'];
    return Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(
      id: (l$id as String),
      status: fromJson$Enum$UploadSessionStatus((l$status as String)),
      type: fromJson$Enum$UploadSessionType((l$type as String)),
      pod_committed: (l$pod_committed as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$UploadSessionStatus status;

  final Enum$UploadSessionType type;

  final bool? pod_committed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$UploadSessionStatus(l$status);
    final l$type = type;
    _resultData['type'] = toJson$Enum$UploadSessionType(l$type);
    final l$pod_committed = pod_committed;
    _resultData['pod_committed'] = l$pod_committed;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$type = type;
    final l$pod_committed = pod_committed;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$type,
      l$pod_committed,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_UPLOAD_POD_SESSION$getUploadPodSession ||
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
    final l$pod_committed = pod_committed;
    final lOther$pod_committed = other.pod_committed;
    if (l$pod_committed != lOther$pod_committed) {
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

extension UtilityExtension$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession
    on Query$GET_UPLOAD_POD_SESSION$getUploadPodSession {
  CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<
    Query$GET_UPLOAD_POD_SESSION$getUploadPodSession
  >
  get copyWith =>
      CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(this, (i) => i);
}

abstract class CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes> {
  factory CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(
    Query$GET_UPLOAD_POD_SESSION$getUploadPodSession instance,
    TRes Function(Query$GET_UPLOAD_POD_SESSION$getUploadPodSession) then,
  ) = _CopyWithImpl$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession;

  factory CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession;

  TRes call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    bool? pod_committed,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes>
    implements CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes> {
  _CopyWithImpl$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(
    this._instance,
    this._then,
  );

  final Query$GET_UPLOAD_POD_SESSION$getUploadPodSession _instance;

  final TRes Function(Query$GET_UPLOAD_POD_SESSION$getUploadPodSession) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
    Object? pod_committed = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$UploadSessionStatus),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$UploadSessionType),
      pod_committed: pod_committed == _undefined
          ? _instance.pod_committed
          : (pod_committed as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes>
    implements CopyWith$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession<TRes> {
  _CopyWithStubImpl$Query$GET_UPLOAD_POD_SESSION$getUploadPodSession(this._res);

  TRes _res;

  call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    bool? pod_committed,
    String? $__typename,
  }) => _res;
}
