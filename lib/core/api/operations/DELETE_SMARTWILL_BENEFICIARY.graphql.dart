import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY {
  factory Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY({
    required String id,
  }) => Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY._({r'id': id});

  Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY._(this._$data);

  factory Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY<
    Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY ||
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

abstract class CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY(
    Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY instance,
    TRes Function(Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY;

  factory CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY _instance;

  final TRes Function(Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_SMARTWILL_BENEFICIARY(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DELETE_SMARTWILL_BENEFICIARY {
  Mutation$DELETE_SMARTWILL_BENEFICIARY({
    this.deleteSmartWillBeneficiary,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_SMARTWILL_BENEFICIARY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$deleteSmartWillBeneficiary = json['deleteSmartWillBeneficiary'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_SMARTWILL_BENEFICIARY(
      deleteSmartWillBeneficiary: (l$deleteSmartWillBeneficiary as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? deleteSmartWillBeneficiary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteSmartWillBeneficiary = deleteSmartWillBeneficiary;
    _resultData['deleteSmartWillBeneficiary'] = l$deleteSmartWillBeneficiary;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteSmartWillBeneficiary = deleteSmartWillBeneficiary;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteSmartWillBeneficiary, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_SMARTWILL_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteSmartWillBeneficiary = deleteSmartWillBeneficiary;
    final lOther$deleteSmartWillBeneficiary = other.deleteSmartWillBeneficiary;
    if (l$deleteSmartWillBeneficiary != lOther$deleteSmartWillBeneficiary) {
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

extension UtilityExtension$Mutation$DELETE_SMARTWILL_BENEFICIARY
    on Mutation$DELETE_SMARTWILL_BENEFICIARY {
  CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY<
    Mutation$DELETE_SMARTWILL_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes> {
  factory CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY(
    Mutation$DELETE_SMARTWILL_BENEFICIARY instance,
    TRes Function(Mutation$DELETE_SMARTWILL_BENEFICIARY) then,
  ) = _CopyWithImpl$Mutation$DELETE_SMARTWILL_BENEFICIARY;

  factory CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_SMARTWILL_BENEFICIARY;

  TRes call({String? deleteSmartWillBeneficiary, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithImpl$Mutation$DELETE_SMARTWILL_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Mutation$DELETE_SMARTWILL_BENEFICIARY _instance;

  final TRes Function(Mutation$DELETE_SMARTWILL_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteSmartWillBeneficiary = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_SMARTWILL_BENEFICIARY(
      deleteSmartWillBeneficiary: deleteSmartWillBeneficiary == _undefined
          ? _instance.deleteSmartWillBeneficiary
          : (deleteSmartWillBeneficiary as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Mutation$DELETE_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_SMARTWILL_BENEFICIARY(this._res);

  TRes _res;

  call({String? deleteSmartWillBeneficiary, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_SMARTWILL_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_SMARTWILL_BENEFICIARY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteSmartWillBeneficiary'),
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
