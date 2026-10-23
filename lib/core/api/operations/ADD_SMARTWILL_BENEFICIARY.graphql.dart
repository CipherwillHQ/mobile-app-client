import 'package:gql/ast.dart';

class Variables$Mutation$ADD_SMARTWILL_BENEFICIARY {
  factory Variables$Mutation$ADD_SMARTWILL_BENEFICIARY({required String id}) =>
      Variables$Mutation$ADD_SMARTWILL_BENEFICIARY._({r'id': id});

  Variables$Mutation$ADD_SMARTWILL_BENEFICIARY._(this._$data);

  factory Variables$Mutation$ADD_SMARTWILL_BENEFICIARY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$ADD_SMARTWILL_BENEFICIARY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY<
    Variables$Mutation$ADD_SMARTWILL_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ADD_SMARTWILL_BENEFICIARY ||
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

abstract class CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes> {
  factory CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY(
    Variables$Mutation$ADD_SMARTWILL_BENEFICIARY instance,
    TRes Function(Variables$Mutation$ADD_SMARTWILL_BENEFICIARY) then,
  ) = _CopyWithImpl$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY;

  factory CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithImpl$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ADD_SMARTWILL_BENEFICIARY _instance;

  final TRes Function(Variables$Mutation$ADD_SMARTWILL_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$ADD_SMARTWILL_BENEFICIARY._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ADD_SMARTWILL_BENEFICIARY(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$ADD_SMARTWILL_BENEFICIARY {
  Mutation$ADD_SMARTWILL_BENEFICIARY({
    this.addSmartWillBeneficiary,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ADD_SMARTWILL_BENEFICIARY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$addSmartWillBeneficiary = json['addSmartWillBeneficiary'];
    final l$$__typename = json['__typename'];
    return Mutation$ADD_SMARTWILL_BENEFICIARY(
      addSmartWillBeneficiary: (l$addSmartWillBeneficiary as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? addSmartWillBeneficiary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addSmartWillBeneficiary = addSmartWillBeneficiary;
    _resultData['addSmartWillBeneficiary'] = l$addSmartWillBeneficiary;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addSmartWillBeneficiary = addSmartWillBeneficiary;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addSmartWillBeneficiary, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ADD_SMARTWILL_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addSmartWillBeneficiary = addSmartWillBeneficiary;
    final lOther$addSmartWillBeneficiary = other.addSmartWillBeneficiary;
    if (l$addSmartWillBeneficiary != lOther$addSmartWillBeneficiary) {
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

extension UtilityExtension$Mutation$ADD_SMARTWILL_BENEFICIARY
    on Mutation$ADD_SMARTWILL_BENEFICIARY {
  CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY<
    Mutation$ADD_SMARTWILL_BENEFICIARY
  >
  get copyWith => CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes> {
  factory CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY(
    Mutation$ADD_SMARTWILL_BENEFICIARY instance,
    TRes Function(Mutation$ADD_SMARTWILL_BENEFICIARY) then,
  ) = _CopyWithImpl$Mutation$ADD_SMARTWILL_BENEFICIARY;

  factory CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ADD_SMARTWILL_BENEFICIARY;

  TRes call({String? addSmartWillBeneficiary, String? $__typename});
}

class _CopyWithImpl$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithImpl$Mutation$ADD_SMARTWILL_BENEFICIARY(this._instance, this._then);

  final Mutation$ADD_SMARTWILL_BENEFICIARY _instance;

  final TRes Function(Mutation$ADD_SMARTWILL_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addSmartWillBeneficiary = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ADD_SMARTWILL_BENEFICIARY(
      addSmartWillBeneficiary: addSmartWillBeneficiary == _undefined
          ? _instance.addSmartWillBeneficiary
          : (addSmartWillBeneficiary as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes>
    implements CopyWith$Mutation$ADD_SMARTWILL_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Mutation$ADD_SMARTWILL_BENEFICIARY(this._res);

  TRes _res;

  call({String? addSmartWillBeneficiary, String? $__typename}) => _res;
}

const documentNodeMutationADD_SMARTWILL_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ADD_SMARTWILL_BENEFICIARY'),
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
            name: NameNode(value: 'addSmartWillBeneficiary'),
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
