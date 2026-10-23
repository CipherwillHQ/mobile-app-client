import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY {
  factory Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY({
    required String beneficiary_id,
  }) => Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY._({
    r'beneficiary_id': beneficiary_id,
  });

  Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY._(this._$data);

  factory Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$beneficiary_id = data['beneficiary_id'];
    result$data['beneficiary_id'] = (l$beneficiary_id as String);
    return Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get beneficiary_id => (_$data['beneficiary_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$beneficiary_id = beneficiary_id;
    result$data['beneficiary_id'] = l$beneficiary_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<
    Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY
  >
  get copyWith => CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
    this,
    (i) => i,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (l$beneficiary_id != lOther$beneficiary_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$beneficiary_id = beneficiary_id;
    return Object.hashAll([l$beneficiary_id]);
  }
}

abstract class CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<
  TRes
> {
  factory CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
    Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY instance,
    TRes Function(Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY;

  factory CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY;

  TRes call({String? beneficiary_id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes>
    implements
        CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY _instance;

  final TRes Function(Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? beneficiary_id = _undefined}) => _then(
    Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY._({
      ..._instance._$data,
      if (beneficiary_id != _undefined && beneficiary_id != null)
        'beneficiary_id': (beneficiary_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes>
    implements
        CopyWith$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
    this._res,
  );

  TRes _res;

  call({String? beneficiary_id}) => _res;
}

class Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY {
  Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY({
    this.deleteAllKeysForBeneficiary,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$deleteAllKeysForBeneficiary = json['deleteAllKeysForBeneficiary'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
      deleteAllKeysForBeneficiary: (l$deleteAllKeysForBeneficiary as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleteAllKeysForBeneficiary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteAllKeysForBeneficiary = deleteAllKeysForBeneficiary;
    _resultData['deleteAllKeysForBeneficiary'] = l$deleteAllKeysForBeneficiary;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteAllKeysForBeneficiary = deleteAllKeysForBeneficiary;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteAllKeysForBeneficiary, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteAllKeysForBeneficiary = deleteAllKeysForBeneficiary;
    final lOther$deleteAllKeysForBeneficiary =
        other.deleteAllKeysForBeneficiary;
    if (l$deleteAllKeysForBeneficiary != lOther$deleteAllKeysForBeneficiary) {
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

extension UtilityExtension$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY
    on Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY {
  CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<
    Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes> {
  factory CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
    Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY instance,
    TRes Function(Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY) then,
  ) = _CopyWithImpl$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY;

  factory CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY;

  TRes call({bool? deleteAllKeysForBeneficiary, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes>
    implements CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes> {
  _CopyWithImpl$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY _instance;

  final TRes Function(Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteAllKeysForBeneficiary = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(
      deleteAllKeysForBeneficiary: deleteAllKeysForBeneficiary == _undefined
          ? _instance.deleteAllKeysForBeneficiary
          : (deleteAllKeysForBeneficiary as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes>
    implements CopyWith$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_ALL_KEYS_FOR_BENEFICIARY(this._res);

  TRes _res;

  call({bool? deleteAllKeysForBeneficiary, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_ALL_KEYS_FOR_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_ALL_KEYS_FOR_BENEFICIARY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'beneficiary_id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteAllKeysForBeneficiary'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'beneficiary_id'),
                value: VariableNode(name: NameNode(value: 'beneficiary_id')),
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
