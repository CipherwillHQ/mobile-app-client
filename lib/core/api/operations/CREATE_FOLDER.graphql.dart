import 'package:gql/ast.dart';

class Variables$Mutation$CREATE_FOLDER {
  factory Variables$Mutation$CREATE_FOLDER({
    required String name,
    String? folder_id,
  }) => Variables$Mutation$CREATE_FOLDER._({
    r'name': name,
    if (folder_id != null) r'folder_id': folder_id,
  });

  Variables$Mutation$CREATE_FOLDER._(this._$data);

  factory Variables$Mutation$CREATE_FOLDER.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('folder_id')) {
      final l$folder_id = data['folder_id'];
      result$data['folder_id'] = (l$folder_id as String?);
    }
    return Variables$Mutation$CREATE_FOLDER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get folder_id => (_$data['folder_id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('folder_id')) {
      final l$folder_id = folder_id;
      result$data['folder_id'] = l$folder_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CREATE_FOLDER<Variables$Mutation$CREATE_FOLDER>
  get copyWith => CopyWith$Variables$Mutation$CREATE_FOLDER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CREATE_FOLDER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$name = name;
    final l$folder_id = folder_id;
    return Object.hashAll([
      l$name,
      _$data.containsKey('folder_id') ? l$folder_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CREATE_FOLDER<TRes> {
  factory CopyWith$Variables$Mutation$CREATE_FOLDER(
    Variables$Mutation$CREATE_FOLDER instance,
    TRes Function(Variables$Mutation$CREATE_FOLDER) then,
  ) = _CopyWithImpl$Variables$Mutation$CREATE_FOLDER;

  factory CopyWith$Variables$Mutation$CREATE_FOLDER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CREATE_FOLDER;

  TRes call({String? name, String? folder_id});
}

class _CopyWithImpl$Variables$Mutation$CREATE_FOLDER<TRes>
    implements CopyWith$Variables$Mutation$CREATE_FOLDER<TRes> {
  _CopyWithImpl$Variables$Mutation$CREATE_FOLDER(this._instance, this._then);

  final Variables$Mutation$CREATE_FOLDER _instance;

  final TRes Function(Variables$Mutation$CREATE_FOLDER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined, Object? folder_id = _undefined}) =>
      _then(
        Variables$Mutation$CREATE_FOLDER._({
          ..._instance._$data,
          if (name != _undefined && name != null) 'name': (name as String),
          if (folder_id != _undefined) 'folder_id': (folder_id as String?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$CREATE_FOLDER<TRes>
    implements CopyWith$Variables$Mutation$CREATE_FOLDER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CREATE_FOLDER(this._res);

  TRes _res;

  call({String? name, String? folder_id}) => _res;
}

class Mutation$CREATE_FOLDER {
  Mutation$CREATE_FOLDER({
    required this.createFolder,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CREATE_FOLDER.fromJson(Map<String, dynamic> json) {
    final l$createFolder = json['createFolder'];
    final l$$__typename = json['__typename'];
    return Mutation$CREATE_FOLDER(
      createFolder: Mutation$CREATE_FOLDER$createFolder.fromJson(
        (l$createFolder as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CREATE_FOLDER$createFolder createFolder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFolder = createFolder;
    _resultData['createFolder'] = l$createFolder.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFolder = createFolder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createFolder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CREATE_FOLDER || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFolder = createFolder;
    final lOther$createFolder = other.createFolder;
    if (l$createFolder != lOther$createFolder) {
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

extension UtilityExtension$Mutation$CREATE_FOLDER on Mutation$CREATE_FOLDER {
  CopyWith$Mutation$CREATE_FOLDER<Mutation$CREATE_FOLDER> get copyWith =>
      CopyWith$Mutation$CREATE_FOLDER(this, (i) => i);
}

abstract class CopyWith$Mutation$CREATE_FOLDER<TRes> {
  factory CopyWith$Mutation$CREATE_FOLDER(
    Mutation$CREATE_FOLDER instance,
    TRes Function(Mutation$CREATE_FOLDER) then,
  ) = _CopyWithImpl$Mutation$CREATE_FOLDER;

  factory CopyWith$Mutation$CREATE_FOLDER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CREATE_FOLDER;

  TRes call({
    Mutation$CREATE_FOLDER$createFolder? createFolder,
    String? $__typename,
  });
  CopyWith$Mutation$CREATE_FOLDER$createFolder<TRes> get createFolder;
}

class _CopyWithImpl$Mutation$CREATE_FOLDER<TRes>
    implements CopyWith$Mutation$CREATE_FOLDER<TRes> {
  _CopyWithImpl$Mutation$CREATE_FOLDER(this._instance, this._then);

  final Mutation$CREATE_FOLDER _instance;

  final TRes Function(Mutation$CREATE_FOLDER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFolder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CREATE_FOLDER(
      createFolder: createFolder == _undefined || createFolder == null
          ? _instance.createFolder
          : (createFolder as Mutation$CREATE_FOLDER$createFolder),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CREATE_FOLDER$createFolder<TRes> get createFolder {
    final local$createFolder = _instance.createFolder;
    return CopyWith$Mutation$CREATE_FOLDER$createFolder(
      local$createFolder,
      (e) => call(createFolder: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CREATE_FOLDER<TRes>
    implements CopyWith$Mutation$CREATE_FOLDER<TRes> {
  _CopyWithStubImpl$Mutation$CREATE_FOLDER(this._res);

  TRes _res;

  call({
    Mutation$CREATE_FOLDER$createFolder? createFolder,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CREATE_FOLDER$createFolder<TRes> get createFolder =>
      CopyWith$Mutation$CREATE_FOLDER$createFolder.stub(_res);
}

const documentNodeMutationCREATE_FOLDER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CREATE_FOLDER'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'name')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
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
            name: NameNode(value: 'createFolder'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'name'),
                value: VariableNode(name: NameNode(value: 'name')),
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
                  name: NameNode(value: 'id'),
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

class Mutation$CREATE_FOLDER$createFolder {
  Mutation$CREATE_FOLDER$createFolder({
    required this.id,
    this.$__typename = 'Folder',
  });

  factory Mutation$CREATE_FOLDER$createFolder.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$CREATE_FOLDER$createFolder(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CREATE_FOLDER$createFolder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$CREATE_FOLDER$createFolder
    on Mutation$CREATE_FOLDER$createFolder {
  CopyWith$Mutation$CREATE_FOLDER$createFolder<
    Mutation$CREATE_FOLDER$createFolder
  >
  get copyWith => CopyWith$Mutation$CREATE_FOLDER$createFolder(this, (i) => i);
}

abstract class CopyWith$Mutation$CREATE_FOLDER$createFolder<TRes> {
  factory CopyWith$Mutation$CREATE_FOLDER$createFolder(
    Mutation$CREATE_FOLDER$createFolder instance,
    TRes Function(Mutation$CREATE_FOLDER$createFolder) then,
  ) = _CopyWithImpl$Mutation$CREATE_FOLDER$createFolder;

  factory CopyWith$Mutation$CREATE_FOLDER$createFolder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CREATE_FOLDER$createFolder;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$CREATE_FOLDER$createFolder<TRes>
    implements CopyWith$Mutation$CREATE_FOLDER$createFolder<TRes> {
  _CopyWithImpl$Mutation$CREATE_FOLDER$createFolder(this._instance, this._then);

  final Mutation$CREATE_FOLDER$createFolder _instance;

  final TRes Function(Mutation$CREATE_FOLDER$createFolder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CREATE_FOLDER$createFolder(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$CREATE_FOLDER$createFolder<TRes>
    implements CopyWith$Mutation$CREATE_FOLDER$createFolder<TRes> {
  _CopyWithStubImpl$Mutation$CREATE_FOLDER$createFolder(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
