import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$UPDATE_USER {
  factory Variables$Mutation$UPDATE_USER({
    required Input$UpdateUserInput data,
  }) => Variables$Mutation$UPDATE_USER._({r'data': data});

  Variables$Mutation$UPDATE_USER._(this._$data);

  factory Variables$Mutation$UPDATE_USER.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = Input$UpdateUserInput.fromJson(
      (l$data as Map<String, dynamic>),
    );
    return Variables$Mutation$UPDATE_USER._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateUserInput get data => (_$data['data'] as Input$UpdateUserInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UPDATE_USER<Variables$Mutation$UPDATE_USER>
  get copyWith => CopyWith$Variables$Mutation$UPDATE_USER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UPDATE_USER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }
}

abstract class CopyWith$Variables$Mutation$UPDATE_USER<TRes> {
  factory CopyWith$Variables$Mutation$UPDATE_USER(
    Variables$Mutation$UPDATE_USER instance,
    TRes Function(Variables$Mutation$UPDATE_USER) then,
  ) = _CopyWithImpl$Variables$Mutation$UPDATE_USER;

  factory CopyWith$Variables$Mutation$UPDATE_USER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UPDATE_USER;

  TRes call({Input$UpdateUserInput? data});
}

class _CopyWithImpl$Variables$Mutation$UPDATE_USER<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_USER<TRes> {
  _CopyWithImpl$Variables$Mutation$UPDATE_USER(this._instance, this._then);

  final Variables$Mutation$UPDATE_USER _instance;

  final TRes Function(Variables$Mutation$UPDATE_USER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? data = _undefined}) => _then(
    Variables$Mutation$UPDATE_USER._({
      ..._instance._$data,
      if (data != _undefined && data != null)
        'data': (data as Input$UpdateUserInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UPDATE_USER<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_USER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UPDATE_USER(this._res);

  TRes _res;

  call({Input$UpdateUserInput? data}) => _res;
}

class Mutation$UPDATE_USER {
  Mutation$UPDATE_USER({
    required this.updateUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UPDATE_USER.fromJson(Map<String, dynamic> json) {
    final l$updateUser = json['updateUser'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_USER(
      updateUser: Mutation$UPDATE_USER$updateUser.fromJson(
        (l$updateUser as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UPDATE_USER$updateUser updateUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateUser = updateUser;
    _resultData['updateUser'] = l$updateUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateUser = updateUser;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateUser, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPDATE_USER || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateUser = updateUser;
    final lOther$updateUser = other.updateUser;
    if (l$updateUser != lOther$updateUser) {
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

extension UtilityExtension$Mutation$UPDATE_USER on Mutation$UPDATE_USER {
  CopyWith$Mutation$UPDATE_USER<Mutation$UPDATE_USER> get copyWith =>
      CopyWith$Mutation$UPDATE_USER(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_USER<TRes> {
  factory CopyWith$Mutation$UPDATE_USER(
    Mutation$UPDATE_USER instance,
    TRes Function(Mutation$UPDATE_USER) then,
  ) = _CopyWithImpl$Mutation$UPDATE_USER;

  factory CopyWith$Mutation$UPDATE_USER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_USER;

  TRes call({Mutation$UPDATE_USER$updateUser? updateUser, String? $__typename});
  CopyWith$Mutation$UPDATE_USER$updateUser<TRes> get updateUser;
}

class _CopyWithImpl$Mutation$UPDATE_USER<TRes>
    implements CopyWith$Mutation$UPDATE_USER<TRes> {
  _CopyWithImpl$Mutation$UPDATE_USER(this._instance, this._then);

  final Mutation$UPDATE_USER _instance;

  final TRes Function(Mutation$UPDATE_USER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateUser = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_USER(
      updateUser: updateUser == _undefined || updateUser == null
          ? _instance.updateUser
          : (updateUser as Mutation$UPDATE_USER$updateUser),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UPDATE_USER$updateUser<TRes> get updateUser {
    final local$updateUser = _instance.updateUser;
    return CopyWith$Mutation$UPDATE_USER$updateUser(
      local$updateUser,
      (e) => call(updateUser: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UPDATE_USER<TRes>
    implements CopyWith$Mutation$UPDATE_USER<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_USER(this._res);

  TRes _res;

  call({Mutation$UPDATE_USER$updateUser? updateUser, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UPDATE_USER$updateUser<TRes> get updateUser =>
      CopyWith$Mutation$UPDATE_USER$updateUser.stub(_res);
}

const documentNodeMutationUPDATE_USER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UPDATE_USER'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'data')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdateUserInput'),
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
            name: NameNode(value: 'updateUser'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'data'),
                value: VariableNode(name: NameNode(value: 'data')),
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
                  name: NameNode(value: 'middle_name'),
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
                  name: NameNode(value: 'birth_date'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'gender'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'country'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'address_line1'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'address_line2'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'city'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'state'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'postal_code'),
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

class Mutation$UPDATE_USER$updateUser {
  Mutation$UPDATE_USER$updateUser({
    required this.id,
    required this.email,
    this.first_name,
    this.middle_name,
    this.last_name,
    this.birth_date,
    this.gender,
    this.country,
    this.address_line1,
    this.address_line2,
    this.city,
    this.state,
    this.postal_code,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'User',
  });

  factory Mutation$UPDATE_USER$updateUser.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$middle_name = json['middle_name'];
    final l$last_name = json['last_name'];
    final l$birth_date = json['birth_date'];
    final l$gender = json['gender'];
    final l$country = json['country'];
    final l$address_line1 = json['address_line1'];
    final l$address_line2 = json['address_line2'];
    final l$city = json['city'];
    final l$state = json['state'];
    final l$postal_code = json['postal_code'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_USER$updateUser(
      id: (l$id as String),
      email: (l$email as String),
      first_name: (l$first_name as String?),
      middle_name: (l$middle_name as String?),
      last_name: (l$last_name as String?),
      birth_date: (l$birth_date as String?),
      gender: (l$gender as String?),
      country: (l$country as String?),
      address_line1: (l$address_line1 as String?),
      address_line2: (l$address_line2 as String?),
      city: (l$city as String?),
      state: (l$state as String?),
      postal_code: (l$postal_code as String?),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? first_name;

  final String? middle_name;

  final String? last_name;

  final String? birth_date;

  final String? gender;

  final String? country;

  final String? address_line1;

  final String? address_line2;

  final String? city;

  final String? state;

  final String? postal_code;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$first_name = first_name;
    _resultData['first_name'] = l$first_name;
    final l$middle_name = middle_name;
    _resultData['middle_name'] = l$middle_name;
    final l$last_name = last_name;
    _resultData['last_name'] = l$last_name;
    final l$birth_date = birth_date;
    _resultData['birth_date'] = l$birth_date;
    final l$gender = gender;
    _resultData['gender'] = l$gender;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$address_line1 = address_line1;
    _resultData['address_line1'] = l$address_line1;
    final l$address_line2 = address_line2;
    _resultData['address_line2'] = l$address_line2;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$postal_code = postal_code;
    _resultData['postal_code'] = l$postal_code;
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
    final l$email = email;
    final l$first_name = first_name;
    final l$middle_name = middle_name;
    final l$last_name = last_name;
    final l$birth_date = birth_date;
    final l$gender = gender;
    final l$country = country;
    final l$address_line1 = address_line1;
    final l$address_line2 = address_line2;
    final l$city = city;
    final l$state = state;
    final l$postal_code = postal_code;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$first_name,
      l$middle_name,
      l$last_name,
      l$birth_date,
      l$gender,
      l$country,
      l$address_line1,
      l$address_line2,
      l$city,
      l$state,
      l$postal_code,
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
    if (other is! Mutation$UPDATE_USER$updateUser ||
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
    final l$middle_name = middle_name;
    final lOther$middle_name = other.middle_name;
    if (l$middle_name != lOther$middle_name) {
      return false;
    }
    final l$last_name = last_name;
    final lOther$last_name = other.last_name;
    if (l$last_name != lOther$last_name) {
      return false;
    }
    final l$birth_date = birth_date;
    final lOther$birth_date = other.birth_date;
    if (l$birth_date != lOther$birth_date) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
      return false;
    }
    final l$address_line1 = address_line1;
    final lOther$address_line1 = other.address_line1;
    if (l$address_line1 != lOther$address_line1) {
      return false;
    }
    final l$address_line2 = address_line2;
    final lOther$address_line2 = other.address_line2;
    if (l$address_line2 != lOther$address_line2) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$postal_code = postal_code;
    final lOther$postal_code = other.postal_code;
    if (l$postal_code != lOther$postal_code) {
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

extension UtilityExtension$Mutation$UPDATE_USER$updateUser
    on Mutation$UPDATE_USER$updateUser {
  CopyWith$Mutation$UPDATE_USER$updateUser<Mutation$UPDATE_USER$updateUser>
  get copyWith => CopyWith$Mutation$UPDATE_USER$updateUser(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_USER$updateUser<TRes> {
  factory CopyWith$Mutation$UPDATE_USER$updateUser(
    Mutation$UPDATE_USER$updateUser instance,
    TRes Function(Mutation$UPDATE_USER$updateUser) then,
  ) = _CopyWithImpl$Mutation$UPDATE_USER$updateUser;

  factory CopyWith$Mutation$UPDATE_USER$updateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_USER$updateUser;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    String? middle_name,
    String? last_name,
    String? birth_date,
    String? gender,
    String? country,
    String? address_line1,
    String? address_line2,
    String? city,
    String? state,
    String? postal_code,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UPDATE_USER$updateUser<TRes>
    implements CopyWith$Mutation$UPDATE_USER$updateUser<TRes> {
  _CopyWithImpl$Mutation$UPDATE_USER$updateUser(this._instance, this._then);

  final Mutation$UPDATE_USER$updateUser _instance;

  final TRes Function(Mutation$UPDATE_USER$updateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? middle_name = _undefined,
    Object? last_name = _undefined,
    Object? birth_date = _undefined,
    Object? gender = _undefined,
    Object? country = _undefined,
    Object? address_line1 = _undefined,
    Object? address_line2 = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postal_code = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_USER$updateUser(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      first_name: first_name == _undefined
          ? _instance.first_name
          : (first_name as String?),
      middle_name: middle_name == _undefined
          ? _instance.middle_name
          : (middle_name as String?),
      last_name: last_name == _undefined
          ? _instance.last_name
          : (last_name as String?),
      birth_date: birth_date == _undefined
          ? _instance.birth_date
          : (birth_date as String?),
      gender: gender == _undefined ? _instance.gender : (gender as String?),
      country: country == _undefined ? _instance.country : (country as String?),
      address_line1: address_line1 == _undefined
          ? _instance.address_line1
          : (address_line1 as String?),
      address_line2: address_line2 == _undefined
          ? _instance.address_line2
          : (address_line2 as String?),
      city: city == _undefined ? _instance.city : (city as String?),
      state: state == _undefined ? _instance.state : (state as String?),
      postal_code: postal_code == _undefined
          ? _instance.postal_code
          : (postal_code as String?),
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

class _CopyWithStubImpl$Mutation$UPDATE_USER$updateUser<TRes>
    implements CopyWith$Mutation$UPDATE_USER$updateUser<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_USER$updateUser(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? first_name,
    String? middle_name,
    String? last_name,
    String? birth_date,
    String? gender,
    String? country,
    String? address_line1,
    String? address_line2,
    String? city,
    String? state,
    String? postal_code,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
