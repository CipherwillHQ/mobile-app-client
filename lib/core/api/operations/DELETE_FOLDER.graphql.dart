import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_FOLDER {
  factory Variables$Mutation$DELETE_FOLDER({required String id}) =>
      Variables$Mutation$DELETE_FOLDER._({r'id': id});

  Variables$Mutation$DELETE_FOLDER._(this._$data);

  factory Variables$Mutation$DELETE_FOLDER.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DELETE_FOLDER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_FOLDER<Variables$Mutation$DELETE_FOLDER>
  get copyWith => CopyWith$Variables$Mutation$DELETE_FOLDER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_FOLDER ||
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

abstract class CopyWith$Variables$Mutation$DELETE_FOLDER<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_FOLDER(
    Variables$Mutation$DELETE_FOLDER instance,
    TRes Function(Variables$Mutation$DELETE_FOLDER) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_FOLDER;

  factory CopyWith$Variables$Mutation$DELETE_FOLDER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DELETE_FOLDER;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_FOLDER<TRes>
    implements CopyWith$Variables$Mutation$DELETE_FOLDER<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_FOLDER(this._instance, this._then);

  final Variables$Mutation$DELETE_FOLDER _instance;

  final TRes Function(Variables$Mutation$DELETE_FOLDER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DELETE_FOLDER._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_FOLDER<TRes>
    implements CopyWith$Variables$Mutation$DELETE_FOLDER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_FOLDER(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DELETE_FOLDER {
  Mutation$DELETE_FOLDER({
    required this.deleteFolder,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_FOLDER.fromJson(Map<String, dynamic> json) {
    final l$deleteFolder = json['deleteFolder'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_FOLDER(
      deleteFolder: Mutation$DELETE_FOLDER$deleteFolder.fromJson(
        (l$deleteFolder as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DELETE_FOLDER$deleteFolder deleteFolder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFolder = deleteFolder;
    _resultData['deleteFolder'] = l$deleteFolder.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFolder = deleteFolder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteFolder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_FOLDER || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFolder = deleteFolder;
    final lOther$deleteFolder = other.deleteFolder;
    if (l$deleteFolder != lOther$deleteFolder) {
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

extension UtilityExtension$Mutation$DELETE_FOLDER on Mutation$DELETE_FOLDER {
  CopyWith$Mutation$DELETE_FOLDER<Mutation$DELETE_FOLDER> get copyWith =>
      CopyWith$Mutation$DELETE_FOLDER(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_FOLDER<TRes> {
  factory CopyWith$Mutation$DELETE_FOLDER(
    Mutation$DELETE_FOLDER instance,
    TRes Function(Mutation$DELETE_FOLDER) then,
  ) = _CopyWithImpl$Mutation$DELETE_FOLDER;

  factory CopyWith$Mutation$DELETE_FOLDER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_FOLDER;

  TRes call({
    Mutation$DELETE_FOLDER$deleteFolder? deleteFolder,
    String? $__typename,
  });
  CopyWith$Mutation$DELETE_FOLDER$deleteFolder<TRes> get deleteFolder;
}

class _CopyWithImpl$Mutation$DELETE_FOLDER<TRes>
    implements CopyWith$Mutation$DELETE_FOLDER<TRes> {
  _CopyWithImpl$Mutation$DELETE_FOLDER(this._instance, this._then);

  final Mutation$DELETE_FOLDER _instance;

  final TRes Function(Mutation$DELETE_FOLDER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteFolder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_FOLDER(
      deleteFolder: deleteFolder == _undefined || deleteFolder == null
          ? _instance.deleteFolder
          : (deleteFolder as Mutation$DELETE_FOLDER$deleteFolder),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DELETE_FOLDER$deleteFolder<TRes> get deleteFolder {
    final local$deleteFolder = _instance.deleteFolder;
    return CopyWith$Mutation$DELETE_FOLDER$deleteFolder(
      local$deleteFolder,
      (e) => call(deleteFolder: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$DELETE_FOLDER<TRes>
    implements CopyWith$Mutation$DELETE_FOLDER<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_FOLDER(this._res);

  TRes _res;

  call({
    Mutation$DELETE_FOLDER$deleteFolder? deleteFolder,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DELETE_FOLDER$deleteFolder<TRes> get deleteFolder =>
      CopyWith$Mutation$DELETE_FOLDER$deleteFolder.stub(_res);
}

const documentNodeMutationDELETE_FOLDER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_FOLDER'),
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
            name: NameNode(value: 'deleteFolder'),
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
                  name: NameNode(value: 'folder_id'),
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

class Mutation$DELETE_FOLDER$deleteFolder {
  Mutation$DELETE_FOLDER$deleteFolder({
    required this.id,
    required this.folder_id,
    this.$__typename = 'Folder',
  });

  factory Mutation$DELETE_FOLDER$deleteFolder.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$folder_id = json['folder_id'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_FOLDER$deleteFolder(
      id: (l$id as String),
      folder_id: (l$folder_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String folder_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$folder_id = folder_id;
    _resultData['folder_id'] = l$folder_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$folder_id = folder_id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$folder_id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_FOLDER$deleteFolder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$folder_id = folder_id;
    final lOther$folder_id = other.folder_id;
    if (l$folder_id != lOther$folder_id) {
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

extension UtilityExtension$Mutation$DELETE_FOLDER$deleteFolder
    on Mutation$DELETE_FOLDER$deleteFolder {
  CopyWith$Mutation$DELETE_FOLDER$deleteFolder<
    Mutation$DELETE_FOLDER$deleteFolder
  >
  get copyWith => CopyWith$Mutation$DELETE_FOLDER$deleteFolder(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_FOLDER$deleteFolder<TRes> {
  factory CopyWith$Mutation$DELETE_FOLDER$deleteFolder(
    Mutation$DELETE_FOLDER$deleteFolder instance,
    TRes Function(Mutation$DELETE_FOLDER$deleteFolder) then,
  ) = _CopyWithImpl$Mutation$DELETE_FOLDER$deleteFolder;

  factory CopyWith$Mutation$DELETE_FOLDER$deleteFolder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_FOLDER$deleteFolder;

  TRes call({String? id, String? folder_id, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_FOLDER$deleteFolder<TRes>
    implements CopyWith$Mutation$DELETE_FOLDER$deleteFolder<TRes> {
  _CopyWithImpl$Mutation$DELETE_FOLDER$deleteFolder(this._instance, this._then);

  final Mutation$DELETE_FOLDER$deleteFolder _instance;

  final TRes Function(Mutation$DELETE_FOLDER$deleteFolder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? folder_id = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_FOLDER$deleteFolder(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      folder_id: folder_id == _undefined || folder_id == null
          ? _instance.folder_id
          : (folder_id as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_FOLDER$deleteFolder<TRes>
    implements CopyWith$Mutation$DELETE_FOLDER$deleteFolder<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_FOLDER$deleteFolder(this._res);

  TRes _res;

  call({String? id, String? folder_id, String? $__typename}) => _res;
}
