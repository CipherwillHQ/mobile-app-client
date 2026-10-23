import 'package:gql/ast.dart';

class Variables$Query$GET_FOLDER {
  factory Variables$Query$GET_FOLDER({required String id}) =>
      Variables$Query$GET_FOLDER._({r'id': id});

  Variables$Query$GET_FOLDER._(this._$data);

  factory Variables$Query$GET_FOLDER.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GET_FOLDER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_FOLDER<Variables$Query$GET_FOLDER>
  get copyWith => CopyWith$Variables$Query$GET_FOLDER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_FOLDER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GET_FOLDER<TRes> {
  factory CopyWith$Variables$Query$GET_FOLDER(
    Variables$Query$GET_FOLDER instance,
    TRes Function(Variables$Query$GET_FOLDER) then,
  ) = _CopyWithImpl$Variables$Query$GET_FOLDER;

  factory CopyWith$Variables$Query$GET_FOLDER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_FOLDER;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GET_FOLDER<TRes>
    implements CopyWith$Variables$Query$GET_FOLDER<TRes> {
  _CopyWithImpl$Variables$Query$GET_FOLDER(this._instance, this._then);

  final Variables$Query$GET_FOLDER _instance;

  final TRes Function(Variables$Query$GET_FOLDER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GET_FOLDER._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_FOLDER<TRes>
    implements CopyWith$Variables$Query$GET_FOLDER<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_FOLDER(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GET_FOLDER {
  Query$GET_FOLDER({required this.getFolder, this.$__typename = 'Query'});

  factory Query$GET_FOLDER.fromJson(Map<String, dynamic> json) {
    final l$getFolder = json['getFolder'];
    final l$$__typename = json['__typename'];
    return Query$GET_FOLDER(
      getFolder: Query$GET_FOLDER$getFolder.fromJson(
        (l$getFolder as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_FOLDER$getFolder getFolder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getFolder = getFolder;
    _resultData['getFolder'] = l$getFolder.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getFolder = getFolder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getFolder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_FOLDER || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getFolder = getFolder;
    final lOther$getFolder = other.getFolder;
    if (l$getFolder != lOther$getFolder) {
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

extension UtilityExtension$Query$GET_FOLDER on Query$GET_FOLDER {
  CopyWith$Query$GET_FOLDER<Query$GET_FOLDER> get copyWith =>
      CopyWith$Query$GET_FOLDER(this, (i) => i);
}

abstract class CopyWith$Query$GET_FOLDER<TRes> {
  factory CopyWith$Query$GET_FOLDER(
    Query$GET_FOLDER instance,
    TRes Function(Query$GET_FOLDER) then,
  ) = _CopyWithImpl$Query$GET_FOLDER;

  factory CopyWith$Query$GET_FOLDER.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_FOLDER;

  TRes call({Query$GET_FOLDER$getFolder? getFolder, String? $__typename});
  CopyWith$Query$GET_FOLDER$getFolder<TRes> get getFolder;
}

class _CopyWithImpl$Query$GET_FOLDER<TRes>
    implements CopyWith$Query$GET_FOLDER<TRes> {
  _CopyWithImpl$Query$GET_FOLDER(this._instance, this._then);

  final Query$GET_FOLDER _instance;

  final TRes Function(Query$GET_FOLDER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getFolder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_FOLDER(
      getFolder: getFolder == _undefined || getFolder == null
          ? _instance.getFolder
          : (getFolder as Query$GET_FOLDER$getFolder),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_FOLDER$getFolder<TRes> get getFolder {
    final local$getFolder = _instance.getFolder;
    return CopyWith$Query$GET_FOLDER$getFolder(
      local$getFolder,
      (e) => call(getFolder: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_FOLDER<TRes>
    implements CopyWith$Query$GET_FOLDER<TRes> {
  _CopyWithStubImpl$Query$GET_FOLDER(this._res);

  TRes _res;

  call({Query$GET_FOLDER$getFolder? getFolder, String? $__typename}) => _res;

  CopyWith$Query$GET_FOLDER$getFolder<TRes> get getFolder =>
      CopyWith$Query$GET_FOLDER$getFolder.stub(_res);
}

const documentNodeQueryGET_FOLDER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_FOLDER'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getFolder'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'folder_id'),
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
                  name: NameNode(value: 'updated_at'),
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

class Query$GET_FOLDER$getFolder {
  Query$GET_FOLDER$getFolder({
    required this.id,
    required this.name,
    required this.folder_id,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Folder',
  });

  factory Query$GET_FOLDER$getFolder.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$folder_id = json['folder_id'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_FOLDER$getFolder(
      id: (l$id as String),
      name: (l$name as String),
      folder_id: (l$folder_id as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String folder_id;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$folder_id = folder_id;
    _resultData['folder_id'] = l$folder_id;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$folder_id = folder_id;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$folder_id,
      l$created_at,
      l$updated_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_FOLDER$getFolder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$folder_id = folder_id;
    final lOther$folder_id = other.folder_id;
    if (l$folder_id != lOther$folder_id) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (l$updated_at != lOther$updated_at) {
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

extension UtilityExtension$Query$GET_FOLDER$getFolder
    on Query$GET_FOLDER$getFolder {
  CopyWith$Query$GET_FOLDER$getFolder<Query$GET_FOLDER$getFolder>
  get copyWith => CopyWith$Query$GET_FOLDER$getFolder(this, (i) => i);
}

abstract class CopyWith$Query$GET_FOLDER$getFolder<TRes> {
  factory CopyWith$Query$GET_FOLDER$getFolder(
    Query$GET_FOLDER$getFolder instance,
    TRes Function(Query$GET_FOLDER$getFolder) then,
  ) = _CopyWithImpl$Query$GET_FOLDER$getFolder;

  factory CopyWith$Query$GET_FOLDER$getFolder.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_FOLDER$getFolder;

  TRes call({
    String? id,
    String? name,
    String? folder_id,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_FOLDER$getFolder<TRes>
    implements CopyWith$Query$GET_FOLDER$getFolder<TRes> {
  _CopyWithImpl$Query$GET_FOLDER$getFolder(this._instance, this._then);

  final Query$GET_FOLDER$getFolder _instance;

  final TRes Function(Query$GET_FOLDER$getFolder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? folder_id = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_FOLDER$getFolder(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      folder_id: folder_id == _undefined || folder_id == null
          ? _instance.folder_id
          : (folder_id as String),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      updated_at: updated_at == _undefined || updated_at == null
          ? _instance.updated_at
          : (updated_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_FOLDER$getFolder<TRes>
    implements CopyWith$Query$GET_FOLDER$getFolder<TRes> {
  _CopyWithStubImpl$Query$GET_FOLDER$getFolder(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? folder_id,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
