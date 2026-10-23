import 'package:gql/ast.dart';

class Variables$Query$GET_GRANTED_STORAGE_FOLDERS {
  factory Variables$Query$GET_GRANTED_STORAGE_FOLDERS({
    required String access_id,
    String? cursor,
    String? folder_id,
  }) => Variables$Query$GET_GRANTED_STORAGE_FOLDERS._({
    r'access_id': access_id,
    if (cursor != null) r'cursor': cursor,
    if (folder_id != null) r'folder_id': folder_id,
  });

  Variables$Query$GET_GRANTED_STORAGE_FOLDERS._(this._$data);

  factory Variables$Query$GET_GRANTED_STORAGE_FOLDERS.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    if (data.containsKey('cursor')) {
      final l$cursor = data['cursor'];
      result$data['cursor'] = (l$cursor as String?);
    }
    if (data.containsKey('folder_id')) {
      final l$folder_id = data['folder_id'];
      result$data['folder_id'] = (l$folder_id as String?);
    }
    return Variables$Query$GET_GRANTED_STORAGE_FOLDERS._(result$data);
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  String? get cursor => (_$data['cursor'] as String?);

  String? get folder_id => (_$data['folder_id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    if (_$data.containsKey('cursor')) {
      final l$cursor = cursor;
      result$data['cursor'] = l$cursor;
    }
    if (_$data.containsKey('folder_id')) {
      final l$folder_id = folder_id;
      result$data['folder_id'] = l$folder_id;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS<
    Variables$Query$GET_GRANTED_STORAGE_FOLDERS
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_GRANTED_STORAGE_FOLDERS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (_$data.containsKey('cursor') != other._$data.containsKey('cursor')) {
      return false;
    }
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$folder_id = folder_id;
    final lOther$folder_id = other.folder_id;
    if (_$data.containsKey('folder_id') !=
        other._$data.containsKey('folder_id')) {
      return false;
    }
    if (l$folder_id != lOther$folder_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$access_id = access_id;
    final l$cursor = cursor;
    final l$folder_id = folder_id;
    return Object.hashAll([
      l$access_id,
      _$data.containsKey('cursor') ? l$cursor : const {},
      _$data.containsKey('folder_id') ? l$folder_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS<TRes> {
  factory CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS(
    Variables$Query$GET_GRANTED_STORAGE_FOLDERS instance,
    TRes Function(Variables$Query$GET_GRANTED_STORAGE_FOLDERS) then,
  ) = _CopyWithImpl$Variables$Query$GET_GRANTED_STORAGE_FOLDERS;

  factory CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_GRANTED_STORAGE_FOLDERS;

  TRes call({String? access_id, String? cursor, String? folder_id});
}

class _CopyWithImpl$Variables$Query$GET_GRANTED_STORAGE_FOLDERS<TRes>
    implements CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS<TRes> {
  _CopyWithImpl$Variables$Query$GET_GRANTED_STORAGE_FOLDERS(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_GRANTED_STORAGE_FOLDERS _instance;

  final TRes Function(Variables$Query$GET_GRANTED_STORAGE_FOLDERS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? access_id = _undefined,
    Object? cursor = _undefined,
    Object? folder_id = _undefined,
  }) => _then(
    Variables$Query$GET_GRANTED_STORAGE_FOLDERS._({
      ..._instance._$data,
      if (access_id != _undefined && access_id != null)
        'access_id': (access_id as String),
      if (cursor != _undefined) 'cursor': (cursor as String?),
      if (folder_id != _undefined) 'folder_id': (folder_id as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_GRANTED_STORAGE_FOLDERS<TRes>
    implements CopyWith$Variables$Query$GET_GRANTED_STORAGE_FOLDERS<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_GRANTED_STORAGE_FOLDERS(this._res);

  TRes _res;

  call({String? access_id, String? cursor, String? folder_id}) => _res;
}

class Query$GET_GRANTED_STORAGE_FOLDERS {
  Query$GET_GRANTED_STORAGE_FOLDERS({
    required this.getGrantedStorageFolders,
    this.$__typename = 'Query',
  });

  factory Query$GET_GRANTED_STORAGE_FOLDERS.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getGrantedStorageFolders = json['getGrantedStorageFolders'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_STORAGE_FOLDERS(
      getGrantedStorageFolders:
          Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders.fromJson(
            (l$getGrantedStorageFolders as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders
  getGrantedStorageFolders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getGrantedStorageFolders = getGrantedStorageFolders;
    _resultData['getGrantedStorageFolders'] = l$getGrantedStorageFolders
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getGrantedStorageFolders = getGrantedStorageFolders;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getGrantedStorageFolders, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_STORAGE_FOLDERS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getGrantedStorageFolders = getGrantedStorageFolders;
    final lOther$getGrantedStorageFolders = other.getGrantedStorageFolders;
    if (l$getGrantedStorageFolders != lOther$getGrantedStorageFolders) {
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

extension UtilityExtension$Query$GET_GRANTED_STORAGE_FOLDERS
    on Query$GET_GRANTED_STORAGE_FOLDERS {
  CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS<Query$GET_GRANTED_STORAGE_FOLDERS>
  get copyWith => CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS(this, (i) => i);
}

abstract class CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS<TRes> {
  factory CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS(
    Query$GET_GRANTED_STORAGE_FOLDERS instance,
    TRes Function(Query$GET_GRANTED_STORAGE_FOLDERS) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS;

  factory CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS;

  TRes call({
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders?
    getGrantedStorageFolders,
    String? $__typename,
  });
  CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<TRes>
  get getGrantedStorageFolders;
}

class _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS<TRes>
    implements CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS(this._instance, this._then);

  final Query$GET_GRANTED_STORAGE_FOLDERS _instance;

  final TRes Function(Query$GET_GRANTED_STORAGE_FOLDERS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getGrantedStorageFolders = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_STORAGE_FOLDERS(
      getGrantedStorageFolders:
          getGrantedStorageFolders == _undefined ||
              getGrantedStorageFolders == null
          ? _instance.getGrantedStorageFolders
          : (getGrantedStorageFolders
                as Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<TRes>
  get getGrantedStorageFolders {
    final local$getGrantedStorageFolders = _instance.getGrantedStorageFolders;
    return CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
      local$getGrantedStorageFolders,
      (e) => call(getGrantedStorageFolders: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS<TRes>
    implements CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS(this._res);

  TRes _res;

  call({
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders?
    getGrantedStorageFolders,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<TRes>
  get getGrantedStorageFolders =>
      CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders.stub(
        _res,
      );
}

const documentNodeQueryGET_GRANTED_STORAGE_FOLDERS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_GRANTED_STORAGE_FOLDERS'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cursor')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'folder_id')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
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
            name: NameNode(value: 'getGrantedStorageFolders'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'cursor'),
                value: VariableNode(name: NameNode(value: 'cursor')),
              ),
              ArgumentNode(
                name: NameNode(value: 'folder_id'),
                value: VariableNode(name: NameNode(value: 'folder_id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'folders'),
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
                  name: NameNode(value: 'has_more'),
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

class Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders {
  Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders({
    required this.folders,
    required this.has_more,
    this.$__typename = 'FolderList',
  });

  factory Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$folders = json['folders'];
    final l$has_more = json['has_more'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
      folders: (l$folders as List<dynamic>)
          .map(
            (e) =>
                Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      has_more: (l$has_more as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders>
  folders;

  final bool has_more;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$folders = folders;
    _resultData['folders'] = l$folders.map((e) => e.toJson()).toList();
    final l$has_more = has_more;
    _resultData['has_more'] = l$has_more;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$folders = folders;
    final l$has_more = has_more;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$folders.map((v) => v)),
      l$has_more,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$folders = folders;
    final lOther$folders = other.folders;
    if (l$folders.length != lOther$folders.length) {
      return false;
    }
    for (int i = 0; i < l$folders.length; i++) {
      final l$folders$entry = l$folders[i];
      final lOther$folders$entry = lOther$folders[i];
      if (l$folders$entry != lOther$folders$entry) {
        return false;
      }
    }
    final l$has_more = has_more;
    final lOther$has_more = other.has_more;
    if (l$has_more != lOther$has_more) {
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

extension UtilityExtension$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders
    on Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders {
  CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<
  TRes
> {
  factory CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders instance,
    TRes Function(Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders)
    then,
  ) = _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders;

  factory CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders;

  TRes call({
    List<Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders>?
    folders,
    bool? has_more,
    String? $__typename,
  });
  TRes folders(
    Iterable<Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders>
    Function(
      Iterable<
        CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
          Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<
          TRes
        > {
  _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders _instance;

  final TRes Function(
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? folders = _undefined,
    Object? has_more = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
      folders: folders == _undefined || folders == null
          ? _instance.folders
          : (folders
                as List<
                  Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders
                >),
      has_more: has_more == _undefined || has_more == null
          ? _instance.has_more
          : (has_more as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes folders(
    Iterable<Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders>
    Function(
      Iterable<
        CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
          Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders
        >
      >,
    )
    _fn,
  ) => call(
    folders: _fn(
      _instance.folders.map(
        (e) =>
            CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders>?
    folders,
    bool? has_more,
    String? $__typename,
  }) => _res;

  folders(_fn) => _res;
}

class Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders {
  Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders({
    required this.id,
    required this.name,
    required this.folder_id,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Folder',
  });

  factory Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$folder_id = json['folder_id'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
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
    if (other
            is! Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders ||
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

extension UtilityExtension$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders
    on Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders {
  CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
  TRes
> {
  factory CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders instance,
    TRes Function(
      Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders,
    )
    then,
  ) = _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders;

  factory CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders;

  TRes call({
    String? id,
    String? name,
    String? folder_id,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
          TRes
        > {
  _CopyWithImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders
  _instance;

  final TRes Function(
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? folder_id = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
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

class _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
  TRes
>
    implements
        CopyWith$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_FOLDERS$getGrantedStorageFolders$folders(
    this._res,
  );

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
