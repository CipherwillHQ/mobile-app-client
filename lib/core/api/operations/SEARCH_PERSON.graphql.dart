import 'package:gql/ast.dart';

class Variables$Query$SEARCH_PERSON {
  factory Variables$Query$SEARCH_PERSON({required String email}) =>
      Variables$Query$SEARCH_PERSON._({r'email': email});

  Variables$Query$SEARCH_PERSON._(this._$data);

  factory Variables$Query$SEARCH_PERSON.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Variables$Query$SEARCH_PERSON._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Variables$Query$SEARCH_PERSON<Variables$Query$SEARCH_PERSON>
  get copyWith => CopyWith$Variables$Query$SEARCH_PERSON(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$SEARCH_PERSON ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    return Object.hashAll([l$email]);
  }
}

abstract class CopyWith$Variables$Query$SEARCH_PERSON<TRes> {
  factory CopyWith$Variables$Query$SEARCH_PERSON(
    Variables$Query$SEARCH_PERSON instance,
    TRes Function(Variables$Query$SEARCH_PERSON) then,
  ) = _CopyWithImpl$Variables$Query$SEARCH_PERSON;

  factory CopyWith$Variables$Query$SEARCH_PERSON.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SEARCH_PERSON;

  TRes call({String? email});
}

class _CopyWithImpl$Variables$Query$SEARCH_PERSON<TRes>
    implements CopyWith$Variables$Query$SEARCH_PERSON<TRes> {
  _CopyWithImpl$Variables$Query$SEARCH_PERSON(this._instance, this._then);

  final Variables$Query$SEARCH_PERSON _instance;

  final TRes Function(Variables$Query$SEARCH_PERSON) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined}) => _then(
    Variables$Query$SEARCH_PERSON._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$SEARCH_PERSON<TRes>
    implements CopyWith$Variables$Query$SEARCH_PERSON<TRes> {
  _CopyWithStubImpl$Variables$Query$SEARCH_PERSON(this._res);

  TRes _res;

  call({String? email}) => _res;
}

class Query$SEARCH_PERSON {
  Query$SEARCH_PERSON({this.searchPerson, this.$__typename = 'Query'});

  factory Query$SEARCH_PERSON.fromJson(Map<String, dynamic> json) {
    final l$searchPerson = json['searchPerson'];
    final l$$__typename = json['__typename'];
    return Query$SEARCH_PERSON(
      searchPerson: (l$searchPerson as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$SEARCH_PERSON$searchPerson.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SEARCH_PERSON$searchPerson?>? searchPerson;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$searchPerson = searchPerson;
    _resultData['searchPerson'] = l$searchPerson
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$searchPerson = searchPerson;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$searchPerson == null
          ? null
          : Object.hashAll(l$searchPerson.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$SEARCH_PERSON || runtimeType != other.runtimeType) {
      return false;
    }
    final l$searchPerson = searchPerson;
    final lOther$searchPerson = other.searchPerson;
    if (l$searchPerson != null && lOther$searchPerson != null) {
      if (l$searchPerson.length != lOther$searchPerson.length) {
        return false;
      }
      for (int i = 0; i < l$searchPerson.length; i++) {
        final l$searchPerson$entry = l$searchPerson[i];
        final lOther$searchPerson$entry = lOther$searchPerson[i];
        if (l$searchPerson$entry != lOther$searchPerson$entry) {
          return false;
        }
      }
    } else if (l$searchPerson != lOther$searchPerson) {
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

extension UtilityExtension$Query$SEARCH_PERSON on Query$SEARCH_PERSON {
  CopyWith$Query$SEARCH_PERSON<Query$SEARCH_PERSON> get copyWith =>
      CopyWith$Query$SEARCH_PERSON(this, (i) => i);
}

abstract class CopyWith$Query$SEARCH_PERSON<TRes> {
  factory CopyWith$Query$SEARCH_PERSON(
    Query$SEARCH_PERSON instance,
    TRes Function(Query$SEARCH_PERSON) then,
  ) = _CopyWithImpl$Query$SEARCH_PERSON;

  factory CopyWith$Query$SEARCH_PERSON.stub(TRes res) =
      _CopyWithStubImpl$Query$SEARCH_PERSON;

  TRes call({
    List<Query$SEARCH_PERSON$searchPerson?>? searchPerson,
    String? $__typename,
  });
  TRes searchPerson(
    Iterable<Query$SEARCH_PERSON$searchPerson?>? Function(
      Iterable<
        CopyWith$Query$SEARCH_PERSON$searchPerson<
          Query$SEARCH_PERSON$searchPerson
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$SEARCH_PERSON<TRes>
    implements CopyWith$Query$SEARCH_PERSON<TRes> {
  _CopyWithImpl$Query$SEARCH_PERSON(this._instance, this._then);

  final Query$SEARCH_PERSON _instance;

  final TRes Function(Query$SEARCH_PERSON) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? searchPerson = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SEARCH_PERSON(
      searchPerson: searchPerson == _undefined
          ? _instance.searchPerson
          : (searchPerson as List<Query$SEARCH_PERSON$searchPerson?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes searchPerson(
    Iterable<Query$SEARCH_PERSON$searchPerson?>? Function(
      Iterable<
        CopyWith$Query$SEARCH_PERSON$searchPerson<
          Query$SEARCH_PERSON$searchPerson
        >?
      >?,
    )
    _fn,
  ) => call(
    searchPerson: _fn(
      _instance.searchPerson?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$SEARCH_PERSON$searchPerson(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$SEARCH_PERSON<TRes>
    implements CopyWith$Query$SEARCH_PERSON<TRes> {
  _CopyWithStubImpl$Query$SEARCH_PERSON(this._res);

  TRes _res;

  call({
    List<Query$SEARCH_PERSON$searchPerson?>? searchPerson,
    String? $__typename,
  }) => _res;

  searchPerson(_fn) => _res;
}

const documentNodeQuerySEARCH_PERSON = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SEARCH_PERSON'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'email')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'searchPerson'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
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

class Query$SEARCH_PERSON$searchPerson {
  Query$SEARCH_PERSON$searchPerson({required this.$__typename});

  factory Query$SEARCH_PERSON$searchPerson.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "User":
        return Query$SEARCH_PERSON$searchPerson$$User.fromJson(json);

      case "Guest":
        return Query$SEARCH_PERSON$searchPerson$$Guest.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$SEARCH_PERSON$searchPerson(
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
    if (other is! Query$SEARCH_PERSON$searchPerson ||
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

extension UtilityExtension$Query$SEARCH_PERSON$searchPerson
    on Query$SEARCH_PERSON$searchPerson {
  CopyWith$Query$SEARCH_PERSON$searchPerson<Query$SEARCH_PERSON$searchPerson>
  get copyWith => CopyWith$Query$SEARCH_PERSON$searchPerson(this, (i) => i);

  _T when<_T>({
    required _T Function(Query$SEARCH_PERSON$searchPerson$$User) user,
    required _T Function(Query$SEARCH_PERSON$searchPerson$$Guest) guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        return user(this as Query$SEARCH_PERSON$searchPerson$$User);

      case "Guest":
        return guest(this as Query$SEARCH_PERSON$searchPerson$$Guest);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$SEARCH_PERSON$searchPerson$$User)? user,
    _T Function(Query$SEARCH_PERSON$searchPerson$$Guest)? guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        if (user != null) {
          return user(this as Query$SEARCH_PERSON$searchPerson$$User);
        } else {
          return orElse();
        }

      case "Guest":
        if (guest != null) {
          return guest(this as Query$SEARCH_PERSON$searchPerson$$Guest);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$SEARCH_PERSON$searchPerson<TRes> {
  factory CopyWith$Query$SEARCH_PERSON$searchPerson(
    Query$SEARCH_PERSON$searchPerson instance,
    TRes Function(Query$SEARCH_PERSON$searchPerson) then,
  ) = _CopyWithImpl$Query$SEARCH_PERSON$searchPerson;

  factory CopyWith$Query$SEARCH_PERSON$searchPerson.stub(TRes res) =
      _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$SEARCH_PERSON$searchPerson<TRes>
    implements CopyWith$Query$SEARCH_PERSON$searchPerson<TRes> {
  _CopyWithImpl$Query$SEARCH_PERSON$searchPerson(this._instance, this._then);

  final Query$SEARCH_PERSON$searchPerson _instance;

  final TRes Function(Query$SEARCH_PERSON$searchPerson) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$SEARCH_PERSON$searchPerson(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson<TRes>
    implements CopyWith$Query$SEARCH_PERSON$searchPerson<TRes> {
  _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$SEARCH_PERSON$searchPerson$$User
    implements Query$SEARCH_PERSON$searchPerson {
  Query$SEARCH_PERSON$searchPerson$$User({
    required this.id,
    required this.email,
    this.first_name,
    this.$__typename = 'User',
  });

  factory Query$SEARCH_PERSON$searchPerson$$User.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$$__typename = json['__typename'];
    return Query$SEARCH_PERSON$searchPerson$$User(
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
    if (other is! Query$SEARCH_PERSON$searchPerson$$User ||
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

extension UtilityExtension$Query$SEARCH_PERSON$searchPerson$$User
    on Query$SEARCH_PERSON$searchPerson$$User {
  CopyWith$Query$SEARCH_PERSON$searchPerson$$User<
    Query$SEARCH_PERSON$searchPerson$$User
  >
  get copyWith =>
      CopyWith$Query$SEARCH_PERSON$searchPerson$$User(this, (i) => i);
}

abstract class CopyWith$Query$SEARCH_PERSON$searchPerson$$User<TRes> {
  factory CopyWith$Query$SEARCH_PERSON$searchPerson$$User(
    Query$SEARCH_PERSON$searchPerson$$User instance,
    TRes Function(Query$SEARCH_PERSON$searchPerson$$User) then,
  ) = _CopyWithImpl$Query$SEARCH_PERSON$searchPerson$$User;

  factory CopyWith$Query$SEARCH_PERSON$searchPerson$$User.stub(TRes res) =
      _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson$$User;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SEARCH_PERSON$searchPerson$$User<TRes>
    implements CopyWith$Query$SEARCH_PERSON$searchPerson$$User<TRes> {
  _CopyWithImpl$Query$SEARCH_PERSON$searchPerson$$User(
    this._instance,
    this._then,
  );

  final Query$SEARCH_PERSON$searchPerson$$User _instance;

  final TRes Function(Query$SEARCH_PERSON$searchPerson$$User) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SEARCH_PERSON$searchPerson$$User(
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

class _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson$$User<TRes>
    implements CopyWith$Query$SEARCH_PERSON$searchPerson$$User<TRes> {
  _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson$$User(this._res);

  TRes _res;

  call({String? id, String? email, String? first_name, String? $__typename}) =>
      _res;
}

class Query$SEARCH_PERSON$searchPerson$$Guest
    implements Query$SEARCH_PERSON$searchPerson {
  Query$SEARCH_PERSON$searchPerson$$Guest({
    required this.id,
    required this.email,
    this.first_name,
    this.$__typename = 'Guest',
  });

  factory Query$SEARCH_PERSON$searchPerson$$Guest.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$$__typename = json['__typename'];
    return Query$SEARCH_PERSON$searchPerson$$Guest(
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
    if (other is! Query$SEARCH_PERSON$searchPerson$$Guest ||
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

extension UtilityExtension$Query$SEARCH_PERSON$searchPerson$$Guest
    on Query$SEARCH_PERSON$searchPerson$$Guest {
  CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest<
    Query$SEARCH_PERSON$searchPerson$$Guest
  >
  get copyWith =>
      CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest(this, (i) => i);
}

abstract class CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest<TRes> {
  factory CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest(
    Query$SEARCH_PERSON$searchPerson$$Guest instance,
    TRes Function(Query$SEARCH_PERSON$searchPerson$$Guest) then,
  ) = _CopyWithImpl$Query$SEARCH_PERSON$searchPerson$$Guest;

  factory CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest.stub(TRes res) =
      _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson$$Guest;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SEARCH_PERSON$searchPerson$$Guest<TRes>
    implements CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest<TRes> {
  _CopyWithImpl$Query$SEARCH_PERSON$searchPerson$$Guest(
    this._instance,
    this._then,
  );

  final Query$SEARCH_PERSON$searchPerson$$Guest _instance;

  final TRes Function(Query$SEARCH_PERSON$searchPerson$$Guest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$SEARCH_PERSON$searchPerson$$Guest(
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

class _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson$$Guest<TRes>
    implements CopyWith$Query$SEARCH_PERSON$searchPerson$$Guest<TRes> {
  _CopyWithStubImpl$Query$SEARCH_PERSON$searchPerson$$Guest(this._res);

  TRes _res;

  call({String? id, String? email, String? first_name, String? $__typename}) =>
      _res;
}
