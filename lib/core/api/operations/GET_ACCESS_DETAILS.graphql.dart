import 'package:gql/ast.dart';

class Variables$Query$GET_ACCESS_DETAILS {
  factory Variables$Query$GET_ACCESS_DETAILS({required String access_id}) =>
      Variables$Query$GET_ACCESS_DETAILS._({r'access_id': access_id});

  Variables$Query$GET_ACCESS_DETAILS._(this._$data);

  factory Variables$Query$GET_ACCESS_DETAILS.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    return Variables$Query$GET_ACCESS_DETAILS._(result$data);
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_ACCESS_DETAILS<
    Variables$Query$GET_ACCESS_DETAILS
  >
  get copyWith => CopyWith$Variables$Query$GET_ACCESS_DETAILS(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_ACCESS_DETAILS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$access_id = access_id;
    return Object.hashAll([l$access_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_ACCESS_DETAILS<TRes> {
  factory CopyWith$Variables$Query$GET_ACCESS_DETAILS(
    Variables$Query$GET_ACCESS_DETAILS instance,
    TRes Function(Variables$Query$GET_ACCESS_DETAILS) then,
  ) = _CopyWithImpl$Variables$Query$GET_ACCESS_DETAILS;

  factory CopyWith$Variables$Query$GET_ACCESS_DETAILS.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_ACCESS_DETAILS;

  TRes call({String? access_id});
}

class _CopyWithImpl$Variables$Query$GET_ACCESS_DETAILS<TRes>
    implements CopyWith$Variables$Query$GET_ACCESS_DETAILS<TRes> {
  _CopyWithImpl$Variables$Query$GET_ACCESS_DETAILS(this._instance, this._then);

  final Variables$Query$GET_ACCESS_DETAILS _instance;

  final TRes Function(Variables$Query$GET_ACCESS_DETAILS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? access_id = _undefined}) => _then(
    Variables$Query$GET_ACCESS_DETAILS._({
      ..._instance._$data,
      if (access_id != _undefined && access_id != null)
        'access_id': (access_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_ACCESS_DETAILS<TRes>
    implements CopyWith$Variables$Query$GET_ACCESS_DETAILS<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_ACCESS_DETAILS(this._res);

  TRes _res;

  call({String? access_id}) => _res;
}

class Query$GET_ACCESS_DETAILS {
  Query$GET_ACCESS_DETAILS({
    required this.getAccessDetails,
    this.$__typename = 'Query',
  });

  factory Query$GET_ACCESS_DETAILS.fromJson(Map<String, dynamic> json) {
    final l$getAccessDetails = json['getAccessDetails'];
    final l$$__typename = json['__typename'];
    return Query$GET_ACCESS_DETAILS(
      getAccessDetails: Query$GET_ACCESS_DETAILS$getAccessDetails.fromJson(
        (l$getAccessDetails as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_ACCESS_DETAILS$getAccessDetails getAccessDetails;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getAccessDetails = getAccessDetails;
    _resultData['getAccessDetails'] = l$getAccessDetails.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getAccessDetails = getAccessDetails;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getAccessDetails, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_ACCESS_DETAILS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getAccessDetails = getAccessDetails;
    final lOther$getAccessDetails = other.getAccessDetails;
    if (l$getAccessDetails != lOther$getAccessDetails) {
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

extension UtilityExtension$Query$GET_ACCESS_DETAILS
    on Query$GET_ACCESS_DETAILS {
  CopyWith$Query$GET_ACCESS_DETAILS<Query$GET_ACCESS_DETAILS> get copyWith =>
      CopyWith$Query$GET_ACCESS_DETAILS(this, (i) => i);
}

abstract class CopyWith$Query$GET_ACCESS_DETAILS<TRes> {
  factory CopyWith$Query$GET_ACCESS_DETAILS(
    Query$GET_ACCESS_DETAILS instance,
    TRes Function(Query$GET_ACCESS_DETAILS) then,
  ) = _CopyWithImpl$Query$GET_ACCESS_DETAILS;

  factory CopyWith$Query$GET_ACCESS_DETAILS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_ACCESS_DETAILS;

  TRes call({
    Query$GET_ACCESS_DETAILS$getAccessDetails? getAccessDetails,
    String? $__typename,
  });
  CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes> get getAccessDetails;
}

class _CopyWithImpl$Query$GET_ACCESS_DETAILS<TRes>
    implements CopyWith$Query$GET_ACCESS_DETAILS<TRes> {
  _CopyWithImpl$Query$GET_ACCESS_DETAILS(this._instance, this._then);

  final Query$GET_ACCESS_DETAILS _instance;

  final TRes Function(Query$GET_ACCESS_DETAILS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getAccessDetails = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_ACCESS_DETAILS(
      getAccessDetails:
          getAccessDetails == _undefined || getAccessDetails == null
          ? _instance.getAccessDetails
          : (getAccessDetails as Query$GET_ACCESS_DETAILS$getAccessDetails),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes>
  get getAccessDetails {
    final local$getAccessDetails = _instance.getAccessDetails;
    return CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails(
      local$getAccessDetails,
      (e) => call(getAccessDetails: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_ACCESS_DETAILS<TRes>
    implements CopyWith$Query$GET_ACCESS_DETAILS<TRes> {
  _CopyWithStubImpl$Query$GET_ACCESS_DETAILS(this._res);

  TRes _res;

  call({
    Query$GET_ACCESS_DETAILS$getAccessDetails? getAccessDetails,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes>
  get getAccessDetails =>
      CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails.stub(_res);
}

const documentNodeQueryGET_ACCESS_DETAILS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_ACCESS_DETAILS'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getAccessDetails'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
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
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'beneficiary_id'),
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
                  name: NameNode(value: 'expire_at'),
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

class Query$GET_ACCESS_DETAILS$getAccessDetails {
  Query$GET_ACCESS_DETAILS$getAccessDetails({
    required this.id,
    required this.user,
    required this.beneficiary_id,
    required this.created_at,
    required this.expire_at,
    this.$__typename = 'BeneficiaryAccess',
  });

  factory Query$GET_ACCESS_DETAILS$getAccessDetails.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$beneficiary_id = json['beneficiary_id'];
    final l$created_at = json['created_at'];
    final l$expire_at = json['expire_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_ACCESS_DETAILS$getAccessDetails(
      id: (l$id as String),
      user: (l$user as String),
      beneficiary_id: (l$beneficiary_id as String),
      created_at: (l$created_at as String),
      expire_at: (l$expire_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String user;

  final String beneficiary_id;

  final String created_at;

  final String expire_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user;
    final l$beneficiary_id = beneficiary_id;
    _resultData['beneficiary_id'] = l$beneficiary_id;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$expire_at = expire_at;
    _resultData['expire_at'] = l$expire_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$beneficiary_id = beneficiary_id;
    final l$created_at = created_at;
    final l$expire_at = expire_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$beneficiary_id,
      l$created_at,
      l$expire_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_ACCESS_DETAILS$getAccessDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (l$beneficiary_id != lOther$beneficiary_id) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$expire_at = expire_at;
    final lOther$expire_at = other.expire_at;
    if (l$expire_at != lOther$expire_at) {
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

extension UtilityExtension$Query$GET_ACCESS_DETAILS$getAccessDetails
    on Query$GET_ACCESS_DETAILS$getAccessDetails {
  CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<
    Query$GET_ACCESS_DETAILS$getAccessDetails
  >
  get copyWith =>
      CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails(this, (i) => i);
}

abstract class CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes> {
  factory CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails(
    Query$GET_ACCESS_DETAILS$getAccessDetails instance,
    TRes Function(Query$GET_ACCESS_DETAILS$getAccessDetails) then,
  ) = _CopyWithImpl$Query$GET_ACCESS_DETAILS$getAccessDetails;

  factory CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_ACCESS_DETAILS$getAccessDetails;

  TRes call({
    String? id,
    String? user,
    String? beneficiary_id,
    String? created_at,
    String? expire_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes>
    implements CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes> {
  _CopyWithImpl$Query$GET_ACCESS_DETAILS$getAccessDetails(
    this._instance,
    this._then,
  );

  final Query$GET_ACCESS_DETAILS$getAccessDetails _instance;

  final TRes Function(Query$GET_ACCESS_DETAILS$getAccessDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? beneficiary_id = _undefined,
    Object? created_at = _undefined,
    Object? expire_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_ACCESS_DETAILS$getAccessDetails(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as String),
      beneficiary_id: beneficiary_id == _undefined || beneficiary_id == null
          ? _instance.beneficiary_id
          : (beneficiary_id as String),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      expire_at: expire_at == _undefined || expire_at == null
          ? _instance.expire_at
          : (expire_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes>
    implements CopyWith$Query$GET_ACCESS_DETAILS$getAccessDetails<TRes> {
  _CopyWithStubImpl$Query$GET_ACCESS_DETAILS$getAccessDetails(this._res);

  TRes _res;

  call({
    String? id,
    String? user,
    String? beneficiary_id,
    String? created_at,
    String? expire_at,
    String? $__typename,
  }) => _res;
}
