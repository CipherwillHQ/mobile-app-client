import 'package:gql/ast.dart';

class Variables$Query$GET_POD {
  factory Variables$Query$GET_POD({required String ref_id}) =>
      Variables$Query$GET_POD._({r'ref_id': ref_id});

  Variables$Query$GET_POD._(this._$data);

  factory Variables$Query$GET_POD.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    return Variables$Query$GET_POD._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ref_id => (_$data['ref_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_POD<Variables$Query$GET_POD> get copyWith =>
      CopyWith$Variables$Query$GET_POD(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_POD || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$GET_POD<TRes> {
  factory CopyWith$Variables$Query$GET_POD(
    Variables$Query$GET_POD instance,
    TRes Function(Variables$Query$GET_POD) then,
  ) = _CopyWithImpl$Variables$Query$GET_POD;

  factory CopyWith$Variables$Query$GET_POD.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_POD;

  TRes call({String? ref_id});
}

class _CopyWithImpl$Variables$Query$GET_POD<TRes>
    implements CopyWith$Variables$Query$GET_POD<TRes> {
  _CopyWithImpl$Variables$Query$GET_POD(this._instance, this._then);

  final Variables$Query$GET_POD _instance;

  final TRes Function(Variables$Query$GET_POD) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? ref_id = _undefined}) => _then(
    Variables$Query$GET_POD._({
      ..._instance._$data,
      if (ref_id != _undefined && ref_id != null) 'ref_id': (ref_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_POD<TRes>
    implements CopyWith$Variables$Query$GET_POD<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_POD(this._res);

  TRes _res;

  call({String? ref_id}) => _res;
}

class Query$GET_POD {
  Query$GET_POD({required this.getPod, this.$__typename = 'Query'});

  factory Query$GET_POD.fromJson(Map<String, dynamic> json) {
    final l$getPod = json['getPod'];
    final l$$__typename = json['__typename'];
    return Query$GET_POD(
      getPod: Query$GET_POD$getPod.fromJson((l$getPod as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_POD$getPod getPod;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getPod = getPod;
    _resultData['getPod'] = l$getPod.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getPod = getPod;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getPod, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_POD || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getPod = getPod;
    final lOther$getPod = other.getPod;
    if (l$getPod != lOther$getPod) {
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

extension UtilityExtension$Query$GET_POD on Query$GET_POD {
  CopyWith$Query$GET_POD<Query$GET_POD> get copyWith =>
      CopyWith$Query$GET_POD(this, (i) => i);
}

abstract class CopyWith$Query$GET_POD<TRes> {
  factory CopyWith$Query$GET_POD(
    Query$GET_POD instance,
    TRes Function(Query$GET_POD) then,
  ) = _CopyWithImpl$Query$GET_POD;

  factory CopyWith$Query$GET_POD.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_POD;

  TRes call({Query$GET_POD$getPod? getPod, String? $__typename});
  CopyWith$Query$GET_POD$getPod<TRes> get getPod;
}

class _CopyWithImpl$Query$GET_POD<TRes>
    implements CopyWith$Query$GET_POD<TRes> {
  _CopyWithImpl$Query$GET_POD(this._instance, this._then);

  final Query$GET_POD _instance;

  final TRes Function(Query$GET_POD) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? getPod = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GET_POD(
          getPod: getPod == _undefined || getPod == null
              ? _instance.getPod
              : (getPod as Query$GET_POD$getPod),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GET_POD$getPod<TRes> get getPod {
    final local$getPod = _instance.getPod;
    return CopyWith$Query$GET_POD$getPod(local$getPod, (e) => call(getPod: e));
  }
}

class _CopyWithStubImpl$Query$GET_POD<TRes>
    implements CopyWith$Query$GET_POD<TRes> {
  _CopyWithStubImpl$Query$GET_POD(this._res);

  TRes _res;

  call({Query$GET_POD$getPod? getPod, String? $__typename}) => _res;

  CopyWith$Query$GET_POD$getPod<TRes> get getPod =>
      CopyWith$Query$GET_POD$getPod.stub(_res);
}

const documentNodeQueryGET_POD = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_POD'),
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
            name: NameNode(value: 'getPod'),
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
                  name: NameNode(value: 'ref_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mime_type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'encoding'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'size'),
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

class Query$GET_POD$getPod {
  Query$GET_POD$getPod({
    required this.id,
    required this.ref_id,
    required this.mime_type,
    required this.encoding,
    required this.content,
    required this.size,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Pod',
  });

  factory Query$GET_POD$getPod.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$ref_id = json['ref_id'];
    final l$mime_type = json['mime_type'];
    final l$encoding = json['encoding'];
    final l$content = json['content'];
    final l$size = json['size'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_POD$getPod(
      id: (l$id as String),
      ref_id: (l$ref_id as String),
      mime_type: (l$mime_type as String),
      encoding: (l$encoding as String),
      content: (l$content as String),
      size: (l$size as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String ref_id;

  final String mime_type;

  final String encoding;

  final String content;

  final String size;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$ref_id = ref_id;
    _resultData['ref_id'] = l$ref_id;
    final l$mime_type = mime_type;
    _resultData['mime_type'] = l$mime_type;
    final l$encoding = encoding;
    _resultData['encoding'] = l$encoding;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$size = size;
    _resultData['size'] = l$size;
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
    final l$ref_id = ref_id;
    final l$mime_type = mime_type;
    final l$encoding = encoding;
    final l$content = content;
    final l$size = size;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$ref_id,
      l$mime_type,
      l$encoding,
      l$content,
      l$size,
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
    if (other is! Query$GET_POD$getPod || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    final l$mime_type = mime_type;
    final lOther$mime_type = other.mime_type;
    if (l$mime_type != lOther$mime_type) {
      return false;
    }
    final l$encoding = encoding;
    final lOther$encoding = other.encoding;
    if (l$encoding != lOther$encoding) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$size = size;
    final lOther$size = other.size;
    if (l$size != lOther$size) {
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

extension UtilityExtension$Query$GET_POD$getPod on Query$GET_POD$getPod {
  CopyWith$Query$GET_POD$getPod<Query$GET_POD$getPod> get copyWith =>
      CopyWith$Query$GET_POD$getPod(this, (i) => i);
}

abstract class CopyWith$Query$GET_POD$getPod<TRes> {
  factory CopyWith$Query$GET_POD$getPod(
    Query$GET_POD$getPod instance,
    TRes Function(Query$GET_POD$getPod) then,
  ) = _CopyWithImpl$Query$GET_POD$getPod;

  factory CopyWith$Query$GET_POD$getPod.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_POD$getPod;

  TRes call({
    String? id,
    String? ref_id,
    String? mime_type,
    String? encoding,
    String? content,
    String? size,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_POD$getPod<TRes>
    implements CopyWith$Query$GET_POD$getPod<TRes> {
  _CopyWithImpl$Query$GET_POD$getPod(this._instance, this._then);

  final Query$GET_POD$getPod _instance;

  final TRes Function(Query$GET_POD$getPod) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? ref_id = _undefined,
    Object? mime_type = _undefined,
    Object? encoding = _undefined,
    Object? content = _undefined,
    Object? size = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_POD$getPod(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      ref_id: ref_id == _undefined || ref_id == null
          ? _instance.ref_id
          : (ref_id as String),
      mime_type: mime_type == _undefined || mime_type == null
          ? _instance.mime_type
          : (mime_type as String),
      encoding: encoding == _undefined || encoding == null
          ? _instance.encoding
          : (encoding as String),
      content: content == _undefined || content == null
          ? _instance.content
          : (content as String),
      size: size == _undefined || size == null
          ? _instance.size
          : (size as String),
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

class _CopyWithStubImpl$Query$GET_POD$getPod<TRes>
    implements CopyWith$Query$GET_POD$getPod<TRes> {
  _CopyWithStubImpl$Query$GET_POD$getPod(this._res);

  TRes _res;

  call({
    String? id,
    String? ref_id,
    String? mime_type,
    String? encoding,
    String? content,
    String? size,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
