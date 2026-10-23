import 'package:gql/ast.dart';

class Variables$Query$GET_PADDLE_PORTAL_SESSION_URL {
  factory Variables$Query$GET_PADDLE_PORTAL_SESSION_URL({
    required String subscription_id,
  }) => Variables$Query$GET_PADDLE_PORTAL_SESSION_URL._({
    r'subscription_id': subscription_id,
  });

  Variables$Query$GET_PADDLE_PORTAL_SESSION_URL._(this._$data);

  factory Variables$Query$GET_PADDLE_PORTAL_SESSION_URL.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$subscription_id = data['subscription_id'];
    result$data['subscription_id'] = (l$subscription_id as String);
    return Variables$Query$GET_PADDLE_PORTAL_SESSION_URL._(result$data);
  }

  Map<String, dynamic> _$data;

  String get subscription_id => (_$data['subscription_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$subscription_id = subscription_id;
    result$data['subscription_id'] = l$subscription_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL<
    Variables$Query$GET_PADDLE_PORTAL_SESSION_URL
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_PADDLE_PORTAL_SESSION_URL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$subscription_id = subscription_id;
    final lOther$subscription_id = other.subscription_id;
    if (l$subscription_id != lOther$subscription_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$subscription_id = subscription_id;
    return Object.hashAll([l$subscription_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes> {
  factory CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL(
    Variables$Query$GET_PADDLE_PORTAL_SESSION_URL instance,
    TRes Function(Variables$Query$GET_PADDLE_PORTAL_SESSION_URL) then,
  ) = _CopyWithImpl$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL;

  factory CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL;

  TRes call({String? subscription_id});
}

class _CopyWithImpl$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes>
    implements CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes> {
  _CopyWithImpl$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_PADDLE_PORTAL_SESSION_URL _instance;

  final TRes Function(Variables$Query$GET_PADDLE_PORTAL_SESSION_URL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? subscription_id = _undefined}) => _then(
    Variables$Query$GET_PADDLE_PORTAL_SESSION_URL._({
      ..._instance._$data,
      if (subscription_id != _undefined && subscription_id != null)
        'subscription_id': (subscription_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes>
    implements CopyWith$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_PADDLE_PORTAL_SESSION_URL(this._res);

  TRes _res;

  call({String? subscription_id}) => _res;
}

class Query$GET_PADDLE_PORTAL_SESSION_URL {
  Query$GET_PADDLE_PORTAL_SESSION_URL({
    required this.getPaddlePortalSessionUrl,
    this.$__typename = 'Query',
  });

  factory Query$GET_PADDLE_PORTAL_SESSION_URL.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getPaddlePortalSessionUrl = json['getPaddlePortalSessionUrl'];
    final l$$__typename = json['__typename'];
    return Query$GET_PADDLE_PORTAL_SESSION_URL(
      getPaddlePortalSessionUrl: (l$getPaddlePortalSessionUrl as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String getPaddlePortalSessionUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getPaddlePortalSessionUrl = getPaddlePortalSessionUrl;
    _resultData['getPaddlePortalSessionUrl'] = l$getPaddlePortalSessionUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getPaddlePortalSessionUrl = getPaddlePortalSessionUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getPaddlePortalSessionUrl, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PADDLE_PORTAL_SESSION_URL ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getPaddlePortalSessionUrl = getPaddlePortalSessionUrl;
    final lOther$getPaddlePortalSessionUrl = other.getPaddlePortalSessionUrl;
    if (l$getPaddlePortalSessionUrl != lOther$getPaddlePortalSessionUrl) {
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

extension UtilityExtension$Query$GET_PADDLE_PORTAL_SESSION_URL
    on Query$GET_PADDLE_PORTAL_SESSION_URL {
  CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL<
    Query$GET_PADDLE_PORTAL_SESSION_URL
  >
  get copyWith => CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL(this, (i) => i);
}

abstract class CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes> {
  factory CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL(
    Query$GET_PADDLE_PORTAL_SESSION_URL instance,
    TRes Function(Query$GET_PADDLE_PORTAL_SESSION_URL) then,
  ) = _CopyWithImpl$Query$GET_PADDLE_PORTAL_SESSION_URL;

  factory CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PADDLE_PORTAL_SESSION_URL;

  TRes call({String? getPaddlePortalSessionUrl, String? $__typename});
}

class _CopyWithImpl$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes>
    implements CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes> {
  _CopyWithImpl$Query$GET_PADDLE_PORTAL_SESSION_URL(this._instance, this._then);

  final Query$GET_PADDLE_PORTAL_SESSION_URL _instance;

  final TRes Function(Query$GET_PADDLE_PORTAL_SESSION_URL) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getPaddlePortalSessionUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PADDLE_PORTAL_SESSION_URL(
      getPaddlePortalSessionUrl:
          getPaddlePortalSessionUrl == _undefined ||
              getPaddlePortalSessionUrl == null
          ? _instance.getPaddlePortalSessionUrl
          : (getPaddlePortalSessionUrl as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes>
    implements CopyWith$Query$GET_PADDLE_PORTAL_SESSION_URL<TRes> {
  _CopyWithStubImpl$Query$GET_PADDLE_PORTAL_SESSION_URL(this._res);

  TRes _res;

  call({String? getPaddlePortalSessionUrl, String? $__typename}) => _res;
}

const documentNodeQueryGET_PADDLE_PORTAL_SESSION_URL = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_PADDLE_PORTAL_SESSION_URL'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'subscription_id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getPaddlePortalSessionUrl'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'subscription_id'),
                value: VariableNode(name: NameNode(value: 'subscription_id')),
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
