import 'package:gql/ast.dart';

class Variables$Mutation$REMOVE_USER_PHONE_NUMBER {
  factory Variables$Mutation$REMOVE_USER_PHONE_NUMBER({required String id}) =>
      Variables$Mutation$REMOVE_USER_PHONE_NUMBER._({r'id': id});

  Variables$Mutation$REMOVE_USER_PHONE_NUMBER._(this._$data);

  factory Variables$Mutation$REMOVE_USER_PHONE_NUMBER.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$REMOVE_USER_PHONE_NUMBER._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER<
    Variables$Mutation$REMOVE_USER_PHONE_NUMBER
  >
  get copyWith =>
      CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$REMOVE_USER_PHONE_NUMBER ||
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

abstract class CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER<TRes> {
  factory CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER(
    Variables$Mutation$REMOVE_USER_PHONE_NUMBER instance,
    TRes Function(Variables$Mutation$REMOVE_USER_PHONE_NUMBER) then,
  ) = _CopyWithImpl$Variables$Mutation$REMOVE_USER_PHONE_NUMBER;

  factory CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$REMOVE_USER_PHONE_NUMBER;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$REMOVE_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER<TRes> {
  _CopyWithImpl$Variables$Mutation$REMOVE_USER_PHONE_NUMBER(
    this._instance,
    this._then,
  );

  final Variables$Mutation$REMOVE_USER_PHONE_NUMBER _instance;

  final TRes Function(Variables$Mutation$REMOVE_USER_PHONE_NUMBER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$REMOVE_USER_PHONE_NUMBER._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$REMOVE_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Variables$Mutation$REMOVE_USER_PHONE_NUMBER<TRes> {
  _CopyWithStubImpl$Variables$Mutation$REMOVE_USER_PHONE_NUMBER(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$REMOVE_USER_PHONE_NUMBER {
  Mutation$REMOVE_USER_PHONE_NUMBER({
    required this.removeUserPhoneNumber,
    this.$__typename = 'Mutation',
  });

  factory Mutation$REMOVE_USER_PHONE_NUMBER.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$removeUserPhoneNumber = json['removeUserPhoneNumber'];
    final l$$__typename = json['__typename'];
    return Mutation$REMOVE_USER_PHONE_NUMBER(
      removeUserPhoneNumber: (l$removeUserPhoneNumber as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool removeUserPhoneNumber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$removeUserPhoneNumber = removeUserPhoneNumber;
    _resultData['removeUserPhoneNumber'] = l$removeUserPhoneNumber;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$removeUserPhoneNumber = removeUserPhoneNumber;
    final l$$__typename = $__typename;
    return Object.hashAll([l$removeUserPhoneNumber, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REMOVE_USER_PHONE_NUMBER ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$removeUserPhoneNumber = removeUserPhoneNumber;
    final lOther$removeUserPhoneNumber = other.removeUserPhoneNumber;
    if (l$removeUserPhoneNumber != lOther$removeUserPhoneNumber) {
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

extension UtilityExtension$Mutation$REMOVE_USER_PHONE_NUMBER
    on Mutation$REMOVE_USER_PHONE_NUMBER {
  CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER<Mutation$REMOVE_USER_PHONE_NUMBER>
  get copyWith => CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER(this, (i) => i);
}

abstract class CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER<TRes> {
  factory CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER(
    Mutation$REMOVE_USER_PHONE_NUMBER instance,
    TRes Function(Mutation$REMOVE_USER_PHONE_NUMBER) then,
  ) = _CopyWithImpl$Mutation$REMOVE_USER_PHONE_NUMBER;

  factory CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER.stub(TRes res) =
      _CopyWithStubImpl$Mutation$REMOVE_USER_PHONE_NUMBER;

  TRes call({bool? removeUserPhoneNumber, String? $__typename});
}

class _CopyWithImpl$Mutation$REMOVE_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER<TRes> {
  _CopyWithImpl$Mutation$REMOVE_USER_PHONE_NUMBER(this._instance, this._then);

  final Mutation$REMOVE_USER_PHONE_NUMBER _instance;

  final TRes Function(Mutation$REMOVE_USER_PHONE_NUMBER) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? removeUserPhoneNumber = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REMOVE_USER_PHONE_NUMBER(
      removeUserPhoneNumber:
          removeUserPhoneNumber == _undefined || removeUserPhoneNumber == null
          ? _instance.removeUserPhoneNumber
          : (removeUserPhoneNumber as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$REMOVE_USER_PHONE_NUMBER<TRes>
    implements CopyWith$Mutation$REMOVE_USER_PHONE_NUMBER<TRes> {
  _CopyWithStubImpl$Mutation$REMOVE_USER_PHONE_NUMBER(this._res);

  TRes _res;

  call({bool? removeUserPhoneNumber, String? $__typename}) => _res;
}

const documentNodeMutationREMOVE_USER_PHONE_NUMBER = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'REMOVE_USER_PHONE_NUMBER'),
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
            name: NameNode(value: 'removeUserPhoneNumber'),
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
