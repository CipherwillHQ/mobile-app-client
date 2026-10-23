import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$uploadSessionPod {
  factory Variables$Mutation$uploadSessionPod({
    required String session_id,
    required String file,
  }) => Variables$Mutation$uploadSessionPod._({
    r'session_id': session_id,
    r'file': file,
  });

  Variables$Mutation$uploadSessionPod._(this._$data);

  factory Variables$Mutation$uploadSessionPod.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$session_id = data['session_id'];
    result$data['session_id'] = (l$session_id as String);
    final l$file = data['file'];
    result$data['file'] = (l$file as String);
    return Variables$Mutation$uploadSessionPod._(result$data);
  }

  Map<String, dynamic> _$data;

  String get session_id => (_$data['session_id'] as String);

  String get file => (_$data['file'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$session_id = session_id;
    result$data['session_id'] = l$session_id;
    final l$file = file;
    result$data['file'] = l$file;
    return result$data;
  }

  CopyWith$Variables$Mutation$uploadSessionPod<
    Variables$Mutation$uploadSessionPod
  >
  get copyWith => CopyWith$Variables$Mutation$uploadSessionPod(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$uploadSessionPod ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$file = file;
    final lOther$file = other.file;
    if (l$file != lOther$file) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$file = file;
    return Object.hashAll([l$session_id, l$file]);
  }
}

abstract class CopyWith$Variables$Mutation$uploadSessionPod<TRes> {
  factory CopyWith$Variables$Mutation$uploadSessionPod(
    Variables$Mutation$uploadSessionPod instance,
    TRes Function(Variables$Mutation$uploadSessionPod) then,
  ) = _CopyWithImpl$Variables$Mutation$uploadSessionPod;

  factory CopyWith$Variables$Mutation$uploadSessionPod.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$uploadSessionPod;

  TRes call({String? session_id, String? file});
}

class _CopyWithImpl$Variables$Mutation$uploadSessionPod<TRes>
    implements CopyWith$Variables$Mutation$uploadSessionPod<TRes> {
  _CopyWithImpl$Variables$Mutation$uploadSessionPod(this._instance, this._then);

  final Variables$Mutation$uploadSessionPod _instance;

  final TRes Function(Variables$Mutation$uploadSessionPod) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? session_id = _undefined, Object? file = _undefined}) =>
      _then(
        Variables$Mutation$uploadSessionPod._({
          ..._instance._$data,
          if (session_id != _undefined && session_id != null)
            'session_id': (session_id as String),
          if (file != _undefined && file != null) 'file': (file as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$uploadSessionPod<TRes>
    implements CopyWith$Variables$Mutation$uploadSessionPod<TRes> {
  _CopyWithStubImpl$Variables$Mutation$uploadSessionPod(this._res);

  TRes _res;

  call({String? session_id, String? file}) => _res;
}

class Mutation$uploadSessionPod {
  Mutation$uploadSessionPod({
    required this.uploadSessionPod,
    this.$__typename = 'Mutation',
  });

  factory Mutation$uploadSessionPod.fromJson(Map<String, dynamic> json) {
    final l$uploadSessionPod = json['uploadSessionPod'];
    final l$$__typename = json['__typename'];
    return Mutation$uploadSessionPod(
      uploadSessionPod: Mutation$uploadSessionPod$uploadSessionPod.fromJson(
        (l$uploadSessionPod as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$uploadSessionPod$uploadSessionPod uploadSessionPod;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$uploadSessionPod = uploadSessionPod;
    _resultData['uploadSessionPod'] = l$uploadSessionPod.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$uploadSessionPod = uploadSessionPod;
    final l$$__typename = $__typename;
    return Object.hashAll([l$uploadSessionPod, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$uploadSessionPod ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$uploadSessionPod = uploadSessionPod;
    final lOther$uploadSessionPod = other.uploadSessionPod;
    if (l$uploadSessionPod != lOther$uploadSessionPod) {
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

extension UtilityExtension$Mutation$uploadSessionPod
    on Mutation$uploadSessionPod {
  CopyWith$Mutation$uploadSessionPod<Mutation$uploadSessionPod> get copyWith =>
      CopyWith$Mutation$uploadSessionPod(this, (i) => i);
}

abstract class CopyWith$Mutation$uploadSessionPod<TRes> {
  factory CopyWith$Mutation$uploadSessionPod(
    Mutation$uploadSessionPod instance,
    TRes Function(Mutation$uploadSessionPod) then,
  ) = _CopyWithImpl$Mutation$uploadSessionPod;

  factory CopyWith$Mutation$uploadSessionPod.stub(TRes res) =
      _CopyWithStubImpl$Mutation$uploadSessionPod;

  TRes call({
    Mutation$uploadSessionPod$uploadSessionPod? uploadSessionPod,
    String? $__typename,
  });
  CopyWith$Mutation$uploadSessionPod$uploadSessionPod<TRes>
  get uploadSessionPod;
}

class _CopyWithImpl$Mutation$uploadSessionPod<TRes>
    implements CopyWith$Mutation$uploadSessionPod<TRes> {
  _CopyWithImpl$Mutation$uploadSessionPod(this._instance, this._then);

  final Mutation$uploadSessionPod _instance;

  final TRes Function(Mutation$uploadSessionPod) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? uploadSessionPod = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$uploadSessionPod(
      uploadSessionPod:
          uploadSessionPod == _undefined || uploadSessionPod == null
          ? _instance.uploadSessionPod
          : (uploadSessionPod as Mutation$uploadSessionPod$uploadSessionPod),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$uploadSessionPod$uploadSessionPod<TRes>
  get uploadSessionPod {
    final local$uploadSessionPod = _instance.uploadSessionPod;
    return CopyWith$Mutation$uploadSessionPod$uploadSessionPod(
      local$uploadSessionPod,
      (e) => call(uploadSessionPod: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$uploadSessionPod<TRes>
    implements CopyWith$Mutation$uploadSessionPod<TRes> {
  _CopyWithStubImpl$Mutation$uploadSessionPod(this._res);

  TRes _res;

  call({
    Mutation$uploadSessionPod$uploadSessionPod? uploadSessionPod,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$uploadSessionPod$uploadSessionPod<TRes>
  get uploadSessionPod =>
      CopyWith$Mutation$uploadSessionPod$uploadSessionPod.stub(_res);
}

const documentNodeMutationuploadSessionPod = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'uploadSessionPod'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'session_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'file')),
          type: NamedTypeNode(name: NameNode(value: 'Upload'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'uploadSessionPod'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'session_id'),
                value: VariableNode(name: NameNode(value: 'session_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'file'),
                value: VariableNode(name: NameNode(value: 'file')),
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

class Mutation$uploadSessionPod$uploadSessionPod {
  Mutation$uploadSessionPod$uploadSessionPod({
    required this.id,
    required this.status,
    required this.type,
    this.$__typename = 'UploadPodSession',
  });

  factory Mutation$uploadSessionPod$uploadSessionPod.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Mutation$uploadSessionPod$uploadSessionPod(
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
    if (other is! Mutation$uploadSessionPod$uploadSessionPod ||
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

extension UtilityExtension$Mutation$uploadSessionPod$uploadSessionPod
    on Mutation$uploadSessionPod$uploadSessionPod {
  CopyWith$Mutation$uploadSessionPod$uploadSessionPod<
    Mutation$uploadSessionPod$uploadSessionPod
  >
  get copyWith =>
      CopyWith$Mutation$uploadSessionPod$uploadSessionPod(this, (i) => i);
}

abstract class CopyWith$Mutation$uploadSessionPod$uploadSessionPod<TRes> {
  factory CopyWith$Mutation$uploadSessionPod$uploadSessionPod(
    Mutation$uploadSessionPod$uploadSessionPod instance,
    TRes Function(Mutation$uploadSessionPod$uploadSessionPod) then,
  ) = _CopyWithImpl$Mutation$uploadSessionPod$uploadSessionPod;

  factory CopyWith$Mutation$uploadSessionPod$uploadSessionPod.stub(TRes res) =
      _CopyWithStubImpl$Mutation$uploadSessionPod$uploadSessionPod;

  TRes call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$uploadSessionPod$uploadSessionPod<TRes>
    implements CopyWith$Mutation$uploadSessionPod$uploadSessionPod<TRes> {
  _CopyWithImpl$Mutation$uploadSessionPod$uploadSessionPod(
    this._instance,
    this._then,
  );

  final Mutation$uploadSessionPod$uploadSessionPod _instance;

  final TRes Function(Mutation$uploadSessionPod$uploadSessionPod) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$uploadSessionPod$uploadSessionPod(
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

class _CopyWithStubImpl$Mutation$uploadSessionPod$uploadSessionPod<TRes>
    implements CopyWith$Mutation$uploadSessionPod$uploadSessionPod<TRes> {
  _CopyWithStubImpl$Mutation$uploadSessionPod$uploadSessionPod(this._res);

  TRes _res;

  call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? $__typename,
  }) => _res;
}
