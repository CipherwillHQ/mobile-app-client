import 'package:gql/ast.dart';

class Query$GET_STORAGE_USED {
  Query$GET_STORAGE_USED({
    required this.getStorageUsed,
    this.$__typename = 'Query',
  });

  factory Query$GET_STORAGE_USED.fromJson(Map<String, dynamic> json) {
    final l$getStorageUsed = json['getStorageUsed'];
    final l$$__typename = json['__typename'];
    return Query$GET_STORAGE_USED(
      getStorageUsed: Query$GET_STORAGE_USED$getStorageUsed.fromJson(
        (l$getStorageUsed as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_STORAGE_USED$getStorageUsed getStorageUsed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getStorageUsed = getStorageUsed;
    _resultData['getStorageUsed'] = l$getStorageUsed.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getStorageUsed = getStorageUsed;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getStorageUsed, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_STORAGE_USED || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getStorageUsed = getStorageUsed;
    final lOther$getStorageUsed = other.getStorageUsed;
    if (l$getStorageUsed != lOther$getStorageUsed) {
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

extension UtilityExtension$Query$GET_STORAGE_USED on Query$GET_STORAGE_USED {
  CopyWith$Query$GET_STORAGE_USED<Query$GET_STORAGE_USED> get copyWith =>
      CopyWith$Query$GET_STORAGE_USED(this, (i) => i);
}

abstract class CopyWith$Query$GET_STORAGE_USED<TRes> {
  factory CopyWith$Query$GET_STORAGE_USED(
    Query$GET_STORAGE_USED instance,
    TRes Function(Query$GET_STORAGE_USED) then,
  ) = _CopyWithImpl$Query$GET_STORAGE_USED;

  factory CopyWith$Query$GET_STORAGE_USED.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_STORAGE_USED;

  TRes call({
    Query$GET_STORAGE_USED$getStorageUsed? getStorageUsed,
    String? $__typename,
  });
  CopyWith$Query$GET_STORAGE_USED$getStorageUsed<TRes> get getStorageUsed;
}

class _CopyWithImpl$Query$GET_STORAGE_USED<TRes>
    implements CopyWith$Query$GET_STORAGE_USED<TRes> {
  _CopyWithImpl$Query$GET_STORAGE_USED(this._instance, this._then);

  final Query$GET_STORAGE_USED _instance;

  final TRes Function(Query$GET_STORAGE_USED) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getStorageUsed = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_STORAGE_USED(
      getStorageUsed: getStorageUsed == _undefined || getStorageUsed == null
          ? _instance.getStorageUsed
          : (getStorageUsed as Query$GET_STORAGE_USED$getStorageUsed),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_STORAGE_USED$getStorageUsed<TRes> get getStorageUsed {
    final local$getStorageUsed = _instance.getStorageUsed;
    return CopyWith$Query$GET_STORAGE_USED$getStorageUsed(
      local$getStorageUsed,
      (e) => call(getStorageUsed: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_STORAGE_USED<TRes>
    implements CopyWith$Query$GET_STORAGE_USED<TRes> {
  _CopyWithStubImpl$Query$GET_STORAGE_USED(this._res);

  TRes _res;

  call({
    Query$GET_STORAGE_USED$getStorageUsed? getStorageUsed,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_STORAGE_USED$getStorageUsed<TRes> get getStorageUsed =>
      CopyWith$Query$GET_STORAGE_USED$getStorageUsed.stub(_res);
}

const documentNodeQueryGET_STORAGE_USED = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_STORAGE_USED'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getStorageUsed'),
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
                  name: NameNode(value: 'text_pods'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'storage_pods'),
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

class Query$GET_STORAGE_USED$getStorageUsed {
  Query$GET_STORAGE_USED$getStorageUsed({
    required this.id,
    required this.text_pods,
    required this.storage_pods,
    this.$__typename = 'StorageUsed',
  });

  factory Query$GET_STORAGE_USED$getStorageUsed.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$text_pods = json['text_pods'];
    final l$storage_pods = json['storage_pods'];
    final l$$__typename = json['__typename'];
    return Query$GET_STORAGE_USED$getStorageUsed(
      id: (l$id as String),
      text_pods: (l$text_pods as String),
      storage_pods: (l$storage_pods as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String text_pods;

  final String storage_pods;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$text_pods = text_pods;
    _resultData['text_pods'] = l$text_pods;
    final l$storage_pods = storage_pods;
    _resultData['storage_pods'] = l$storage_pods;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$text_pods = text_pods;
    final l$storage_pods = storage_pods;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$text_pods, l$storage_pods, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_STORAGE_USED$getStorageUsed ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$text_pods = text_pods;
    final lOther$text_pods = other.text_pods;
    if (l$text_pods != lOther$text_pods) {
      return false;
    }
    final l$storage_pods = storage_pods;
    final lOther$storage_pods = other.storage_pods;
    if (l$storage_pods != lOther$storage_pods) {
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

extension UtilityExtension$Query$GET_STORAGE_USED$getStorageUsed
    on Query$GET_STORAGE_USED$getStorageUsed {
  CopyWith$Query$GET_STORAGE_USED$getStorageUsed<
    Query$GET_STORAGE_USED$getStorageUsed
  >
  get copyWith =>
      CopyWith$Query$GET_STORAGE_USED$getStorageUsed(this, (i) => i);
}

abstract class CopyWith$Query$GET_STORAGE_USED$getStorageUsed<TRes> {
  factory CopyWith$Query$GET_STORAGE_USED$getStorageUsed(
    Query$GET_STORAGE_USED$getStorageUsed instance,
    TRes Function(Query$GET_STORAGE_USED$getStorageUsed) then,
  ) = _CopyWithImpl$Query$GET_STORAGE_USED$getStorageUsed;

  factory CopyWith$Query$GET_STORAGE_USED$getStorageUsed.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_STORAGE_USED$getStorageUsed;

  TRes call({
    String? id,
    String? text_pods,
    String? storage_pods,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_STORAGE_USED$getStorageUsed<TRes>
    implements CopyWith$Query$GET_STORAGE_USED$getStorageUsed<TRes> {
  _CopyWithImpl$Query$GET_STORAGE_USED$getStorageUsed(
    this._instance,
    this._then,
  );

  final Query$GET_STORAGE_USED$getStorageUsed _instance;

  final TRes Function(Query$GET_STORAGE_USED$getStorageUsed) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? text_pods = _undefined,
    Object? storage_pods = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_STORAGE_USED$getStorageUsed(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      text_pods: text_pods == _undefined || text_pods == null
          ? _instance.text_pods
          : (text_pods as String),
      storage_pods: storage_pods == _undefined || storage_pods == null
          ? _instance.storage_pods
          : (storage_pods as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_STORAGE_USED$getStorageUsed<TRes>
    implements CopyWith$Query$GET_STORAGE_USED$getStorageUsed<TRes> {
  _CopyWithStubImpl$Query$GET_STORAGE_USED$getStorageUsed(this._res);

  TRes _res;

  call({
    String? id,
    String? text_pods,
    String? storage_pods,
    String? $__typename,
  }) => _res;
}
