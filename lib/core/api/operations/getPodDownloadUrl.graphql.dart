import 'package:gql/ast.dart';

class Variables$Query$getPodDownloadUrl {
  factory Variables$Query$getPodDownloadUrl({required String ref_id}) =>
      Variables$Query$getPodDownloadUrl._({r'ref_id': ref_id});

  Variables$Query$getPodDownloadUrl._(this._$data);

  factory Variables$Query$getPodDownloadUrl.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    return Variables$Query$getPodDownloadUrl._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ref_id => (_$data['ref_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    return result$data;
  }

  CopyWith$Variables$Query$getPodDownloadUrl<Variables$Query$getPodDownloadUrl>
  get copyWith => CopyWith$Variables$Query$getPodDownloadUrl(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$getPodDownloadUrl ||
        runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$getPodDownloadUrl<TRes> {
  factory CopyWith$Variables$Query$getPodDownloadUrl(
    Variables$Query$getPodDownloadUrl instance,
    TRes Function(Variables$Query$getPodDownloadUrl) then,
  ) = _CopyWithImpl$Variables$Query$getPodDownloadUrl;

  factory CopyWith$Variables$Query$getPodDownloadUrl.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getPodDownloadUrl;

  TRes call({String? ref_id});
}

class _CopyWithImpl$Variables$Query$getPodDownloadUrl<TRes>
    implements CopyWith$Variables$Query$getPodDownloadUrl<TRes> {
  _CopyWithImpl$Variables$Query$getPodDownloadUrl(this._instance, this._then);

  final Variables$Query$getPodDownloadUrl _instance;

  final TRes Function(Variables$Query$getPodDownloadUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? ref_id = _undefined}) => _then(
    Variables$Query$getPodDownloadUrl._({
      ..._instance._$data,
      if (ref_id != _undefined && ref_id != null) 'ref_id': (ref_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$getPodDownloadUrl<TRes>
    implements CopyWith$Variables$Query$getPodDownloadUrl<TRes> {
  _CopyWithStubImpl$Variables$Query$getPodDownloadUrl(this._res);

  TRes _res;

  call({String? ref_id}) => _res;
}

class Query$getPodDownloadUrl {
  Query$getPodDownloadUrl({
    required this.getPodDownloadUrl,
    this.$__typename = 'Query',
  });

  factory Query$getPodDownloadUrl.fromJson(Map<String, dynamic> json) {
    final l$getPodDownloadUrl = json['getPodDownloadUrl'];
    final l$$__typename = json['__typename'];
    return Query$getPodDownloadUrl(
      getPodDownloadUrl: (l$getPodDownloadUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String getPodDownloadUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getPodDownloadUrl = getPodDownloadUrl;
    _resultData['getPodDownloadUrl'] = l$getPodDownloadUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getPodDownloadUrl = getPodDownloadUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getPodDownloadUrl, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$getPodDownloadUrl || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getPodDownloadUrl = getPodDownloadUrl;
    final lOther$getPodDownloadUrl = other.getPodDownloadUrl;
    if (l$getPodDownloadUrl != lOther$getPodDownloadUrl) {
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

extension UtilityExtension$Query$getPodDownloadUrl on Query$getPodDownloadUrl {
  CopyWith$Query$getPodDownloadUrl<Query$getPodDownloadUrl> get copyWith =>
      CopyWith$Query$getPodDownloadUrl(this, (i) => i);
}

abstract class CopyWith$Query$getPodDownloadUrl<TRes> {
  factory CopyWith$Query$getPodDownloadUrl(
    Query$getPodDownloadUrl instance,
    TRes Function(Query$getPodDownloadUrl) then,
  ) = _CopyWithImpl$Query$getPodDownloadUrl;

  factory CopyWith$Query$getPodDownloadUrl.stub(TRes res) =
      _CopyWithStubImpl$Query$getPodDownloadUrl;

  TRes call({String? getPodDownloadUrl, String? $__typename});
}

class _CopyWithImpl$Query$getPodDownloadUrl<TRes>
    implements CopyWith$Query$getPodDownloadUrl<TRes> {
  _CopyWithImpl$Query$getPodDownloadUrl(this._instance, this._then);

  final Query$getPodDownloadUrl _instance;

  final TRes Function(Query$getPodDownloadUrl) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getPodDownloadUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$getPodDownloadUrl(
      getPodDownloadUrl:
          getPodDownloadUrl == _undefined || getPodDownloadUrl == null
          ? _instance.getPodDownloadUrl
          : (getPodDownloadUrl as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$getPodDownloadUrl<TRes>
    implements CopyWith$Query$getPodDownloadUrl<TRes> {
  _CopyWithStubImpl$Query$getPodDownloadUrl(this._res);

  TRes _res;

  call({String? getPodDownloadUrl, String? $__typename}) => _res;
}

const documentNodeQuerygetPodDownloadUrl = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getPodDownloadUrl'),
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
            name: NameNode(value: 'getPodDownloadUrl'),
            alias: null,
            arguments: [
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
