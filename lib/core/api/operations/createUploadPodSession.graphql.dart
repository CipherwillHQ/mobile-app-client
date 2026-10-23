import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$createUploadPodSession {
  factory Variables$Mutation$createUploadPodSession({
    required String data_model_version,
    required String ref_id,
    required int required_space,
    bool? require_missing_pod,
  }) => Variables$Mutation$createUploadPodSession._({
    r'data_model_version': data_model_version,
    r'ref_id': ref_id,
    r'required_space': required_space,
    if (require_missing_pod != null)
      r'require_missing_pod': require_missing_pod,
  });

  Variables$Mutation$createUploadPodSession._(this._$data);

  factory Variables$Mutation$createUploadPodSession.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$data_model_version = data['data_model_version'];
    result$data['data_model_version'] = (l$data_model_version as String);
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    final l$required_space = data['required_space'];
    result$data['required_space'] = (l$required_space as int);
    if (data.containsKey('require_missing_pod')) {
      final l$require_missing_pod = data['require_missing_pod'];
      result$data['require_missing_pod'] = (l$require_missing_pod as bool?);
    }
    return Variables$Mutation$createUploadPodSession._(result$data);
  }

  Map<String, dynamic> _$data;

  String get data_model_version => (_$data['data_model_version'] as String);

  String get ref_id => (_$data['ref_id'] as String);

  int get required_space => (_$data['required_space'] as int);

  bool? get require_missing_pod => (_$data['require_missing_pod'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data_model_version = data_model_version;
    result$data['data_model_version'] = l$data_model_version;
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    final l$required_space = required_space;
    result$data['required_space'] = l$required_space;
    if (_$data.containsKey('require_missing_pod')) {
      final l$require_missing_pod = require_missing_pod;
      result$data['require_missing_pod'] = l$require_missing_pod;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$createUploadPodSession<
    Variables$Mutation$createUploadPodSession
  >
  get copyWith =>
      CopyWith$Variables$Mutation$createUploadPodSession(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$createUploadPodSession ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data_model_version = data_model_version;
    final lOther$data_model_version = other.data_model_version;
    if (l$data_model_version != lOther$data_model_version) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    final l$required_space = required_space;
    final lOther$required_space = other.required_space;
    if (l$required_space != lOther$required_space) {
      return false;
    }
    final l$require_missing_pod = require_missing_pod;
    final lOther$require_missing_pod = other.require_missing_pod;
    if (_$data.containsKey('require_missing_pod') !=
        other._$data.containsKey('require_missing_pod')) {
      return false;
    }
    if (l$require_missing_pod != lOther$require_missing_pod) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data_model_version = data_model_version;
    final l$ref_id = ref_id;
    final l$required_space = required_space;
    final l$require_missing_pod = require_missing_pod;
    return Object.hashAll([
      l$data_model_version,
      l$ref_id,
      l$required_space,
      _$data.containsKey('require_missing_pod')
          ? l$require_missing_pod
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$createUploadPodSession<TRes> {
  factory CopyWith$Variables$Mutation$createUploadPodSession(
    Variables$Mutation$createUploadPodSession instance,
    TRes Function(Variables$Mutation$createUploadPodSession) then,
  ) = _CopyWithImpl$Variables$Mutation$createUploadPodSession;

  factory CopyWith$Variables$Mutation$createUploadPodSession.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$createUploadPodSession;

  TRes call({
    String? data_model_version,
    String? ref_id,
    int? required_space,
    bool? require_missing_pod,
  });
}

class _CopyWithImpl$Variables$Mutation$createUploadPodSession<TRes>
    implements CopyWith$Variables$Mutation$createUploadPodSession<TRes> {
  _CopyWithImpl$Variables$Mutation$createUploadPodSession(
    this._instance,
    this._then,
  );

  final Variables$Mutation$createUploadPodSession _instance;

  final TRes Function(Variables$Mutation$createUploadPodSession) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data_model_version = _undefined,
    Object? ref_id = _undefined,
    Object? required_space = _undefined,
    Object? require_missing_pod = _undefined,
  }) => _then(
    Variables$Mutation$createUploadPodSession._({
      ..._instance._$data,
      if (data_model_version != _undefined && data_model_version != null)
        'data_model_version': (data_model_version as String),
      if (ref_id != _undefined && ref_id != null) 'ref_id': (ref_id as String),
      if (required_space != _undefined && required_space != null)
        'required_space': (required_space as int),
      if (require_missing_pod != _undefined)
        'require_missing_pod': (require_missing_pod as bool?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$createUploadPodSession<TRes>
    implements CopyWith$Variables$Mutation$createUploadPodSession<TRes> {
  _CopyWithStubImpl$Variables$Mutation$createUploadPodSession(this._res);

  TRes _res;

  call({
    String? data_model_version,
    String? ref_id,
    int? required_space,
    bool? require_missing_pod,
  }) => _res;
}

class Mutation$createUploadPodSession {
  Mutation$createUploadPodSession({
    required this.createUploadPodSession,
    this.$__typename = 'Mutation',
  });

  factory Mutation$createUploadPodSession.fromJson(Map<String, dynamic> json) {
    final l$createUploadPodSession = json['createUploadPodSession'];
    final l$$__typename = json['__typename'];
    return Mutation$createUploadPodSession(
      createUploadPodSession:
          Mutation$createUploadPodSession$createUploadPodSession.fromJson(
            (l$createUploadPodSession as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$createUploadPodSession$createUploadPodSession
  createUploadPodSession;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createUploadPodSession = createUploadPodSession;
    _resultData['createUploadPodSession'] = l$createUploadPodSession.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createUploadPodSession = createUploadPodSession;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createUploadPodSession, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$createUploadPodSession ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createUploadPodSession = createUploadPodSession;
    final lOther$createUploadPodSession = other.createUploadPodSession;
    if (l$createUploadPodSession != lOther$createUploadPodSession) {
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

extension UtilityExtension$Mutation$createUploadPodSession
    on Mutation$createUploadPodSession {
  CopyWith$Mutation$createUploadPodSession<Mutation$createUploadPodSession>
  get copyWith => CopyWith$Mutation$createUploadPodSession(this, (i) => i);
}

abstract class CopyWith$Mutation$createUploadPodSession<TRes> {
  factory CopyWith$Mutation$createUploadPodSession(
    Mutation$createUploadPodSession instance,
    TRes Function(Mutation$createUploadPodSession) then,
  ) = _CopyWithImpl$Mutation$createUploadPodSession;

  factory CopyWith$Mutation$createUploadPodSession.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createUploadPodSession;

  TRes call({
    Mutation$createUploadPodSession$createUploadPodSession?
    createUploadPodSession,
    String? $__typename,
  });
  CopyWith$Mutation$createUploadPodSession$createUploadPodSession<TRes>
  get createUploadPodSession;
}

class _CopyWithImpl$Mutation$createUploadPodSession<TRes>
    implements CopyWith$Mutation$createUploadPodSession<TRes> {
  _CopyWithImpl$Mutation$createUploadPodSession(this._instance, this._then);

  final Mutation$createUploadPodSession _instance;

  final TRes Function(Mutation$createUploadPodSession) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createUploadPodSession = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$createUploadPodSession(
      createUploadPodSession:
          createUploadPodSession == _undefined || createUploadPodSession == null
          ? _instance.createUploadPodSession
          : (createUploadPodSession
                as Mutation$createUploadPodSession$createUploadPodSession),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$createUploadPodSession$createUploadPodSession<TRes>
  get createUploadPodSession {
    final local$createUploadPodSession = _instance.createUploadPodSession;
    return CopyWith$Mutation$createUploadPodSession$createUploadPodSession(
      local$createUploadPodSession,
      (e) => call(createUploadPodSession: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$createUploadPodSession<TRes>
    implements CopyWith$Mutation$createUploadPodSession<TRes> {
  _CopyWithStubImpl$Mutation$createUploadPodSession(this._res);

  TRes _res;

  call({
    Mutation$createUploadPodSession$createUploadPodSession?
    createUploadPodSession,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$createUploadPodSession$createUploadPodSession<TRes>
  get createUploadPodSession =>
      CopyWith$Mutation$createUploadPodSession$createUploadPodSession.stub(
        _res,
      );
}

const documentNodeMutationcreateUploadPodSession = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'createUploadPodSession'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'data_model_version')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ref_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'required_space')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'require_missing_pod')),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createUploadPodSession'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'data_model_version'),
                value: VariableNode(
                  name: NameNode(value: 'data_model_version'),
                ),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref_id'),
                value: VariableNode(name: NameNode(value: 'ref_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'required_space'),
                value: VariableNode(name: NameNode(value: 'required_space')),
              ),
              ArgumentNode(
                name: NameNode(value: 'require_missing_pod'),
                value: VariableNode(
                  name: NameNode(value: 'require_missing_pod'),
                ),
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
                  name: NameNode(value: 'presigned_upload_url'),
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

class Mutation$createUploadPodSession$createUploadPodSession {
  Mutation$createUploadPodSession$createUploadPodSession({
    required this.id,
    required this.status,
    required this.type,
    this.presigned_upload_url,
    this.$__typename = 'UploadPodSession',
  });

  factory Mutation$createUploadPodSession$createUploadPodSession.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$type = json['type'];
    final l$presigned_upload_url = json['presigned_upload_url'];
    final l$$__typename = json['__typename'];
    return Mutation$createUploadPodSession$createUploadPodSession(
      id: (l$id as String),
      status: fromJson$Enum$UploadSessionStatus((l$status as String)),
      type: fromJson$Enum$UploadSessionType((l$type as String)),
      presigned_upload_url: (l$presigned_upload_url as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$UploadSessionStatus status;

  final Enum$UploadSessionType type;

  final String? presigned_upload_url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$UploadSessionStatus(l$status);
    final l$type = type;
    _resultData['type'] = toJson$Enum$UploadSessionType(l$type);
    final l$presigned_upload_url = presigned_upload_url;
    _resultData['presigned_upload_url'] = l$presigned_upload_url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$type = type;
    final l$presigned_upload_url = presigned_upload_url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$type,
      l$presigned_upload_url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$createUploadPodSession$createUploadPodSession ||
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
    final l$presigned_upload_url = presigned_upload_url;
    final lOther$presigned_upload_url = other.presigned_upload_url;
    if (l$presigned_upload_url != lOther$presigned_upload_url) {
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

extension UtilityExtension$Mutation$createUploadPodSession$createUploadPodSession
    on Mutation$createUploadPodSession$createUploadPodSession {
  CopyWith$Mutation$createUploadPodSession$createUploadPodSession<
    Mutation$createUploadPodSession$createUploadPodSession
  >
  get copyWith =>
      CopyWith$Mutation$createUploadPodSession$createUploadPodSession(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$createUploadPodSession$createUploadPodSession<
  TRes
> {
  factory CopyWith$Mutation$createUploadPodSession$createUploadPodSession(
    Mutation$createUploadPodSession$createUploadPodSession instance,
    TRes Function(Mutation$createUploadPodSession$createUploadPodSession) then,
  ) = _CopyWithImpl$Mutation$createUploadPodSession$createUploadPodSession;

  factory CopyWith$Mutation$createUploadPodSession$createUploadPodSession.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$createUploadPodSession$createUploadPodSession;

  TRes call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? presigned_upload_url,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$createUploadPodSession$createUploadPodSession<TRes>
    implements
        CopyWith$Mutation$createUploadPodSession$createUploadPodSession<TRes> {
  _CopyWithImpl$Mutation$createUploadPodSession$createUploadPodSession(
    this._instance,
    this._then,
  );

  final Mutation$createUploadPodSession$createUploadPodSession _instance;

  final TRes Function(Mutation$createUploadPodSession$createUploadPodSession)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
    Object? presigned_upload_url = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$createUploadPodSession$createUploadPodSession(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$UploadSessionStatus),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$UploadSessionType),
      presigned_upload_url: presigned_upload_url == _undefined
          ? _instance.presigned_upload_url
          : (presigned_upload_url as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$createUploadPodSession$createUploadPodSession<
  TRes
>
    implements
        CopyWith$Mutation$createUploadPodSession$createUploadPodSession<TRes> {
  _CopyWithStubImpl$Mutation$createUploadPodSession$createUploadPodSession(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? presigned_upload_url,
    String? $__typename,
  }) => _res;
}
