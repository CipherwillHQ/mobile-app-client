import 'package:gql/ast.dart';

class Variables$Mutation$VERIFY_USER_PHONE_NUMBER {
  factory Variables$Mutation$VERIFY_USER_PHONE_NUMBER({
    required String id,
    required String otp,
  }) => Variables$Mutation$VERIFY_USER_PHONE_NUMBER._({r'id': id, r'otp': otp});

  Variables$Mutation$VERIFY_USER_PHONE_NUMBER._(this._$data);

  factory Variables$Mutation$VERIFY_USER_PHONE_NUMBER.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$otp = data['otp'];
    result$data['otp'] = (l$otp as String);
    return Variables$Mutation$VERIFY_USER_PHONE_NUMBER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get otp => (_$data['otp'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$otp = otp;
    result$data['otp'] = l$otp;
    return result$data;
  }

  CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER<
    Variables$Mutation$VERIFY_USER_PHONE_NUMBER
  >
  get copyWith =>
      CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$VERIFY_USER_PHONE_NUMBER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$otp = otp;
    final lOther$otp = other.otp;
    if (l$otp != lOther$otp) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$otp = otp;
    return Object.hashAll([l$id, l$otp]);
  }
}

abstract class CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER<TRes> {
  factory CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER(
    Variables$Mutation$VERIFY_USER_PHONE_NUMBER instance,
    TRes Function(Variables$Mutation$VERIFY_USER_PHONE_NUMBER) then,
  ) = _CopyWithImpl$Variables$Mutation$VERIFY_USER_PHONE_NUMBER;

  factory CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$VERIFY_USER_PHONE_NUMBER;

  TRes call({String? id, String? otp});
}

class _CopyWithImpl$Variables$Mutation$VERIFY_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER<TRes> {
  _CopyWithImpl$Variables$Mutation$VERIFY_USER_PHONE_NUMBER(
    this._instance,
    this._then,
  );

  final Variables$Mutation$VERIFY_USER_PHONE_NUMBER _instance;

  final TRes Function(Variables$Mutation$VERIFY_USER_PHONE_NUMBER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? otp = _undefined}) => _then(
    Variables$Mutation$VERIFY_USER_PHONE_NUMBER._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (otp != _undefined && otp != null) 'otp': (otp as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$VERIFY_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Variables$Mutation$VERIFY_USER_PHONE_NUMBER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$VERIFY_USER_PHONE_NUMBER(this._res);

  TRes _res;

  call({String? id, String? otp}) => _res;
}

class Mutation$VERIFY_USER_PHONE_NUMBER {
  Mutation$VERIFY_USER_PHONE_NUMBER({
    required this.verifyUserPhoneNumber,
    this.$__typename = 'Mutation',
  });

  factory Mutation$VERIFY_USER_PHONE_NUMBER.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$verifyUserPhoneNumber = json['verifyUserPhoneNumber'];
    final l$$__typename = json['__typename'];
    return Mutation$VERIFY_USER_PHONE_NUMBER(
      verifyUserPhoneNumber: (l$verifyUserPhoneNumber as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool verifyUserPhoneNumber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$verifyUserPhoneNumber = verifyUserPhoneNumber;
    _resultData['verifyUserPhoneNumber'] = l$verifyUserPhoneNumber;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$verifyUserPhoneNumber = verifyUserPhoneNumber;
    final l$$__typename = $__typename;
    return Object.hashAll([l$verifyUserPhoneNumber, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$VERIFY_USER_PHONE_NUMBER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$verifyUserPhoneNumber = verifyUserPhoneNumber;
    final lOther$verifyUserPhoneNumber = other.verifyUserPhoneNumber;
    if (l$verifyUserPhoneNumber != lOther$verifyUserPhoneNumber) {
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

extension UtilityExtension$Mutation$VERIFY_USER_PHONE_NUMBER
    on Mutation$VERIFY_USER_PHONE_NUMBER {
  CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER<Mutation$VERIFY_USER_PHONE_NUMBER>
  get copyWith => CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER(this, (i) => i);
}

abstract class CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER<TRes> {
  factory CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER(
    Mutation$VERIFY_USER_PHONE_NUMBER instance,
    TRes Function(Mutation$VERIFY_USER_PHONE_NUMBER) then,
  ) = _CopyWithImpl$Mutation$VERIFY_USER_PHONE_NUMBER;

  factory CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$VERIFY_USER_PHONE_NUMBER;

  TRes call({bool? verifyUserPhoneNumber, String? $__typename});
}

class _CopyWithImpl$Mutation$VERIFY_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER<TRes> {
  _CopyWithImpl$Mutation$VERIFY_USER_PHONE_NUMBER(this._instance, this._then);

  final Mutation$VERIFY_USER_PHONE_NUMBER _instance;

  final TRes Function(Mutation$VERIFY_USER_PHONE_NUMBER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? verifyUserPhoneNumber = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$VERIFY_USER_PHONE_NUMBER(
      verifyUserPhoneNumber:
          verifyUserPhoneNumber == _undefined || verifyUserPhoneNumber == null
          ? _instance.verifyUserPhoneNumber
          : (verifyUserPhoneNumber as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$VERIFY_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Mutation$VERIFY_USER_PHONE_NUMBER<TRes> {
  _CopyWithStubImpl$Mutation$VERIFY_USER_PHONE_NUMBER(this._res);

  TRes _res;

  call({bool? verifyUserPhoneNumber, String? $__typename}) => _res;
}

const documentNodeMutationVERIFY_USER_PHONE_NUMBER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'VERIFY_USER_PHONE_NUMBER'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'otp')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'verifyUserPhoneNumber'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'otp'),
                value: VariableNode(name: NameNode(value: 'otp')),
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
