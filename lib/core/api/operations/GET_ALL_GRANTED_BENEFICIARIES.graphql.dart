import 'package:gql/ast.dart';

class Query$GET_ALL_GRANTED_BENEFICIARIES {
  Query$GET_ALL_GRANTED_BENEFICIARIES({
    required this.getAllGrantedBeneficiaries,
    this.$__typename = 'Query',
  });

  factory Query$GET_ALL_GRANTED_BENEFICIARIES.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getAllGrantedBeneficiaries = json['getAllGrantedBeneficiaries'];
    final l$$__typename = json['__typename'];
    return Query$GET_ALL_GRANTED_BENEFICIARIES(
      getAllGrantedBeneficiaries: (l$getAllGrantedBeneficiaries as List<dynamic>)
          .map(
            (e) =>
                Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries>
  getAllGrantedBeneficiaries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getAllGrantedBeneficiaries = getAllGrantedBeneficiaries;
    _resultData['getAllGrantedBeneficiaries'] = l$getAllGrantedBeneficiaries
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getAllGrantedBeneficiaries = getAllGrantedBeneficiaries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getAllGrantedBeneficiaries.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_ALL_GRANTED_BENEFICIARIES ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getAllGrantedBeneficiaries = getAllGrantedBeneficiaries;
    final lOther$getAllGrantedBeneficiaries = other.getAllGrantedBeneficiaries;
    if (l$getAllGrantedBeneficiaries.length !=
        lOther$getAllGrantedBeneficiaries.length) {
      return false;
    }
    for (int i = 0; i < l$getAllGrantedBeneficiaries.length; i++) {
      final l$getAllGrantedBeneficiaries$entry =
          l$getAllGrantedBeneficiaries[i];
      final lOther$getAllGrantedBeneficiaries$entry =
          lOther$getAllGrantedBeneficiaries[i];
      if (l$getAllGrantedBeneficiaries$entry !=
          lOther$getAllGrantedBeneficiaries$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GET_ALL_GRANTED_BENEFICIARIES
    on Query$GET_ALL_GRANTED_BENEFICIARIES {
  CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES<
    Query$GET_ALL_GRANTED_BENEFICIARIES
  >
  get copyWith => CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES(this, (i) => i);
}

abstract class CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES<TRes> {
  factory CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES(
    Query$GET_ALL_GRANTED_BENEFICIARIES instance,
    TRes Function(Query$GET_ALL_GRANTED_BENEFICIARIES) then,
  ) = _CopyWithImpl$Query$GET_ALL_GRANTED_BENEFICIARIES;

  factory CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_ALL_GRANTED_BENEFICIARIES;

  TRes call({
    List<Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries>?
    getAllGrantedBeneficiaries,
    String? $__typename,
  });
  TRes getAllGrantedBeneficiaries(
    Iterable<Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries>
    Function(
      Iterable<
        CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
          Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_ALL_GRANTED_BENEFICIARIES<TRes>
    implements CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES<TRes> {
  _CopyWithImpl$Query$GET_ALL_GRANTED_BENEFICIARIES(this._instance, this._then);

  final Query$GET_ALL_GRANTED_BENEFICIARIES _instance;

  final TRes Function(Query$GET_ALL_GRANTED_BENEFICIARIES) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getAllGrantedBeneficiaries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_ALL_GRANTED_BENEFICIARIES(
      getAllGrantedBeneficiaries:
          getAllGrantedBeneficiaries == _undefined ||
              getAllGrantedBeneficiaries == null
          ? _instance.getAllGrantedBeneficiaries
          : (getAllGrantedBeneficiaries
                as List<
                  Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries
                >),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getAllGrantedBeneficiaries(
    Iterable<Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries>
    Function(
      Iterable<
        CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
          Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries
        >
      >,
    )
    _fn,
  ) => call(
    getAllGrantedBeneficiaries: _fn(
      _instance.getAllGrantedBeneficiaries.map(
        (e) =>
            CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_ALL_GRANTED_BENEFICIARIES<TRes>
    implements CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES<TRes> {
  _CopyWithStubImpl$Query$GET_ALL_GRANTED_BENEFICIARIES(this._res);

  TRes _res;

  call({
    List<Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries>?
    getAllGrantedBeneficiaries,
    String? $__typename,
  }) => _res;

  getAllGrantedBeneficiaries(_fn) => _res;
}

const documentNodeQueryGET_ALL_GRANTED_BENEFICIARIES = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_ALL_GRANTED_BENEFICIARIES'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getAllGrantedBeneficiaries'),
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

class Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries {
  Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries({
    required this.id,
    required this.user,
    required this.beneficiary_id,
    required this.created_at,
    required this.expire_at,
    this.$__typename = 'BeneficiaryAccess',
  });

  factory Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$beneficiary_id = json['beneficiary_id'];
    final l$created_at = json['created_at'];
    final l$expire_at = json['expire_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
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
    if (other
            is! Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries ||
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

extension UtilityExtension$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries
    on Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries {
  CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
    Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries
  >
  get copyWith =>
      CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
  TRes
> {
  factory CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
    Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries instance,
    TRes Function(
      Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries,
    )
    then,
  ) = _CopyWithImpl$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries;

  factory CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries;

  TRes call({
    String? id,
    String? user,
    String? beneficiary_id,
    String? created_at,
    String? expire_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
  TRes
>
    implements
        CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
          TRes
        > {
  _CopyWithImpl$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
    this._instance,
    this._then,
  );

  final Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries
  _instance;

  final TRes Function(
    Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? beneficiary_id = _undefined,
    Object? created_at = _undefined,
    Object? expire_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
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

class _CopyWithStubImpl$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
  TRes
>
    implements
        CopyWith$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_ALL_GRANTED_BENEFICIARIES$getAllGrantedBeneficiaries(
    this._res,
  );

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
