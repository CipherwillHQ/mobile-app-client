import 'package:gql/ast.dart';

class Variables$Mutation$REQUEST_PASSWORD_RESET {
  factory Variables$Mutation$REQUEST_PASSWORD_RESET({required String email}) =>
      Variables$Mutation$REQUEST_PASSWORD_RESET._({r'email': email});

  Variables$Mutation$REQUEST_PASSWORD_RESET._(this._$data);

  factory Variables$Mutation$REQUEST_PASSWORD_RESET.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    return Variables$Mutation$REQUEST_PASSWORD_RESET._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    return result$data;
  }

  CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET<
    Variables$Mutation$REQUEST_PASSWORD_RESET
  >
  get copyWith =>
      CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$REQUEST_PASSWORD_RESET ||
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

abstract class CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET<TRes> {
  factory CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET(
    Variables$Mutation$REQUEST_PASSWORD_RESET instance,
    TRes Function(Variables$Mutation$REQUEST_PASSWORD_RESET) then,
  ) = _CopyWithImpl$Variables$Mutation$REQUEST_PASSWORD_RESET;

  factory CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$REQUEST_PASSWORD_RESET;

  TRes call({String? email});
}

class _CopyWithImpl$Variables$Mutation$REQUEST_PASSWORD_RESET<TRes>
    implements CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET<TRes> {
  _CopyWithImpl$Variables$Mutation$REQUEST_PASSWORD_RESET(
    this._instance,
    this._then,
  );

  final Variables$Mutation$REQUEST_PASSWORD_RESET _instance;

  final TRes Function(Variables$Mutation$REQUEST_PASSWORD_RESET) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined}) => _then(
    Variables$Mutation$REQUEST_PASSWORD_RESET._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$REQUEST_PASSWORD_RESET<TRes>
    implements CopyWith$Variables$Mutation$REQUEST_PASSWORD_RESET<TRes> {
  _CopyWithStubImpl$Variables$Mutation$REQUEST_PASSWORD_RESET(this._res);

  TRes _res;

  call({String? email}) => _res;
}

class Mutation$REQUEST_PASSWORD_RESET {
  Mutation$REQUEST_PASSWORD_RESET({
    required this.requestPasswordReset,
    this.$__typename = 'Mutation',
  });

  factory Mutation$REQUEST_PASSWORD_RESET.fromJson(Map<String, dynamic> json) {
    final l$requestPasswordReset = json['requestPasswordReset'];
    final l$$__typename = json['__typename'];
    return Mutation$REQUEST_PASSWORD_RESET(
      requestPasswordReset:
          Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset.fromJson(
            (l$requestPasswordReset as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset
  requestPasswordReset;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestPasswordReset = requestPasswordReset;
    _resultData['requestPasswordReset'] = l$requestPasswordReset.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestPasswordReset = requestPasswordReset;
    final l$$__typename = $__typename;
    return Object.hashAll([l$requestPasswordReset, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REQUEST_PASSWORD_RESET ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestPasswordReset = requestPasswordReset;
    final lOther$requestPasswordReset = other.requestPasswordReset;
    if (l$requestPasswordReset != lOther$requestPasswordReset) {
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

extension UtilityExtension$Mutation$REQUEST_PASSWORD_RESET
    on Mutation$REQUEST_PASSWORD_RESET {
  CopyWith$Mutation$REQUEST_PASSWORD_RESET<Mutation$REQUEST_PASSWORD_RESET>
  get copyWith => CopyWith$Mutation$REQUEST_PASSWORD_RESET(this, (i) => i);
}

abstract class CopyWith$Mutation$REQUEST_PASSWORD_RESET<TRes> {
  factory CopyWith$Mutation$REQUEST_PASSWORD_RESET(
    Mutation$REQUEST_PASSWORD_RESET instance,
    TRes Function(Mutation$REQUEST_PASSWORD_RESET) then,
  ) = _CopyWithImpl$Mutation$REQUEST_PASSWORD_RESET;

  factory CopyWith$Mutation$REQUEST_PASSWORD_RESET.stub(TRes res) =
      _CopyWithStubImpl$Mutation$REQUEST_PASSWORD_RESET;

  TRes call({
    Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset? requestPasswordReset,
    String? $__typename,
  });
  CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<TRes>
  get requestPasswordReset;
}

class _CopyWithImpl$Mutation$REQUEST_PASSWORD_RESET<TRes>
    implements CopyWith$Mutation$REQUEST_PASSWORD_RESET<TRes> {
  _CopyWithImpl$Mutation$REQUEST_PASSWORD_RESET(this._instance, this._then);

  final Mutation$REQUEST_PASSWORD_RESET _instance;

  final TRes Function(Mutation$REQUEST_PASSWORD_RESET) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? requestPasswordReset = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REQUEST_PASSWORD_RESET(
      requestPasswordReset:
          requestPasswordReset == _undefined || requestPasswordReset == null
          ? _instance.requestPasswordReset
          : (requestPasswordReset
                as Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<TRes>
  get requestPasswordReset {
    final local$requestPasswordReset = _instance.requestPasswordReset;
    return CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
      local$requestPasswordReset,
      (e) => call(requestPasswordReset: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$REQUEST_PASSWORD_RESET<TRes>
    implements CopyWith$Mutation$REQUEST_PASSWORD_RESET<TRes> {
  _CopyWithStubImpl$Mutation$REQUEST_PASSWORD_RESET(this._res);

  TRes _res;

  call({
    Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset? requestPasswordReset,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<TRes>
  get requestPasswordReset =>
      CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset.stub(_res);
}

const documentNodeMutationREQUEST_PASSWORD_RESET = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'REQUEST_PASSWORD_RESET'),
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
            name: NameNode(value: 'requestPasswordReset'),
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
                FieldNode(
                  name: NameNode(value: 'sent'),
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
  ],
);

class Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset {
  Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset({
    required this.sent,
    this.reason,
    this.$__typename = 'EmailSendResult',
  });

  factory Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$sent = json['sent'];
    final l$reason = json['reason'];
    final l$$__typename = json['__typename'];
    return Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
      sent: (l$sent as bool),
      reason: (l$reason as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool sent;

  final String? reason;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sent = sent;
    _resultData['sent'] = l$sent;
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sent = sent;
    final l$reason = reason;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sent, l$reason, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sent = sent;
    final lOther$sent = other.sent;
    if (l$sent != lOther$sent) {
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

extension UtilityExtension$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset
    on Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset {
  CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<
    Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset
  >
  get copyWith => CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<
  TRes
> {
  factory CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
    Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset instance,
    TRes Function(Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset) then,
  ) = _CopyWithImpl$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset;

  factory CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset;

  TRes call({bool? sent, String? reason, String? $__typename});
}

class _CopyWithImpl$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<TRes>
    implements
        CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<TRes> {
  _CopyWithImpl$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
    this._instance,
    this._then,
  );

  final Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset _instance;

  final TRes Function(Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sent = _undefined,
    Object? reason = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
      sent: sent == _undefined || sent == null
          ? _instance.sent
          : (sent as bool),
      reason: reason == _undefined ? _instance.reason : (reason as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<
  TRes
>
    implements
        CopyWith$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset<TRes> {
  _CopyWithStubImpl$Mutation$REQUEST_PASSWORD_RESET$requestPasswordReset(
    this._res,
  );

  TRes _res;

  call({bool? sent, String? reason, String? $__typename}) => _res;
}
