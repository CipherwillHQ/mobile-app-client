import 'package:gql/ast.dart';

class Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY {
  factory Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY({
    required String beneficiary_id,
    String? custom_message,
  }) => Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY._({
    r'beneficiary_id': beneficiary_id,
    if (custom_message != null) r'custom_message': custom_message,
  });

  Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY._(this._$data);

  factory Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$beneficiary_id = data['beneficiary_id'];
    result$data['beneficiary_id'] = (l$beneficiary_id as String);
    if (data.containsKey('custom_message')) {
      final l$custom_message = data['custom_message'];
      result$data['custom_message'] = (l$custom_message as String?);
    }
    return Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY._(
      result$data,
    );
  }

  Map<String, dynamic> _$data;

  String get beneficiary_id => (_$data['beneficiary_id'] as String);

  String? get custom_message => (_$data['custom_message'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$beneficiary_id = beneficiary_id;
    result$data['beneficiary_id'] = l$beneficiary_id;
    if (_$data.containsKey('custom_message')) {
      final l$custom_message = custom_message;
      result$data['custom_message'] = l$custom_message;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
    Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (l$beneficiary_id != lOther$beneficiary_id) {
      return false;
    }
    final l$custom_message = custom_message;
    final lOther$custom_message = other.custom_message;
    if (_$data.containsKey('custom_message') !=
        other._$data.containsKey('custom_message')) {
      return false;
    }
    if (l$custom_message != lOther$custom_message) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$beneficiary_id = beneficiary_id;
    final l$custom_message = custom_message;
    return Object.hashAll([
      l$beneficiary_id,
      _$data.containsKey('custom_message') ? l$custom_message : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
  TRes
> {
  factory CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
    Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY instance,
    TRes Function(Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY)
    then,
  ) = _CopyWithImpl$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY;

  factory CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY;

  TRes call({String? beneficiary_id, String? custom_message});
}

class _CopyWithImpl$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
  TRes
>
    implements
        CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
          TRes
        > {
  _CopyWithImpl$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY _instance;

  final TRes Function(Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? beneficiary_id = _undefined,
    Object? custom_message = _undefined,
  }) => _then(
    Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY._({
      ..._instance._$data,
      if (beneficiary_id != _undefined && beneficiary_id != null)
        'beneficiary_id': (beneficiary_id as String),
      if (custom_message != _undefined)
        'custom_message': (custom_message as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
  TRes
>
    implements
        CopyWith$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
          TRes
        > {
  _CopyWithStubImpl$Variables$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
    this._res,
  );

  TRes _res;

  call({String? beneficiary_id, String? custom_message}) => _res;
}

class Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY {
  Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY({
    required this.updateCustomMessageForBeneficiary,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$updateCustomMessageForBeneficiary =
        json['updateCustomMessageForBeneficiary'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
      updateCustomMessageForBeneficiary:
          (l$updateCustomMessageForBeneficiary as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool updateCustomMessageForBeneficiary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCustomMessageForBeneficiary =
        updateCustomMessageForBeneficiary;
    _resultData['updateCustomMessageForBeneficiary'] =
        l$updateCustomMessageForBeneficiary;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCustomMessageForBeneficiary =
        updateCustomMessageForBeneficiary;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateCustomMessageForBeneficiary, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCustomMessageForBeneficiary =
        updateCustomMessageForBeneficiary;
    final lOther$updateCustomMessageForBeneficiary =
        other.updateCustomMessageForBeneficiary;
    if (l$updateCustomMessageForBeneficiary !=
        lOther$updateCustomMessageForBeneficiary) {
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

extension UtilityExtension$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY
    on Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY {
  CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<
    Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<TRes> {
  factory CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
    Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY instance,
    TRes Function(Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY) then,
  ) = _CopyWithImpl$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY;

  factory CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY;

  TRes call({bool? updateCustomMessageForBeneficiary, String? $__typename});
}

class _CopyWithImpl$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<TRes>
    implements CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<TRes> {
  _CopyWithImpl$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY _instance;

  final TRes Function(Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateCustomMessageForBeneficiary = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(
      updateCustomMessageForBeneficiary:
          updateCustomMessageForBeneficiary == _undefined ||
              updateCustomMessageForBeneficiary == null
          ? _instance.updateCustomMessageForBeneficiary
          : (updateCustomMessageForBeneficiary as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<TRes>
    implements CopyWith$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY(this._res);

  TRes _res;

  call({bool? updateCustomMessageForBeneficiary, String? $__typename}) => _res;
}

const documentNodeMutationUPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'beneficiary_id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'custom_message')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
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
            name: NameNode(value: 'updateCustomMessageForBeneficiary'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'beneficiary_id'),
                value: VariableNode(name: NameNode(value: 'beneficiary_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'custom_message'),
                value: VariableNode(name: NameNode(value: 'custom_message')),
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
