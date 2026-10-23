import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$INVITE_USER {
  factory Variables$Mutation$INVITE_USER({
    required String first_name,
    required String email,
    bool? send_email,
    bool? anonymous_invite,
  }) => Variables$Mutation$INVITE_USER._({
    r'first_name': first_name,
    r'email': email,
    if (send_email != null) r'send_email': send_email,
    if (anonymous_invite != null) r'anonymous_invite': anonymous_invite,
  });

  Variables$Mutation$INVITE_USER._(this._$data);

  factory Variables$Mutation$INVITE_USER.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$first_name = data['first_name'];
    result$data['first_name'] = (l$first_name as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('send_email')) {
      final l$send_email = data['send_email'];
      result$data['send_email'] = (l$send_email as bool?);
    }
    if (data.containsKey('anonymous_invite')) {
      final l$anonymous_invite = data['anonymous_invite'];
      result$data['anonymous_invite'] = (l$anonymous_invite as bool?);
    }
    return Variables$Mutation$INVITE_USER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get first_name => (_$data['first_name'] as String);

  String get email => (_$data['email'] as String);

  bool? get send_email => (_$data['send_email'] as bool?);

  bool? get anonymous_invite => (_$data['anonymous_invite'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$first_name = first_name;
    result$data['first_name'] = l$first_name;
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('send_email')) {
      final l$send_email = send_email;
      result$data['send_email'] = l$send_email;
    }
    if (_$data.containsKey('anonymous_invite')) {
      final l$anonymous_invite = anonymous_invite;
      result$data['anonymous_invite'] = l$anonymous_invite;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$INVITE_USER<Variables$Mutation$INVITE_USER>
  get copyWith => CopyWith$Variables$Mutation$INVITE_USER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$INVITE_USER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first_name = first_name;
    final lOther$first_name = other.first_name;
    if (l$first_name != lOther$first_name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$send_email = send_email;
    final lOther$send_email = other.send_email;
    if (_$data.containsKey('send_email') !=
        other._$data.containsKey('send_email')) {
      return false;
    }
    if (l$send_email != lOther$send_email) {
      return false;
    }
    final l$anonymous_invite = anonymous_invite;
    final lOther$anonymous_invite = other.anonymous_invite;
    if (_$data.containsKey('anonymous_invite') !=
        other._$data.containsKey('anonymous_invite')) {
      return false;
    }
    if (l$anonymous_invite != lOther$anonymous_invite) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first_name = first_name;
    final l$email = email;
    final l$send_email = send_email;
    final l$anonymous_invite = anonymous_invite;
    return Object.hashAll([
      l$first_name,
      l$email,
      _$data.containsKey('send_email') ? l$send_email : const {},
      _$data.containsKey('anonymous_invite') ? l$anonymous_invite : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$INVITE_USER<TRes> {
  factory CopyWith$Variables$Mutation$INVITE_USER(
    Variables$Mutation$INVITE_USER instance,
    TRes Function(Variables$Mutation$INVITE_USER) then,
  ) = _CopyWithImpl$Variables$Mutation$INVITE_USER;

  factory CopyWith$Variables$Mutation$INVITE_USER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$INVITE_USER;

  TRes call({
    String? first_name,
    String? email,
    bool? send_email,
    bool? anonymous_invite,
  });
}

class _CopyWithImpl$Variables$Mutation$INVITE_USER<TRes>
    implements CopyWith$Variables$Mutation$INVITE_USER<TRes> {
  _CopyWithImpl$Variables$Mutation$INVITE_USER(this._instance, this._then);

  final Variables$Mutation$INVITE_USER _instance;

  final TRes Function(Variables$Mutation$INVITE_USER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first_name = _undefined,
    Object? email = _undefined,
    Object? send_email = _undefined,
    Object? anonymous_invite = _undefined,
  }) => _then(
    Variables$Mutation$INVITE_USER._({
      ..._instance._$data,
      if (first_name != _undefined && first_name != null)
        'first_name': (first_name as String),
      if (email != _undefined && email != null) 'email': (email as String),
      if (send_email != _undefined) 'send_email': (send_email as bool?),
      if (anonymous_invite != _undefined)
        'anonymous_invite': (anonymous_invite as bool?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$INVITE_USER<TRes>
    implements CopyWith$Variables$Mutation$INVITE_USER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$INVITE_USER(this._res);

  TRes _res;

  call({
    String? first_name,
    String? email,
    bool? send_email,
    bool? anonymous_invite,
  }) => _res;
}

class Mutation$INVITE_USER {
  Mutation$INVITE_USER({
    required this.inviteUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$INVITE_USER.fromJson(Map<String, dynamic> json) {
    final l$inviteUser = json['inviteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$INVITE_USER(
      inviteUser: Mutation$INVITE_USER$inviteUser.fromJson(
        (l$inviteUser as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$INVITE_USER$inviteUser inviteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$inviteUser = inviteUser;
    _resultData['inviteUser'] = l$inviteUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$inviteUser = inviteUser;
    final l$$__typename = $__typename;
    return Object.hashAll([l$inviteUser, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$INVITE_USER || runtimeType != other.runtimeType) {
      return false;
    }
    final l$inviteUser = inviteUser;
    final lOther$inviteUser = other.inviteUser;
    if (l$inviteUser != lOther$inviteUser) {
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

extension UtilityExtension$Mutation$INVITE_USER on Mutation$INVITE_USER {
  CopyWith$Mutation$INVITE_USER<Mutation$INVITE_USER> get copyWith =>
      CopyWith$Mutation$INVITE_USER(this, (i) => i);
}

abstract class CopyWith$Mutation$INVITE_USER<TRes> {
  factory CopyWith$Mutation$INVITE_USER(
    Mutation$INVITE_USER instance,
    TRes Function(Mutation$INVITE_USER) then,
  ) = _CopyWithImpl$Mutation$INVITE_USER;

  factory CopyWith$Mutation$INVITE_USER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$INVITE_USER;

  TRes call({Mutation$INVITE_USER$inviteUser? inviteUser, String? $__typename});
  CopyWith$Mutation$INVITE_USER$inviteUser<TRes> get inviteUser;
}

class _CopyWithImpl$Mutation$INVITE_USER<TRes>
    implements CopyWith$Mutation$INVITE_USER<TRes> {
  _CopyWithImpl$Mutation$INVITE_USER(this._instance, this._then);

  final Mutation$INVITE_USER _instance;

  final TRes Function(Mutation$INVITE_USER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? inviteUser = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$INVITE_USER(
      inviteUser: inviteUser == _undefined || inviteUser == null
          ? _instance.inviteUser
          : (inviteUser as Mutation$INVITE_USER$inviteUser),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$INVITE_USER$inviteUser<TRes> get inviteUser {
    final local$inviteUser = _instance.inviteUser;
    return CopyWith$Mutation$INVITE_USER$inviteUser(
      local$inviteUser,
      (e) => call(inviteUser: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$INVITE_USER<TRes>
    implements CopyWith$Mutation$INVITE_USER<TRes> {
  _CopyWithStubImpl$Mutation$INVITE_USER(this._res);

  TRes _res;

  call({Mutation$INVITE_USER$inviteUser? inviteUser, String? $__typename}) =>
      _res;

  CopyWith$Mutation$INVITE_USER$inviteUser<TRes> get inviteUser =>
      CopyWith$Mutation$INVITE_USER$inviteUser.stub(_res);
}

const documentNodeMutationINVITE_USER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'INVITE_USER'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'first_name')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'email')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'send_email')),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'anonymous_invite')),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'inviteUser'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first_name'),
                value: VariableNode(name: NameNode(value: 'first_name')),
              ),
              ArgumentNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
              ArgumentNode(
                name: NameNode(value: 'send_email'),
                value: VariableNode(name: NameNode(value: 'send_email')),
              ),
              ArgumentNode(
                name: NameNode(value: 'anonymous_invite'),
                value: VariableNode(name: NameNode(value: 'anonymous_invite')),
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
                        name: NameNode(value: 'invitation_email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'status'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'reason'),
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
                        name: NameNode(value: 'invitation_email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'status'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'reason'),
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

class Mutation$INVITE_USER$inviteUser {
  Mutation$INVITE_USER$inviteUser({required this.$__typename});

  factory Mutation$INVITE_USER$inviteUser.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "User":
        return Mutation$INVITE_USER$inviteUser$$User.fromJson(json);

      case "Guest":
        return Mutation$INVITE_USER$inviteUser$$Guest.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Mutation$INVITE_USER$inviteUser(
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
    if (other is! Mutation$INVITE_USER$inviteUser ||
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

extension UtilityExtension$Mutation$INVITE_USER$inviteUser
    on Mutation$INVITE_USER$inviteUser {
  CopyWith$Mutation$INVITE_USER$inviteUser<Mutation$INVITE_USER$inviteUser>
  get copyWith => CopyWith$Mutation$INVITE_USER$inviteUser(this, (i) => i);

  _T when<_T>({
    required _T Function(Mutation$INVITE_USER$inviteUser$$User) user,
    required _T Function(Mutation$INVITE_USER$inviteUser$$Guest) guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        return user(this as Mutation$INVITE_USER$inviteUser$$User);

      case "Guest":
        return guest(this as Mutation$INVITE_USER$inviteUser$$Guest);

      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(Mutation$INVITE_USER$inviteUser$$User)? user,
    _T Function(Mutation$INVITE_USER$inviteUser$$Guest)? guest,
    required _T Function() orElse,
  }) {
    switch ($__typename) {
      case "User":
        if (user != null) {
          return user(this as Mutation$INVITE_USER$inviteUser$$User);
        } else {
          return orElse();
        }

      case "Guest":
        if (guest != null) {
          return guest(this as Mutation$INVITE_USER$inviteUser$$Guest);
        } else {
          return orElse();
        }

      default:
        return orElse();
    }
  }
}

abstract class CopyWith$Mutation$INVITE_USER$inviteUser<TRes> {
  factory CopyWith$Mutation$INVITE_USER$inviteUser(
    Mutation$INVITE_USER$inviteUser instance,
    TRes Function(Mutation$INVITE_USER$inviteUser) then,
  ) = _CopyWithImpl$Mutation$INVITE_USER$inviteUser;

  factory CopyWith$Mutation$INVITE_USER$inviteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Mutation$INVITE_USER$inviteUser<TRes>
    implements CopyWith$Mutation$INVITE_USER$inviteUser<TRes> {
  _CopyWithImpl$Mutation$INVITE_USER$inviteUser(this._instance, this._then);

  final Mutation$INVITE_USER$inviteUser _instance;

  final TRes Function(Mutation$INVITE_USER$inviteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? $__typename = _undefined}) => _then(
    Mutation$INVITE_USER$inviteUser(
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser<TRes>
    implements CopyWith$Mutation$INVITE_USER$inviteUser<TRes> {
  _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

class Mutation$INVITE_USER$inviteUser$$User
    implements Mutation$INVITE_USER$inviteUser {
  Mutation$INVITE_USER$inviteUser$$User({
    required this.id,
    required this.email,
    this.first_name,
    this.invitation_email,
    this.$__typename = 'User',
  });

  factory Mutation$INVITE_USER$inviteUser$$User.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$invitation_email = json['invitation_email'];
    final l$$__typename = json['__typename'];
    return Mutation$INVITE_USER$inviteUser$$User(
      id: (l$id as String),
      email: (l$email as String),
      first_name: (l$first_name as String?),
      invitation_email: l$invitation_email == null
          ? null
          : Mutation$INVITE_USER$inviteUser$$User$invitation_email.fromJson(
              (l$invitation_email as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? first_name;

  final Mutation$INVITE_USER$inviteUser$$User$invitation_email?
  invitation_email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$first_name = first_name;
    _resultData['first_name'] = l$first_name;
    final l$invitation_email = invitation_email;
    _resultData['invitation_email'] = l$invitation_email?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$first_name = first_name;
    final l$invitation_email = invitation_email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$first_name,
      l$invitation_email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$INVITE_USER$inviteUser$$User ||
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
    final l$invitation_email = invitation_email;
    final lOther$invitation_email = other.invitation_email;
    if (l$invitation_email != lOther$invitation_email) {
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

extension UtilityExtension$Mutation$INVITE_USER$inviteUser$$User
    on Mutation$INVITE_USER$inviteUser$$User {
  CopyWith$Mutation$INVITE_USER$inviteUser$$User<
    Mutation$INVITE_USER$inviteUser$$User
  >
  get copyWith =>
      CopyWith$Mutation$INVITE_USER$inviteUser$$User(this, (i) => i);
}

abstract class CopyWith$Mutation$INVITE_USER$inviteUser$$User<TRes> {
  factory CopyWith$Mutation$INVITE_USER$inviteUser$$User(
    Mutation$INVITE_USER$inviteUser$$User instance,
    TRes Function(Mutation$INVITE_USER$inviteUser$$User) then,
  ) = _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$User;

  factory CopyWith$Mutation$INVITE_USER$inviteUser$$User.stub(TRes res) =
      _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$User;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    Mutation$INVITE_USER$inviteUser$$User$invitation_email? invitation_email,
    String? $__typename,
  });
  CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<TRes>
  get invitation_email;
}

class _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$User<TRes>
    implements CopyWith$Mutation$INVITE_USER$inviteUser$$User<TRes> {
  _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$User(
    this._instance,
    this._then,
  );

  final Mutation$INVITE_USER$inviteUser$$User _instance;

  final TRes Function(Mutation$INVITE_USER$inviteUser$$User) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? invitation_email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$INVITE_USER$inviteUser$$User(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      first_name: first_name == _undefined
          ? _instance.first_name
          : (first_name as String?),
      invitation_email: invitation_email == _undefined
          ? _instance.invitation_email
          : (invitation_email
                as Mutation$INVITE_USER$inviteUser$$User$invitation_email?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<TRes>
  get invitation_email {
    final local$invitation_email = _instance.invitation_email;
    return local$invitation_email == null
        ? CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email(
            local$invitation_email,
            (e) => call(invitation_email: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$User<TRes>
    implements CopyWith$Mutation$INVITE_USER$inviteUser$$User<TRes> {
  _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$User(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? first_name,
    Mutation$INVITE_USER$inviteUser$$User$invitation_email? invitation_email,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<TRes>
  get invitation_email =>
      CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email.stub(
        _res,
      );
}

class Mutation$INVITE_USER$inviteUser$$User$invitation_email {
  Mutation$INVITE_USER$inviteUser$$User$invitation_email({
    required this.status,
    this.reason,
    this.$__typename = 'InvitationEmailResult',
  });

  factory Mutation$INVITE_USER$inviteUser$$User$invitation_email.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$status = json['status'];
    final l$reason = json['reason'];
    final l$$__typename = json['__typename'];
    return Mutation$INVITE_USER$inviteUser$$User$invitation_email(
      status: fromJson$Enum$InvitationEmailStatus((l$status as String)),
      reason: (l$reason as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$InvitationEmailStatus status;

  final String? reason;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = toJson$Enum$InvitationEmailStatus(l$status);
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$reason = reason;
    final l$$__typename = $__typename;
    return Object.hashAll([l$status, l$reason, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$INVITE_USER$inviteUser$$User$invitation_email ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
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

extension UtilityExtension$Mutation$INVITE_USER$inviteUser$$User$invitation_email
    on Mutation$INVITE_USER$inviteUser$$User$invitation_email {
  CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<
    Mutation$INVITE_USER$inviteUser$$User$invitation_email
  >
  get copyWith =>
      CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<
  TRes
> {
  factory CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email(
    Mutation$INVITE_USER$inviteUser$$User$invitation_email instance,
    TRes Function(Mutation$INVITE_USER$inviteUser$$User$invitation_email) then,
  ) = _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$User$invitation_email;

  factory CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$User$invitation_email;

  TRes call({
    Enum$InvitationEmailStatus? status,
    String? reason,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$User$invitation_email<TRes>
    implements
        CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<TRes> {
  _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$User$invitation_email(
    this._instance,
    this._then,
  );

  final Mutation$INVITE_USER$inviteUser$$User$invitation_email _instance;

  final TRes Function(Mutation$INVITE_USER$inviteUser$$User$invitation_email)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? reason = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$INVITE_USER$inviteUser$$User$invitation_email(
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$InvitationEmailStatus),
      reason: reason == _undefined ? _instance.reason : (reason as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$User$invitation_email<
  TRes
>
    implements
        CopyWith$Mutation$INVITE_USER$inviteUser$$User$invitation_email<TRes> {
  _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$User$invitation_email(
    this._res,
  );

  TRes _res;

  call({
    Enum$InvitationEmailStatus? status,
    String? reason,
    String? $__typename,
  }) => _res;
}

class Mutation$INVITE_USER$inviteUser$$Guest
    implements Mutation$INVITE_USER$inviteUser {
  Mutation$INVITE_USER$inviteUser$$Guest({
    required this.id,
    required this.email,
    this.first_name,
    this.invitation_email,
    this.$__typename = 'Guest',
  });

  factory Mutation$INVITE_USER$inviteUser$$Guest.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$first_name = json['first_name'];
    final l$invitation_email = json['invitation_email'];
    final l$$__typename = json['__typename'];
    return Mutation$INVITE_USER$inviteUser$$Guest(
      id: (l$id as String),
      email: (l$email as String),
      first_name: (l$first_name as String?),
      invitation_email: l$invitation_email == null
          ? null
          : Mutation$INVITE_USER$inviteUser$$Guest$invitation_email.fromJson(
              (l$invitation_email as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? first_name;

  final Mutation$INVITE_USER$inviteUser$$Guest$invitation_email?
  invitation_email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$first_name = first_name;
    _resultData['first_name'] = l$first_name;
    final l$invitation_email = invitation_email;
    _resultData['invitation_email'] = l$invitation_email?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$first_name = first_name;
    final l$invitation_email = invitation_email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$first_name,
      l$invitation_email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$INVITE_USER$inviteUser$$Guest ||
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
    final l$invitation_email = invitation_email;
    final lOther$invitation_email = other.invitation_email;
    if (l$invitation_email != lOther$invitation_email) {
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

extension UtilityExtension$Mutation$INVITE_USER$inviteUser$$Guest
    on Mutation$INVITE_USER$inviteUser$$Guest {
  CopyWith$Mutation$INVITE_USER$inviteUser$$Guest<
    Mutation$INVITE_USER$inviteUser$$Guest
  >
  get copyWith =>
      CopyWith$Mutation$INVITE_USER$inviteUser$$Guest(this, (i) => i);
}

abstract class CopyWith$Mutation$INVITE_USER$inviteUser$$Guest<TRes> {
  factory CopyWith$Mutation$INVITE_USER$inviteUser$$Guest(
    Mutation$INVITE_USER$inviteUser$$Guest instance,
    TRes Function(Mutation$INVITE_USER$inviteUser$$Guest) then,
  ) = _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$Guest;

  factory CopyWith$Mutation$INVITE_USER$inviteUser$$Guest.stub(TRes res) =
      _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$Guest;

  TRes call({
    String? id,
    String? email,
    String? first_name,
    Mutation$INVITE_USER$inviteUser$$Guest$invitation_email? invitation_email,
    String? $__typename,
  });
  CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<TRes>
  get invitation_email;
}

class _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$Guest<TRes>
    implements CopyWith$Mutation$INVITE_USER$inviteUser$$Guest<TRes> {
  _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$Guest(
    this._instance,
    this._then,
  );

  final Mutation$INVITE_USER$inviteUser$$Guest _instance;

  final TRes Function(Mutation$INVITE_USER$inviteUser$$Guest) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? first_name = _undefined,
    Object? invitation_email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$INVITE_USER$inviteUser$$Guest(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      first_name: first_name == _undefined
          ? _instance.first_name
          : (first_name as String?),
      invitation_email: invitation_email == _undefined
          ? _instance.invitation_email
          : (invitation_email
                as Mutation$INVITE_USER$inviteUser$$Guest$invitation_email?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<TRes>
  get invitation_email {
    final local$invitation_email = _instance.invitation_email;
    return local$invitation_email == null
        ? CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
            local$invitation_email,
            (e) => call(invitation_email: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$Guest<TRes>
    implements CopyWith$Mutation$INVITE_USER$inviteUser$$Guest<TRes> {
  _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$Guest(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? first_name,
    Mutation$INVITE_USER$inviteUser$$Guest$invitation_email? invitation_email,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<TRes>
  get invitation_email =>
      CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email.stub(
        _res,
      );
}

class Mutation$INVITE_USER$inviteUser$$Guest$invitation_email {
  Mutation$INVITE_USER$inviteUser$$Guest$invitation_email({
    required this.status,
    this.reason,
    this.$__typename = 'InvitationEmailResult',
  });

  factory Mutation$INVITE_USER$inviteUser$$Guest$invitation_email.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$status = json['status'];
    final l$reason = json['reason'];
    final l$$__typename = json['__typename'];
    return Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
      status: fromJson$Enum$InvitationEmailStatus((l$status as String)),
      reason: (l$reason as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$InvitationEmailStatus status;

  final String? reason;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$status = status;
    _resultData['status'] = toJson$Enum$InvitationEmailStatus(l$status);
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$status = status;
    final l$reason = reason;
    final l$$__typename = $__typename;
    return Object.hashAll([l$status, l$reason, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$INVITE_USER$inviteUser$$Guest$invitation_email ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
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

extension UtilityExtension$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email
    on Mutation$INVITE_USER$inviteUser$$Guest$invitation_email {
  CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<
    Mutation$INVITE_USER$inviteUser$$Guest$invitation_email
  >
  get copyWith =>
      CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<
  TRes
> {
  factory CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
    Mutation$INVITE_USER$inviteUser$$Guest$invitation_email instance,
    TRes Function(Mutation$INVITE_USER$inviteUser$$Guest$invitation_email) then,
  ) = _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email;

  factory CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email;

  TRes call({
    Enum$InvitationEmailStatus? status,
    String? reason,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<
  TRes
>
    implements
        CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<TRes> {
  _CopyWithImpl$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
    this._instance,
    this._then,
  );

  final Mutation$INVITE_USER$inviteUser$$Guest$invitation_email _instance;

  final TRes Function(Mutation$INVITE_USER$inviteUser$$Guest$invitation_email)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? status = _undefined,
    Object? reason = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$InvitationEmailStatus),
      reason: reason == _undefined ? _instance.reason : (reason as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<
  TRes
>
    implements
        CopyWith$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email<TRes> {
  _CopyWithStubImpl$Mutation$INVITE_USER$inviteUser$$Guest$invitation_email(
    this._res,
  );

  TRes _res;

  call({
    Enum$InvitationEmailStatus? status,
    String? reason,
    String? $__typename,
  }) => _res;
}
