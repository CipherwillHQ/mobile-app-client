import 'package:gql/ast.dart';

class Variables$Query$GET_PERSON {
  factory Variables$Query$GET_PERSON({required String id}) =>
      Variables$Query$GET_PERSON._({r'id': id});

  Variables$Query$GET_PERSON._(this._$data);

  factory Variables$Query$GET_PERSON.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GET_PERSON._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_PERSON<Variables$Query$GET_PERSON>
  get copyWith => CopyWith$Variables$Query$GET_PERSON(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_PERSON ||
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

abstract class CopyWith$Variables$Query$GET_PERSON<TRes> {
  factory CopyWith$Variables$Query$GET_PERSON(
    Variables$Query$GET_PERSON instance,
    TRes Function(Variables$Query$GET_PERSON) then,
  ) = _CopyWithImpl$Variables$Query$GET_PERSON;

  factory CopyWith$Variables$Query$GET_PERSON.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_PERSON;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GET_PERSON<TRes>
    implements CopyWith$Variables$Query$GET_PERSON<TRes> {
  _CopyWithImpl$Variables$Query$GET_PERSON(this._instance, this._then);

  final Variables$Query$GET_PERSON _instance;

  final TRes Function(Variables$Query$GET_PERSON) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GET_PERSON._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_PERSON<TRes>
    implements CopyWith$Variables$Query$GET_PERSON<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_PERSON(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GET_PERSON {
  Query$GET_PERSON({required this.getPerson, this.$__typename = 'Query'});

  factory Query$GET_PERSON.fromJson(Map<String, dynamic> json) {
    final l$getPerson = json['getPerson'];
    final l$$__typename = json['__typename'];
    return Query$GET_PERSON(
      getPerson: Query$GET_PERSON$getPerson.fromJson(
        (l$getPerson as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_PERSON$getPerson getPerson;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getPerson = getPerson;
    _resultData['getPerson'] = l$getPerson.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getPerson = getPerson;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getPerson, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_PERSON || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getPerson = getPerson;
    final lOther$getPerson = other.getPerson;
    if (l$getPerson != lOther$getPerson) {
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

extension UtilityExtension$Query$GET_PERSON on Query$GET_PERSON {
  CopyWith$Query$GET_PERSON<Query$GET_PERSON> get copyWith =>
      CopyWith$Query$GET_PERSON(this, (i) => i);
}

abstract class CopyWith$Query$GET_PERSON<TRes> {
  factory CopyWith$Query$GET_PERSON(
    Query$GET_PERSON instance,
    TRes Function(Query$GET_PERSON) then,
  ) = _CopyWithImpl$Query$GET_PERSON;

  factory CopyWith$Query$GET_PERSON.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON;

  TRes call({Query$GET_PERSON$getPerson? getPerson, String? $__typename});
  CopyWith$Query$GET_PERSON$getPerson<TRes> get getPerson;
}

class _CopyWithImpl$Query$GET_PERSON<TRes>
    implements CopyWith$Query$GET_PERSON<TRes> {
  _CopyWithImpl$Query$GET_PERSON(this._instance, this._then);

  final Query$GET_PERSON _instance;

  final TRes Function(Query$GET_PERSON) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getPerson = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PERSON(
      getPerson: getPerson == _undefined || getPerson == null
          ? _instance.getPerson
          : (getPerson as Query$GET_PERSON$getPerson),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_PERSON$getPerson<TRes> get getPerson {
    final local$getPerson = _instance.getPerson;
    return CopyWith$Query$GET_PERSON$getPerson(
      local$getPerson,
      (e) => call(getPerson: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_PERSON<TRes>
    implements CopyWith$Query$GET_PERSON<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON(this._res);

  TRes _res;

  call({Query$GET_PERSON$getPerson? getPerson, String? $__typename}) => _res;

  CopyWith$Query$GET_PERSON$getPerson<TRes> get getPerson =>
      CopyWith$Query$GET_PERSON$getPerson.stub(_res);
}

const documentNodeQueryGET_PERSON = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_PERSON'),
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
            name: NameNode(value: 'getPerson'),
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

class Query$GET_PERSON$getPerson {
  Query$GET_PERSON$getPerson({required this.$__typename});

  factory Query$GET_PERSON$getPerson.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "User":
        return Query$GET_PERSON$getPerson$$User.fromJson(json);

      case "Guest":
        return Query$GET_PERSON$getPerson$$Guest.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Query$GET_PERSON$getPerson(
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
    if (other is! Query$GET_PERSON$getPerson ||
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

extension UtilityExtension$Query$GET_PERSON$getPerson
    on Query$GET_PERSON$getPerson {
  CopyWith$Query$GET_PERSON$getPerson<Query$GET_PERSON$getPerson>
  get copyWith => CopyWith$Query$GET_PERSON$getPerson(this, (i) => i);

  _T when<_T>({
    required _T Function(Query$GET_PERSON$getPerson$$User) user,
    required _T Function(Query$GET_PERSON$getPerson$$Guest) guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        return user(this as Query$GET_PERSON$getPerson$$User);

      case "Guest":
        return guest(this as Query$GET_PERSON$getPerson$$Guest);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Query$GET_PERSON$getPerson$$User)? user,
    _T Function(Query$GET_PERSON$getPerson$$Guest)? guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        if (user != null) {
          return user(this as Query$GET_PERSON$getPerson$$User);
        } else {
          return orElse();
        }

      case "Guest":
        if (guest != null) {
          return guest(this as Query$GET_PERSON$getPerson$$Guest);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Query$GET_PERSON$getPerson<TRes> {
  factory CopyWith$Query$GET_PERSON$getPerson(
    Query$GET_PERSON$getPerson instance,
    TRes Function(Query$GET_PERSON$getPerson) then,
  ) = _CopyWithImpl$Query$GET_PERSON$getPerson;

  factory CopyWith$Query$GET_PERSON$getPerson.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON$getPerson;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Query$GET_PERSON$getPerson<TRes>
    implements CopyWith$Query$GET_PERSON$getPerson<TRes> {
  _CopyWithImpl$Query$GET_PERSON$getPerson(this._instance, this._then);

  final Query$GET_PERSON$getPerson _instance;

  final TRes Function(Query$GET_PERSON$getPerson) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Query$GET_PERSON$getPerson(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_PERSON$getPerson<TRes>
    implements CopyWith$Query$GET_PERSON$getPerson<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON$getPerson(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Query$GET_PERSON$getPerson$$User implements Query$GET_PERSON$getPerson {
  Query$GET_PERSON$getPerson$$User({
    required this.id,
    required this.email,
    this.first_name,
    this.$__typename = 'User',
  });

  factory Query$GET_PERSON$getPerson$$User.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$$__typename = json['__typename'];
    return Query$GET_PERSON$getPerson$$User(
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
    if (other is! Query$GET_PERSON$getPerson$$User ||
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

extension UtilityExtension$Query$GET_PERSON$getPerson$$User
    on Query$GET_PERSON$getPerson$$User {
  CopyWith$Query$GET_PERSON$getPerson$$User<Query$GET_PERSON$getPerson$$User>
  get copyWith => CopyWith$Query$GET_PERSON$getPerson$$User(this, (i) => i);
}

abstract class CopyWith$Query$GET_PERSON$getPerson$$User<TRes> {
  factory CopyWith$Query$GET_PERSON$getPerson$$User(
    Query$GET_PERSON$getPerson$$User instance,
    TRes Function(Query$GET_PERSON$getPerson$$User) then,
  ) = _CopyWithImpl$Query$GET_PERSON$getPerson$$User;

  factory CopyWith$Query$GET_PERSON$getPerson$$User.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON$getPerson$$User;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_PERSON$getPerson$$User<TRes>
    implements CopyWith$Query$GET_PERSON$getPerson$$User<TRes> {
  _CopyWithImpl$Query$GET_PERSON$getPerson$$User(this._instance, this._then);

  final Query$GET_PERSON$getPerson$$User _instance;

  final TRes Function(Query$GET_PERSON$getPerson$$User) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PERSON$getPerson$$User(
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

class _CopyWithStubImpl$Query$GET_PERSON$getPerson$$User<TRes>
    implements CopyWith$Query$GET_PERSON$getPerson$$User<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON$getPerson$$User(this._res);

  TRes _res;

  call({String? id, String? email, String? first_name, String? $__typename}) =>
      _res;
}

class Query$GET_PERSON$getPerson$$Guest implements Query$GET_PERSON$getPerson {
  Query$GET_PERSON$getPerson$$Guest({
    required this.id,
    required this.email,
    this.first_name,
    this.$__typename = 'Guest',
  });

  factory Query$GET_PERSON$getPerson$$Guest.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$$__typename = json['__typename'];
    return Query$GET_PERSON$getPerson$$Guest(
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
    if (other is! Query$GET_PERSON$getPerson$$Guest ||
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

extension UtilityExtension$Query$GET_PERSON$getPerson$$Guest
    on Query$GET_PERSON$getPerson$$Guest {
  CopyWith$Query$GET_PERSON$getPerson$$Guest<Query$GET_PERSON$getPerson$$Guest>
  get copyWith => CopyWith$Query$GET_PERSON$getPerson$$Guest(this, (i) => i);
}

abstract class CopyWith$Query$GET_PERSON$getPerson$$Guest<TRes> {
  factory CopyWith$Query$GET_PERSON$getPerson$$Guest(
    Query$GET_PERSON$getPerson$$Guest instance,
    TRes Function(Query$GET_PERSON$getPerson$$Guest) then,
  ) = _CopyWithImpl$Query$GET_PERSON$getPerson$$Guest;

  factory CopyWith$Query$GET_PERSON$getPerson$$Guest.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_PERSON$getPerson$$Guest;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_PERSON$getPerson$$Guest<TRes>
    implements CopyWith$Query$GET_PERSON$getPerson$$Guest<TRes> {
  _CopyWithImpl$Query$GET_PERSON$getPerson$$Guest(this._instance, this._then);

  final Query$GET_PERSON$getPerson$$Guest _instance;

  final TRes Function(Query$GET_PERSON$getPerson$$Guest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_PERSON$getPerson$$Guest(
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

class _CopyWithStubImpl$Query$GET_PERSON$getPerson$$Guest<TRes>
    implements CopyWith$Query$GET_PERSON$getPerson$$Guest<TRes> {
  _CopyWithStubImpl$Query$GET_PERSON$getPerson$$Guest(this._res);

  TRes _res;

  call({String? id, String? email, String? first_name, String? $__typename}) =>
      _res;
}
