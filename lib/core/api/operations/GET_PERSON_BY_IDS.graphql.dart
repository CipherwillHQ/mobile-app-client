import 'package:gql/ast.dart';

class Variables$Query$GET_PERSON_BY_IDS {
  factory Variables$Query$GET_PERSON_BY_IDS({required List<String> list}) =>
      Variables$Query$GET_PERSON_BY_IDS._({r'list': list});

  Variables$Query$GET_PERSON_BY_IDS._(this._$data);

  factory Variables$Query$GET_PERSON_BY_IDS.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$list = data['list'];
    result$data['list'] = (l$list as List<dynamic>)
        .map((e) => (e as String))
        .toList();
    return Variables$Query$GET_PERSON_BY_IDS._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String> get list => (_$data['list'] as List<String>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$list = list;
    result$data['list'] = l$list.map((e) => e).toList();
    return result$data;
  }

  CopyWith$Variables$Query$GET_PERSON_BY_IDS<Variables$Query$GET_PERSON_BY_IDS>
  get copyWith => CopyWith$Variables$Query$GET_PERSON_BY_IDS(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_PERSON_BY_IDS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$list = list;
    final lOther$list = other.list;
    if (l$list.length != lOther$list.length) {
      return false;
    }
    for (int i = 0; i < l$list.length; i++) {
      final l$list$entry = l$list[i];
      final lOther$list$entry = lOther$list[i];
      if (l$list$entry != lOther$list$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$list = list;
    return Object.hashAll([Object.hashAll(l$list.map((v) => v))]);
  }
}

abstract class CopyWith$Variables$Query$GET_PERSON_BY_IDS<TRes> {
  factory CopyWith$Variables$Query$GET_PERSON_BY_IDS(
    Variables$Query$GET_PERSON_BY_IDS instance,
    TRes Function(Variables$Query$GET_PERSON_BY_IDS) then,
  ) = _CopyWithImpl$Variables$Query$GET_PERSON_BY_IDS;

  factory CopyWith$Variables$Query$GET_PERSON_BY_IDS.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_PERSON_BY_IDS;

  TRes call({List<String>? list});
}

class _CopyWithImpl$Variables$Query$GET_PERSON_BY_IDS<TRes>
    implements CopyWith$Variables$Query$GET_PERSON_BY_IDS<TRes> {
  _CopyWithImpl$Variables$Query$GET_PERSON_BY_IDS(this._instance, this._then);

  final Variables$Query$GET_PERSON_BY_IDS _instance;

  final TRes Function(Variables$Query$GET_PERSON_BY_IDS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? list = _undefined}) => _then(
    Variables$Query$GET_PERSON_BY_IDS._({
      ..._instance._$data,
      if (list != _undefined && list != null) 'list': (list as List<String>),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_PERSON_BY_IDS<TRes>
    implements CopyWith$Variables$Query$GET_PERSON_BY_IDS<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_PERSON_BY_IDS(this._res);

  TRes _res;

  call({List<String>? list}) => _res;
}

class Query$GET_PERSON_BY_IDS {
  Query$GET_PERSON_BY_IDS({
    required this.getPersonByIds,
    this.$__typename = 'Query',
  });

  factory Query$GET_PERSON_BY_IDS.fromJson(Map<String, dynamic> json) {
    final l$getPersonByIds = json['getPersonByIds'];
    final l$$__typename = json['__typename'];
    return Query$GET_PERSON_BY_IDS(
      getPersonByIds: (l$getPersonByIds as List<dynamic>)
          .map(
            (e) => Query$GET_PERSON_BY_IDS$getPersonByIds.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_PERSON_BY_IDS$getPersonByIds> getPersonByIds;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getPersonByIds = getPersonByIds;
    _resultData['getPersonByIds'] = l$getPersonByIds
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getPersonByIds = getPersonByIds;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$getPersonByIds.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PERSON_BY_IDS || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getPersonByIds = getPersonByIds;
    final lOther$getPersonByIds = other.getPersonByIds;
    if (l$getPersonByIds.length != lOther$getPersonByIds.length) {
      return false;
    }
    for (int i = 0; i < l$getPersonByIds.length; i++) {
      final l$getPersonByIds$entry = l$getPersonByIds[i];
      final lOther$getPersonByIds$entry = lOther$getPersonByIds[i];
      if (l$getPersonByIds$entry != lOther$getPersonByIds$entry) {
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

extension UtilityExtension$Query$GET_PERSON_BY_IDS on Query$GET_PERSON_BY_IDS {
  CopyWith$Query$GET_PERSON_BY_IDS<Query$GET_PERSON_BY_IDS> get copyWith =>
      CopyWith$Query$GET_PERSON_BY_IDS(this, (i) => i);
}

abstract class CopyWith$Query$GET_PERSON_BY_IDS<TRes> {
  factory CopyWith$Query$GET_PERSON_BY_IDS(
    Query$GET_PERSON_BY_IDS instance,
    TRes Function(Query$GET_PERSON_BY_IDS) then,
  ) = _CopyWithImpl$Query$GET_PERSON_BY_IDS;

  factory CopyWith$Query$GET_PERSON_BY_IDS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON_BY_IDS;

  TRes call({
    List<Query$GET_PERSON_BY_IDS$getPersonByIds>? getPersonByIds,
    String? $__typename,
  });
  TRes getPersonByIds(
    Iterable<Query$GET_PERSON_BY_IDS$getPersonByIds> Function(
      Iterable<
        CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds<
          Query$GET_PERSON_BY_IDS$getPersonByIds
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_PERSON_BY_IDS<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS<TRes> {
  _CopyWithImpl$Query$GET_PERSON_BY_IDS(this._instance, this._then);

  final Query$GET_PERSON_BY_IDS _instance;

  final TRes Function(Query$GET_PERSON_BY_IDS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getPersonByIds = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PERSON_BY_IDS(
      getPersonByIds: getPersonByIds == _undefined || getPersonByIds == null
          ? _instance.getPersonByIds
          : (getPersonByIds as List<Query$GET_PERSON_BY_IDS$getPersonByIds>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getPersonByIds(
    Iterable<Query$GET_PERSON_BY_IDS$getPersonByIds> Function(
      Iterable<
        CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds<
          Query$GET_PERSON_BY_IDS$getPersonByIds
        >
      >,
    )
    _fn,
  ) => call(
    getPersonByIds: _fn(
      _instance.getPersonByIds.map(
        (e) => CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_PERSON_BY_IDS<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON_BY_IDS(this._res);

  TRes _res;

  call({
    List<Query$GET_PERSON_BY_IDS$getPersonByIds>? getPersonByIds,
    String? $__typename,
  }) => _res;

  getPersonByIds(_fn) => _res;
}

const documentNodeQueryGET_PERSON_BY_IDS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_PERSON_BY_IDS'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'list')),
          type: ListTypeNode(
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getPersonByIds'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'list'),
                value: VariableNode(name: NameNode(value: 'list')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                      name: NameNode(value: 'User'),
                      isNonNull: false,
                    ),
                  ),
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
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'first_name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'last_name'),
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
                InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                      name: NameNode(value: 'Guest'),
                      isNonNull: false,
                    ),
                  ),
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
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'first_name'),
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

class Query$GET_PERSON_BY_IDS$getPersonByIds {
  Query$GET_PERSON_BY_IDS$getPersonByIds({required this.$__typename});

  factory Query$GET_PERSON_BY_IDS$getPersonByIds.fromJson(
    Map<String, dynamic> json,
  ) {
    switch (json["__typename"] as String) {
      case "User":
        return Query$GET_PERSON_BY_IDS$getPersonByIds$$User.fromJson(json);

      case "Guest":
        return Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$GET_PERSON_BY_IDS$getPersonByIds(
          $__typename: (l$$__typename as String),
        );
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PERSON_BY_IDS$getPersonByIds ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GET_PERSON_BY_IDS$getPersonByIds
    on Query$GET_PERSON_BY_IDS$getPersonByIds {
  CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds<
    Query$GET_PERSON_BY_IDS$getPersonByIds
  >
  get copyWith =>
      CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds(this, (i) => i);

  _T when<_T>({
    required _T Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$User) user,
    required _T Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest) guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        return user(this as Query$GET_PERSON_BY_IDS$getPersonByIds$$User);

      case "Guest":
        return guest(this as Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$User)? user,
    _T Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest)? guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        if (user != null) {
          return user(this as Query$GET_PERSON_BY_IDS$getPersonByIds$$User);
        } else {
          return orElse();
        }

      case "Guest":
        if (guest != null) {
          return guest(this as Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds<TRes> {
  factory CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds(
    Query$GET_PERSON_BY_IDS$getPersonByIds instance,
    TRes Function(Query$GET_PERSON_BY_IDS$getPersonByIds) then,
  ) = _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds;

  factory CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds<TRes> {
  _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds(
    this._instance,
    this._then,
  );

  final Query$GET_PERSON_BY_IDS$getPersonByIds _instance;

  final TRes Function(Query$GET_PERSON_BY_IDS$getPersonByIds) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$GET_PERSON_BY_IDS$getPersonByIds(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$GET_PERSON_BY_IDS$getPersonByIds$$User
    implements Query$GET_PERSON_BY_IDS$getPersonByIds {
  Query$GET_PERSON_BY_IDS$getPersonByIds$$User({
    required this.id,
    required this.email,
    this.first_name,
    this.last_name,
    this.$__typename = 'User',
  });

  factory Query$GET_PERSON_BY_IDS$getPersonByIds$$User.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$last_name = json['last_name'];
    final l$$__typename = json['__typename'];
    return Query$GET_PERSON_BY_IDS$getPersonByIds$$User(
      id: (l$id as String),
      email: (l$email as String),
      first_name: (l$first_name as String?),
      last_name: (l$last_name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? first_name;

  final String? last_name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$first_name = first_name;
    _resultData['first_name'] = l$first_name;
    final l$last_name = last_name;
    _resultData['last_name'] = l$last_name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$first_name = first_name;
    final l$last_name = last_name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$first_name,
      l$last_name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PERSON_BY_IDS$getPersonByIds$$User ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$first_name = first_name;
    final lOther$first_name = other.first_name;
    if (l$first_name != lOther$first_name) {
      return false;
    }
    final l$last_name = last_name;
    final lOther$last_name = other.last_name;
    if (l$last_name != lOther$last_name) {
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

extension UtilityExtension$Query$GET_PERSON_BY_IDS$getPersonByIds$$User
    on Query$GET_PERSON_BY_IDS$getPersonByIds$$User {
  CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User<
    Query$GET_PERSON_BY_IDS$getPersonByIds$$User
  >
  get copyWith =>
      CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User(this, (i) => i);
}

abstract class CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User<TRes> {
  factory CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User(
    Query$GET_PERSON_BY_IDS$getPersonByIds$$User instance,
    TRes Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$User) then,
  ) = _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$User;

  factory CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$User;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? last_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$User<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User<TRes> {
  _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$User(
    this._instance,
    this._then,
  );

  final Query$GET_PERSON_BY_IDS$getPersonByIds$$User _instance;

  final TRes Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$User) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? last_name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PERSON_BY_IDS$getPersonByIds$$User(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      first_name: first_name == _undefined
          ? _instance.first_name
          : (first_name as String?),
      last_name: last_name == _undefined
          ? _instance.last_name
          : (last_name as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$User<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$User<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$User(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? first_name,
    String? last_name,
    String? $__typename,
  }) => _res;
}

class Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest
    implements Query$GET_PERSON_BY_IDS$getPersonByIds {
  Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest({
    required this.id,
    required this.email,
    this.first_name,
    this.$__typename = 'Guest',
  });

  factory Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$$__typename = json['__typename'];
    return Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest(
      id: (l$id as String),
      email: (l$email as String),
      first_name: (l$first_name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? first_name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$first_name = first_name;
    _resultData['first_name'] = l$first_name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$first_name = first_name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$first_name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$first_name = first_name;
    final lOther$first_name = other.first_name;
    if (l$first_name != lOther$first_name) {
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

extension UtilityExtension$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest
    on Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest {
  CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest<
    Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest
  >
  get copyWith =>
      CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest(this, (i) => i);
}

abstract class CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest<TRes> {
  factory CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest(
    Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest instance,
    TRes Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest) then,
  ) = _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest;

  factory CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest<TRes> {
  _CopyWithImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest(
    this._instance,
    this._then,
  );

  final Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest _instance;

  final TRes Function(Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      first_name: first_name == _undefined
          ? _instance.first_name
          : (first_name as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest<TRes>
    implements CopyWith$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON_BY_IDS$getPersonByIds$$Guest(this._res);

  TRes _res;

  call({String? id, String? email, String? first_name, String? $__typename}) =>
      _res;
}
