import 'package:gql/ast.dart';

class Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE {
  factory Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE({
    required String id,
  }) => Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE._({r'id': id});

  Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE._(this._$data);

  factory Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<
    Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE
  >
  get copyWith => CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
    this,
    (i) => i,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE ||
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

abstract class CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<
  TRes
> {
  factory CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
    Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE instance,
    TRes Function(Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE) then,
  ) = _CopyWithImpl$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE;

  factory CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes>
    implements
        CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes> {
  _CopyWithImpl$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE _instance;

  final TRes Function(Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<
  TRes
>
    implements
        CopyWith$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
    this._res,
  );

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$SEND_USER_PHONE_VERIFICATION_CODE {
  Mutation$SEND_USER_PHONE_VERIFICATION_CODE({
    required this.sendUserPhoneVerificationCode,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SEND_USER_PHONE_VERIFICATION_CODE.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$sendUserPhoneVerificationCode =
        json['sendUserPhoneVerificationCode'];
    final l$$__typename = json['__typename'];
    return Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
      sendUserPhoneVerificationCode: (l$sendUserPhoneVerificationCode as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool sendUserPhoneVerificationCode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendUserPhoneVerificationCode = sendUserPhoneVerificationCode;
    _resultData['sendUserPhoneVerificationCode'] =
        l$sendUserPhoneVerificationCode;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendUserPhoneVerificationCode = sendUserPhoneVerificationCode;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendUserPhoneVerificationCode, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SEND_USER_PHONE_VERIFICATION_CODE ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendUserPhoneVerificationCode = sendUserPhoneVerificationCode;
    final lOther$sendUserPhoneVerificationCode =
        other.sendUserPhoneVerificationCode;
    if (l$sendUserPhoneVerificationCode !=
        lOther$sendUserPhoneVerificationCode) {
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

extension UtilityExtension$Mutation$SEND_USER_PHONE_VERIFICATION_CODE
    on Mutation$SEND_USER_PHONE_VERIFICATION_CODE {
  CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<
    Mutation$SEND_USER_PHONE_VERIFICATION_CODE
  >
  get copyWith =>
      CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(this, (i) => i);
}

abstract class CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes> {
  factory CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
    Mutation$SEND_USER_PHONE_VERIFICATION_CODE instance,
    TRes Function(Mutation$SEND_USER_PHONE_VERIFICATION_CODE) then,
  ) = _CopyWithImpl$Mutation$SEND_USER_PHONE_VERIFICATION_CODE;

  factory CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SEND_USER_PHONE_VERIFICATION_CODE;

  TRes call({bool? sendUserPhoneVerificationCode, String? $__typename});
}

class _CopyWithImpl$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes>
    implements CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes> {
  _CopyWithImpl$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
    this._instance,
    this._then,
  );

  final Mutation$SEND_USER_PHONE_VERIFICATION_CODE _instance;

  final TRes Function(Mutation$SEND_USER_PHONE_VERIFICATION_CODE) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendUserPhoneVerificationCode = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SEND_USER_PHONE_VERIFICATION_CODE(
      sendUserPhoneVerificationCode:
          sendUserPhoneVerificationCode == _undefined ||
              sendUserPhoneVerificationCode == null
          ? _instance.sendUserPhoneVerificationCode
          : (sendUserPhoneVerificationCode as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes>
    implements CopyWith$Mutation$SEND_USER_PHONE_VERIFICATION_CODE<TRes> {
  _CopyWithStubImpl$Mutation$SEND_USER_PHONE_VERIFICATION_CODE(this._res);

  TRes _res;

  call({bool? sendUserPhoneVerificationCode, String? $__typename}) => _res;
}

const documentNodeMutationSEND_USER_PHONE_VERIFICATION_CODE = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SEND_USER_PHONE_VERIFICATION_CODE'),
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
            name: NameNode(value: 'sendUserPhoneVerificationCode'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
