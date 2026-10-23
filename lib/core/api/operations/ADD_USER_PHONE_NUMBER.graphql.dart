import 'package:gql/ast.dart';

class Variables$Mutation$ADD_USER_PHONE_NUMBER {
  factory Variables$Mutation$ADD_USER_PHONE_NUMBER({
    required String phone_code,
    required String phone_num,
  }) => Variables$Mutation$ADD_USER_PHONE_NUMBER._({
    r'phone_code': phone_code,
    r'phone_num': phone_num,
  });

  Variables$Mutation$ADD_USER_PHONE_NUMBER._(this._$data);

  factory Variables$Mutation$ADD_USER_PHONE_NUMBER.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$phone_code = data['phone_code'];
    result$data['phone_code'] = (l$phone_code as String);
    final l$phone_num = data['phone_num'];
    result$data['phone_num'] = (l$phone_num as String);
    return Variables$Mutation$ADD_USER_PHONE_NUMBER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phone_code => (_$data['phone_code'] as String);

  String get phone_num => (_$data['phone_num'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phone_code = phone_code;
    result$data['phone_code'] = l$phone_code;
    final l$phone_num = phone_num;
    result$data['phone_num'] = l$phone_num;
    return result$data;
  }

  CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER<
    Variables$Mutation$ADD_USER_PHONE_NUMBER
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ADD_USER_PHONE_NUMBER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phone_code = phone_code;
    final lOther$phone_code = other.phone_code;
    if (l$phone_code != lOther$phone_code) {
      return false;
    }
    final l$phone_num = phone_num;
    final lOther$phone_num = other.phone_num;
    if (l$phone_num != lOther$phone_num) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phone_code = phone_code;
    final l$phone_num = phone_num;
    return Object.hashAll([l$phone_code, l$phone_num]);
  }
}

abstract class CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER<TRes> {
  factory CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER(
    Variables$Mutation$ADD_USER_PHONE_NUMBER instance,
    TRes Function(Variables$Mutation$ADD_USER_PHONE_NUMBER) then,
  ) = _CopyWithImpl$Variables$Mutation$ADD_USER_PHONE_NUMBER;

  factory CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ADD_USER_PHONE_NUMBER;

  TRes call({String? phone_code, String? phone_num});
}

class _CopyWithImpl$Variables$Mutation$ADD_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER<TRes> {
  _CopyWithImpl$Variables$Mutation$ADD_USER_PHONE_NUMBER(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ADD_USER_PHONE_NUMBER _instance;

  final TRes Function(Variables$Mutation$ADD_USER_PHONE_NUMBER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? phone_code = _undefined,
    Object? phone_num = _undefined,
  }) => _then(
    Variables$Mutation$ADD_USER_PHONE_NUMBER._({
      ..._instance._$data,
      if (phone_code != _undefined && phone_code != null)
        'phone_code': (phone_code as String),
      if (phone_num != _undefined && phone_num != null)
        'phone_num': (phone_num as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ADD_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Variables$Mutation$ADD_USER_PHONE_NUMBER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ADD_USER_PHONE_NUMBER(this._res);

  TRes _res;

  call({String? phone_code, String? phone_num}) => _res;
}

class Mutation$ADD_USER_PHONE_NUMBER {
  Mutation$ADD_USER_PHONE_NUMBER({
    required this.addUserPhoneNumber,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ADD_USER_PHONE_NUMBER.fromJson(Map<String, dynamic> json) {
    final l$addUserPhoneNumber = json['addUserPhoneNumber'];
    final l$$__typename = json['__typename'];
    return Mutation$ADD_USER_PHONE_NUMBER(
      addUserPhoneNumber: (l$addUserPhoneNumber as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool addUserPhoneNumber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addUserPhoneNumber = addUserPhoneNumber;
    _resultData['addUserPhoneNumber'] = l$addUserPhoneNumber;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addUserPhoneNumber = addUserPhoneNumber;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addUserPhoneNumber, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ADD_USER_PHONE_NUMBER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addUserPhoneNumber = addUserPhoneNumber;
    final lOther$addUserPhoneNumber = other.addUserPhoneNumber;
    if (l$addUserPhoneNumber != lOther$addUserPhoneNumber) {
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

extension UtilityExtension$Mutation$ADD_USER_PHONE_NUMBER
    on Mutation$ADD_USER_PHONE_NUMBER {
  CopyWith$Mutation$ADD_USER_PHONE_NUMBER<Mutation$ADD_USER_PHONE_NUMBER>
  get copyWith => CopyWith$Mutation$ADD_USER_PHONE_NUMBER(this, (i) => i);
}

abstract class CopyWith$Mutation$ADD_USER_PHONE_NUMBER<TRes> {
  factory CopyWith$Mutation$ADD_USER_PHONE_NUMBER(
    Mutation$ADD_USER_PHONE_NUMBER instance,
    TRes Function(Mutation$ADD_USER_PHONE_NUMBER) then,
  ) = _CopyWithImpl$Mutation$ADD_USER_PHONE_NUMBER;

  factory CopyWith$Mutation$ADD_USER_PHONE_NUMBER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ADD_USER_PHONE_NUMBER;

  TRes call({bool? addUserPhoneNumber, String? $__typename});
}

class _CopyWithImpl$Mutation$ADD_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Mutation$ADD_USER_PHONE_NUMBER<TRes> {
  _CopyWithImpl$Mutation$ADD_USER_PHONE_NUMBER(this._instance, this._then);

  final Mutation$ADD_USER_PHONE_NUMBER _instance;

  final TRes Function(Mutation$ADD_USER_PHONE_NUMBER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addUserPhoneNumber = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ADD_USER_PHONE_NUMBER(
      addUserPhoneNumber:
          addUserPhoneNumber == _undefined || addUserPhoneNumber == null
          ? _instance.addUserPhoneNumber
          : (addUserPhoneNumber as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ADD_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Mutation$ADD_USER_PHONE_NUMBER<TRes> {
  _CopyWithStubImpl$Mutation$ADD_USER_PHONE_NUMBER(this._res);

  TRes _res;

  call({bool? addUserPhoneNumber, String? $__typename}) => _res;
}

const documentNodeMutationADD_USER_PHONE_NUMBER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ADD_USER_PHONE_NUMBER'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'phone_code')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'phone_num')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'addUserPhoneNumber'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'phone_code'),
                value: VariableNode(name: NameNode(value: 'phone_code')),
              ),
              ArgumentNode(
                name: NameNode(value: 'phone_num'),
                value: VariableNode(name: NameNode(value: 'phone_num')),
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
