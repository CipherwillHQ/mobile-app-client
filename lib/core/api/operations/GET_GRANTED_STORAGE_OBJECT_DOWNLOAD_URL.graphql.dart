import 'package:gql/ast.dart';

class Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL {
  factory Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL({
    required String access_id,
    required String ref_id,
  }) => Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL._({
    r'access_id': access_id,
    r'ref_id': ref_id,
  });

  Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL._(this._$data);

  factory Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    return Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL._(
      result$data,
    );
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  String get ref_id => (_$data['ref_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<
    Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
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
    final l$access_id = access_id;
    final l$ref_id = ref_id;
    return Object.hashAll([l$access_id, l$ref_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<
  TRes
> {
  factory CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
    Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL instance,
    TRes Function(Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL) then,
  ) = _CopyWithImpl$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL;

  factory CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL;

  TRes call({String? access_id, String? ref_id});
}

class _CopyWithImpl$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<
  TRes
>
    implements
        CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes> {
  _CopyWithImpl$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL _instance;

  final TRes Function(Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? access_id = _undefined, Object? ref_id = _undefined}) =>
      _then(
        Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL._({
          ..._instance._$data,
          if (access_id != _undefined && access_id != null)
            'access_id': (access_id as String),
          if (ref_id != _undefined && ref_id != null)
            'ref_id': (ref_id as String),
        }),
      );
}

class _CopyWithStubImpl$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<
  TRes
>
    implements
        CopyWith$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
    this._res,
  );

  TRes _res;

  call({String? access_id, String? ref_id}) => _res;
}

class Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL {
  Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL({
    required this.getGrantedStorageObjectDownloadUrl,
    this.$__typename = 'Query',
  });

  factory Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getGrantedStorageObjectDownloadUrl =
        json['getGrantedStorageObjectDownloadUrl'];
    final l$$__typename = json['__typename'];
    return Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
      getGrantedStorageObjectDownloadUrl:
          (l$getGrantedStorageObjectDownloadUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String getGrantedStorageObjectDownloadUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getGrantedStorageObjectDownloadUrl =
        getGrantedStorageObjectDownloadUrl;
    _resultData['getGrantedStorageObjectDownloadUrl'] =
        l$getGrantedStorageObjectDownloadUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getGrantedStorageObjectDownloadUrl =
        getGrantedStorageObjectDownloadUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getGrantedStorageObjectDownloadUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getGrantedStorageObjectDownloadUrl =
        getGrantedStorageObjectDownloadUrl;
    final lOther$getGrantedStorageObjectDownloadUrl =
        other.getGrantedStorageObjectDownloadUrl;
    if (l$getGrantedStorageObjectDownloadUrl !=
        lOther$getGrantedStorageObjectDownloadUrl) {
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

extension UtilityExtension$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL
    on Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL {
  CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<
    Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL
  >
  get copyWith =>
      CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(this, (i) => i);
}

abstract class CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes> {
  factory CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
    Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL instance,
    TRes Function(Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL) then,
  ) = _CopyWithImpl$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL;

  factory CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL;

  TRes call({String? getGrantedStorageObjectDownloadUrl, String? $__typename});
}

class _CopyWithImpl$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes>
    implements CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes> {
  _CopyWithImpl$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
    this._instance,
    this._then,
  );

  final Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL _instance;

  final TRes Function(Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getGrantedStorageObjectDownloadUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(
      getGrantedStorageObjectDownloadUrl:
          getGrantedStorageObjectDownloadUrl == _undefined ||
              getGrantedStorageObjectDownloadUrl == null
          ? _instance.getGrantedStorageObjectDownloadUrl
          : (getGrantedStorageObjectDownloadUrl as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes>
    implements CopyWith$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL<TRes> {
  _CopyWithStubImpl$Query$GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL(this._res);

  TRes _res;

  call({String? getGrantedStorageObjectDownloadUrl, String? $__typename}) =>
      _res;
}

const documentNodeQueryGET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
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
            name: NameNode(value: 'getGrantedStorageObjectDownloadUrl'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ref_id'),
                value: VariableNode(name: NameNode(value: 'ref_id')),
              ),
            ],
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
  ],
);
