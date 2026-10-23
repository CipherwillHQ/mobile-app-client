import 'package:gql/ast.dart';

class Query$ME {
  Query$ME({required this.me, this.$__typename = 'Query'});

  factory Query$ME.fromJson(Map<String, dynamic> json) {
    final l$me = json['me'];
    final l$$__typename = json['__typename'];
    return Query$ME(
      me: Query$ME$me.fromJson((l$me as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ME$me me;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$me = me;
    _resultData['me'] = l$me.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$me = me;
    final l$$__typename = $__typename;
    return Object.hashAll([l$me, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$ME || runtimeType != other.runtimeType) {
      return false;
    }
    final l$me = me;
    final lOther$me = other.me;
    if (l$me != lOther$me) {
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

extension UtilityExtension$Query$ME on Query$ME {
  CopyWith$Query$ME<Query$ME> get copyWith => CopyWith$Query$ME(this, (i) => i);
}

abstract class CopyWith$Query$ME<TRes> {
  factory CopyWith$Query$ME(Query$ME instance, TRes Function(Query$ME) then) =
      _CopyWithImpl$Query$ME;

  factory CopyWith$Query$ME.stub(TRes res) = _CopyWithStubImpl$Query$ME;

  TRes call({Query$ME$me? me, String? $__typename});
  CopyWith$Query$ME$me<TRes> get me;
}

class _CopyWithImpl$Query$ME<TRes> implements CopyWith$Query$ME<TRes> {
  _CopyWithImpl$Query$ME(this._instance, this._then);

  final Query$ME _instance;

  final TRes Function(Query$ME) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? me = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$ME(
          me: me == _undefined || me == null
              ? _instance.me
              : (me as Query$ME$me),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$ME$me<TRes> get me {
    final local$me = _instance.me;
    return CopyWith$Query$ME$me(local$me, (e) => call(me: e));
  }
}

class _CopyWithStubImpl$Query$ME<TRes> implements CopyWith$Query$ME<TRes> {
  _CopyWithStubImpl$Query$ME(this._res);

  TRes _res;

  call({Query$ME$me? me, String? $__typename}) => _res;

  CopyWith$Query$ME$me<TRes> get me => CopyWith$Query$ME$me.stub(_res);
}

const documentNodeQueryME = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ME'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'me'),
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
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'email_verified'),
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
                  name: NameNode(value: 'plan'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'last_accessed'),
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

class Query$ME$me {
  Query$ME$me({
    required this.id,
    required this.email,
    required this.email_verified,
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
    required this.plan,
    required this.last_accessed,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'User',
  });

  factory Query$ME$me.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$email_verified = json['email_verified'];
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
    final l$plan = json['plan'];
    final l$last_accessed = json['last_accessed'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$ME$me(
      id: (l$id as String),
      email: (l$email as String),
      email_verified: (l$email_verified as bool),
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
      plan: (l$plan as String),
      last_accessed: (l$last_accessed as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final bool email_verified;

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

  final String plan;

  final String last_accessed;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$email_verified = email_verified;
    _resultData['email_verified'] = l$email_verified;
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
    final l$plan = plan;
    _resultData['plan'] = l$plan;
    final l$last_accessed = last_accessed;
    _resultData['last_accessed'] = l$last_accessed;
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
    final l$email_verified = email_verified;
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
    final l$plan = plan;
    final l$last_accessed = last_accessed;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$email_verified,
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
      l$plan,
      l$last_accessed,
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
    if (other is! Query$ME$me || runtimeType != other.runtimeType) {
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
    final l$email_verified = email_verified;
    final lOther$email_verified = other.email_verified;
    if (l$email_verified != lOther$email_verified) {
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
    final l$plan = plan;
    final lOther$plan = other.plan;
    if (l$plan != lOther$plan) {
      return false;
    }
    final l$last_accessed = last_accessed;
    final lOther$last_accessed = other.last_accessed;
    if (l$last_accessed != lOther$last_accessed) {
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

extension UtilityExtension$Query$ME$me on Query$ME$me {
  CopyWith$Query$ME$me<Query$ME$me> get copyWith =>
      CopyWith$Query$ME$me(this, (i) => i);
}

abstract class CopyWith$Query$ME$me<TRes> {
  factory CopyWith$Query$ME$me(
    Query$ME$me instance,
    TRes Function(Query$ME$me) then,
  ) = _CopyWithImpl$Query$ME$me;

  factory CopyWith$Query$ME$me.stub(TRes res) = _CopyWithStubImpl$Query$ME$me;

  TRes call({
    String? id,
    String? email,
    bool? email_verified,
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
    String? plan,
    String? last_accessed,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ME$me<TRes> implements CopyWith$Query$ME$me<TRes> {
  _CopyWithImpl$Query$ME$me(this._instance, this._then);

  final Query$ME$me _instance;

  final TRes Function(Query$ME$me) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? email_verified = _undefined,
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
    Object? plan = _undefined,
    Object? last_accessed = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$ME$me(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      email_verified: email_verified == _undefined || email_verified == null
          ? _instance.email_verified
          : (email_verified as bool),
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
      plan: plan == _undefined || plan == null
          ? _instance.plan
          : (plan as String),
      last_accessed: last_accessed == _undefined || last_accessed == null
          ? _instance.last_accessed
          : (last_accessed as String),
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

class _CopyWithStubImpl$Query$ME$me<TRes>
    implements CopyWith$Query$ME$me<TRes> {
  _CopyWithStubImpl$Query$ME$me(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    bool? email_verified,
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
    String? plan,
    String? last_accessed,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
