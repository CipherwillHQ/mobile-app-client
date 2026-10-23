import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$uploadSessionKeys {
  factory Variables$Mutation$uploadSessionKeys({
    required String session_id,
    required List<Input$KeyInput> keys,
  }) => Variables$Mutation$uploadSessionKeys._({
    r'session_id': session_id,
    r'keys': keys,
  });

  Variables$Mutation$uploadSessionKeys._(this._$data);

  factory Variables$Mutation$uploadSessionKeys.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$session_id = data['session_id'];
    result$data['session_id'] = (l$session_id as String);
    final l$keys = data['keys'];
    result$data['keys'] = (l$keys as List<dynamic>)
        .map((e) => Input$KeyInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Variables$Mutation$uploadSessionKeys._(result$data);
  }

  Map<String, dynamic> _$data;

  String get session_id => (_$data['session_id'] as String);

  List<Input$KeyInput> get keys => (_$data['keys'] as List<Input$KeyInput>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$session_id = session_id;
    result$data['session_id'] = l$session_id;
    final l$keys = keys;
    result$data['keys'] = l$keys.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$uploadSessionKeys<
    Variables$Mutation$uploadSessionKeys
  >
  get copyWith => CopyWith$Variables$Mutation$uploadSessionKeys(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$uploadSessionKeys ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$session_id = session_id;
    final lOther$session_id = other.session_id;
    if (l$session_id != lOther$session_id) {
      return false;
    }
    final l$keys = keys;
    final lOther$keys = other.keys;
    if (l$keys.length != lOther$keys.length) {
      return false;
    }
    for (int i = 0; i < l$keys.length; i++) {
      final l$keys$entry = l$keys[i];
      final lOther$keys$entry = lOther$keys[i];
      if (l$keys$entry != lOther$keys$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$session_id = session_id;
    final l$keys = keys;
    return Object.hashAll([l$session_id, Object.hashAll(l$keys.map((v) => v))]);
  }
}

abstract class CopyWith$Variables$Mutation$uploadSessionKeys<TRes> {
  factory CopyWith$Variables$Mutation$uploadSessionKeys(
    Variables$Mutation$uploadSessionKeys instance,
    TRes Function(Variables$Mutation$uploadSessionKeys) then,
  ) = _CopyWithImpl$Variables$Mutation$uploadSessionKeys;

  factory CopyWith$Variables$Mutation$uploadSessionKeys.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$uploadSessionKeys;

  TRes call({String? session_id, List<Input$KeyInput>? keys});
}

class _CopyWithImpl$Variables$Mutation$uploadSessionKeys<TRes>
    implements CopyWith$Variables$Mutation$uploadSessionKeys<TRes> {
  _CopyWithImpl$Variables$Mutation$uploadSessionKeys(
    this._instance,
    this._then,
  );

  final Variables$Mutation$uploadSessionKeys _instance;

  final TRes Function(Variables$Mutation$uploadSessionKeys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? session_id = _undefined, Object? keys = _undefined}) =>
      _then(
        Variables$Mutation$uploadSessionKeys._({
          ..._instance._$data,
          if (session_id != _undefined && session_id != null)
            'session_id': (session_id as String),
          if (keys != _undefined && keys != null)
            'keys': (keys as List<Input$KeyInput>),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$uploadSessionKeys<TRes>
    implements CopyWith$Variables$Mutation$uploadSessionKeys<TRes> {
  _CopyWithStubImpl$Variables$Mutation$uploadSessionKeys(this._res);

  TRes _res;

  call({String? session_id, List<Input$KeyInput>? keys}) => _res;
}

class Mutation$uploadSessionKeys {
  Mutation$uploadSessionKeys({
    required this.uploadSessionKeys,
    this.$__typename = 'Mutation',
  });

  factory Mutation$uploadSessionKeys.fromJson(Map<String, dynamic> json) {
    final l$uploadSessionKeys = json['uploadSessionKeys'];
    final l$$__typename = json['__typename'];
    return Mutation$uploadSessionKeys(
      uploadSessionKeys: Mutation$uploadSessionKeys$uploadSessionKeys.fromJson(
        (l$uploadSessionKeys as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$uploadSessionKeys$uploadSessionKeys uploadSessionKeys;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$uploadSessionKeys = uploadSessionKeys;
    _resultData['uploadSessionKeys'] = l$uploadSessionKeys.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$uploadSessionKeys = uploadSessionKeys;
    final l$$__typename = $__typename;
    return Object.hashAll([l$uploadSessionKeys, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$uploadSessionKeys ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$uploadSessionKeys = uploadSessionKeys;
    final lOther$uploadSessionKeys = other.uploadSessionKeys;
    if (l$uploadSessionKeys != lOther$uploadSessionKeys) {
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

extension UtilityExtension$Mutation$uploadSessionKeys
    on Mutation$uploadSessionKeys {
  CopyWith$Mutation$uploadSessionKeys<Mutation$uploadSessionKeys>
  get copyWith => CopyWith$Mutation$uploadSessionKeys(this, (i) => i);
}

abstract class CopyWith$Mutation$uploadSessionKeys<TRes> {
  factory CopyWith$Mutation$uploadSessionKeys(
    Mutation$uploadSessionKeys instance,
    TRes Function(Mutation$uploadSessionKeys) then,
  ) = _CopyWithImpl$Mutation$uploadSessionKeys;

  factory CopyWith$Mutation$uploadSessionKeys.stub(TRes res) =
      _CopyWithStubImpl$Mutation$uploadSessionKeys;

  TRes call({
    Mutation$uploadSessionKeys$uploadSessionKeys? uploadSessionKeys,
    String? $__typename,
  });
  CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<TRes>
  get uploadSessionKeys;
}

class _CopyWithImpl$Mutation$uploadSessionKeys<TRes>
    implements CopyWith$Mutation$uploadSessionKeys<TRes> {
  _CopyWithImpl$Mutation$uploadSessionKeys(this._instance, this._then);

  final Mutation$uploadSessionKeys _instance;

  final TRes Function(Mutation$uploadSessionKeys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? uploadSessionKeys = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$uploadSessionKeys(
      uploadSessionKeys:
          uploadSessionKeys == _undefined || uploadSessionKeys == null
          ? _instance.uploadSessionKeys
          : (uploadSessionKeys as Mutation$uploadSessionKeys$uploadSessionKeys),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<TRes>
  get uploadSessionKeys {
    final local$uploadSessionKeys = _instance.uploadSessionKeys;
    return CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys(
      local$uploadSessionKeys,
      (e) => call(uploadSessionKeys: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$uploadSessionKeys<TRes>
    implements CopyWith$Mutation$uploadSessionKeys<TRes> {
  _CopyWithStubImpl$Mutation$uploadSessionKeys(this._res);

  TRes _res;

  call({
    Mutation$uploadSessionKeys$uploadSessionKeys? uploadSessionKeys,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<TRes>
  get uploadSessionKeys =>
      CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys.stub(_res);
}

const documentNodeMutationuploadSessionKeys = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'uploadSessionKeys'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'session_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'keys')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'KeyInput'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'uploadSessionKeys'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'session_id'),
                value: VariableNode(name: NameNode(value: 'session_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'keys'),
                value: VariableNode(name: NameNode(value: 'keys')),
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

class Mutation$uploadSessionKeys$uploadSessionKeys {
  Mutation$uploadSessionKeys$uploadSessionKeys({
    required this.id,
    required this.status,
    required this.type,
    this.$__typename = 'UploadPodSession',
  });

  factory Mutation$uploadSessionKeys$uploadSessionKeys.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$type = json['type'];
    final l$$__typename = json['__typename'];
    return Mutation$uploadSessionKeys$uploadSessionKeys(
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
    if (other is! Mutation$uploadSessionKeys$uploadSessionKeys ||
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

extension UtilityExtension$Mutation$uploadSessionKeys$uploadSessionKeys
    on Mutation$uploadSessionKeys$uploadSessionKeys {
  CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<
    Mutation$uploadSessionKeys$uploadSessionKeys
  >
  get copyWith =>
      CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys(this, (i) => i);
}

abstract class CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<TRes> {
  factory CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys(
    Mutation$uploadSessionKeys$uploadSessionKeys instance,
    TRes Function(Mutation$uploadSessionKeys$uploadSessionKeys) then,
  ) = _CopyWithImpl$Mutation$uploadSessionKeys$uploadSessionKeys;

  factory CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys.stub(TRes res) =
      _CopyWithStubImpl$Mutation$uploadSessionKeys$uploadSessionKeys;

  TRes call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$uploadSessionKeys$uploadSessionKeys<TRes>
    implements CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<TRes> {
  _CopyWithImpl$Mutation$uploadSessionKeys$uploadSessionKeys(
    this._instance,
    this._then,
  );

  final Mutation$uploadSessionKeys$uploadSessionKeys _instance;

  final TRes Function(Mutation$uploadSessionKeys$uploadSessionKeys) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? type = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$uploadSessionKeys$uploadSessionKeys(
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

class _CopyWithStubImpl$Mutation$uploadSessionKeys$uploadSessionKeys<TRes>
    implements CopyWith$Mutation$uploadSessionKeys$uploadSessionKeys<TRes> {
  _CopyWithStubImpl$Mutation$uploadSessionKeys$uploadSessionKeys(this._res);

  TRes _res;

  call({
    String? id,
    Enum$UploadSessionStatus? status,
    Enum$UploadSessionType? type,
    String? $__typename,
  }) => _res;
}
