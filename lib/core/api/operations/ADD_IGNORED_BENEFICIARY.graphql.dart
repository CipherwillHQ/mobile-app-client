import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$ADD_IGNORED_BENEFICIARY {
  factory Variables$Mutation$ADD_IGNORED_BENEFICIARY({
    required String metamodel_id,
    required String beneficiary_id,
  }) => Variables$Mutation$ADD_IGNORED_BENEFICIARY._({
    r'metamodel_id': metamodel_id,
    r'beneficiary_id': beneficiary_id,
  });

  Variables$Mutation$ADD_IGNORED_BENEFICIARY._(this._$data);

  factory Variables$Mutation$ADD_IGNORED_BENEFICIARY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$metamodel_id = data['metamodel_id'];
    result$data['metamodel_id'] = (l$metamodel_id as String);
    final l$beneficiary_id = data['beneficiary_id'];
    result$data['beneficiary_id'] = (l$beneficiary_id as String);
    return Variables$Mutation$ADD_IGNORED_BENEFICIARY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get metamodel_id => (_$data['metamodel_id'] as String);

  String get beneficiary_id => (_$data['beneficiary_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$metamodel_id = metamodel_id;
    result$data['metamodel_id'] = l$metamodel_id;
    final l$beneficiary_id = beneficiary_id;
    result$data['beneficiary_id'] = l$beneficiary_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY<
    Variables$Mutation$ADD_IGNORED_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ADD_IGNORED_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metamodel_id = metamodel_id;
    final lOther$metamodel_id = other.metamodel_id;
    if (l$metamodel_id != lOther$metamodel_id) {
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
    final l$metamodel_id = metamodel_id;
    final l$beneficiary_id = beneficiary_id;
    return Object.hashAll([l$metamodel_id, l$beneficiary_id]);
  }
}

abstract class CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY<TRes> {
  factory CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY(
    Variables$Mutation$ADD_IGNORED_BENEFICIARY instance,
    TRes Function(Variables$Mutation$ADD_IGNORED_BENEFICIARY) then,
  ) = _CopyWithImpl$Variables$Mutation$ADD_IGNORED_BENEFICIARY;

  factory CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ADD_IGNORED_BENEFICIARY;

  TRes call({String? metamodel_id, String? beneficiary_id});
}

class _CopyWithImpl$Variables$Mutation$ADD_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY<TRes> {
  _CopyWithImpl$Variables$Mutation$ADD_IGNORED_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ADD_IGNORED_BENEFICIARY _instance;

  final TRes Function(Variables$Mutation$ADD_IGNORED_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metamodel_id = _undefined,
    Object? beneficiary_id = _undefined,
  }) => _then(
    Variables$Mutation$ADD_IGNORED_BENEFICIARY._({
      ..._instance._$data,
      if (metamodel_id != _undefined && metamodel_id != null)
        'metamodel_id': (metamodel_id as String),
      if (beneficiary_id != _undefined && beneficiary_id != null)
        'beneficiary_id': (beneficiary_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ADD_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$ADD_IGNORED_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ADD_IGNORED_BENEFICIARY(this._res);

  TRes _res;

  call({String? metamodel_id, String? beneficiary_id}) => _res;
}

class Mutation$ADD_IGNORED_BENEFICIARY {
  Mutation$ADD_IGNORED_BENEFICIARY({
    required this.addIgnoredBeneficiary,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ADD_IGNORED_BENEFICIARY.fromJson(Map<String, dynamic> json) {
    final l$addIgnoredBeneficiary = json['addIgnoredBeneficiary'];
    final l$$__typename = json['__typename'];
    return Mutation$ADD_IGNORED_BENEFICIARY(
      addIgnoredBeneficiary:
          Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary.fromJson(
            (l$addIgnoredBeneficiary as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary
  addIgnoredBeneficiary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addIgnoredBeneficiary = addIgnoredBeneficiary;
    _resultData['addIgnoredBeneficiary'] = l$addIgnoredBeneficiary.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addIgnoredBeneficiary = addIgnoredBeneficiary;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addIgnoredBeneficiary, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ADD_IGNORED_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addIgnoredBeneficiary = addIgnoredBeneficiary;
    final lOther$addIgnoredBeneficiary = other.addIgnoredBeneficiary;
    if (l$addIgnoredBeneficiary != lOther$addIgnoredBeneficiary) {
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

extension UtilityExtension$Mutation$ADD_IGNORED_BENEFICIARY
    on Mutation$ADD_IGNORED_BENEFICIARY {
  CopyWith$Mutation$ADD_IGNORED_BENEFICIARY<Mutation$ADD_IGNORED_BENEFICIARY>
  get copyWith => CopyWith$Mutation$ADD_IGNORED_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Mutation$ADD_IGNORED_BENEFICIARY<TRes> {
  factory CopyWith$Mutation$ADD_IGNORED_BENEFICIARY(
    Mutation$ADD_IGNORED_BENEFICIARY instance,
    TRes Function(Mutation$ADD_IGNORED_BENEFICIARY) then,
  ) = _CopyWithImpl$Mutation$ADD_IGNORED_BENEFICIARY;

  factory CopyWith$Mutation$ADD_IGNORED_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ADD_IGNORED_BENEFICIARY;

  TRes call({
    Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary?
    addIgnoredBeneficiary,
    String? $__typename,
  });
  CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<TRes>
  get addIgnoredBeneficiary;
}

class _CopyWithImpl$Mutation$ADD_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Mutation$ADD_IGNORED_BENEFICIARY<TRes> {
  _CopyWithImpl$Mutation$ADD_IGNORED_BENEFICIARY(this._instance, this._then);

  final Mutation$ADD_IGNORED_BENEFICIARY _instance;

  final TRes Function(Mutation$ADD_IGNORED_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addIgnoredBeneficiary = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ADD_IGNORED_BENEFICIARY(
      addIgnoredBeneficiary:
          addIgnoredBeneficiary == _undefined || addIgnoredBeneficiary == null
          ? _instance.addIgnoredBeneficiary
          : (addIgnoredBeneficiary
                as Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<TRes>
  get addIgnoredBeneficiary {
    final local$addIgnoredBeneficiary = _instance.addIgnoredBeneficiary;
    return CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
      local$addIgnoredBeneficiary,
      (e) => call(addIgnoredBeneficiary: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$ADD_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Mutation$ADD_IGNORED_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Mutation$ADD_IGNORED_BENEFICIARY(this._res);

  TRes _res;

  call({
    Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary?
    addIgnoredBeneficiary,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<TRes>
  get addIgnoredBeneficiary =>
      CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary.stub(
        _res,
      );
}

const documentNodeMutationADD_IGNORED_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ADD_IGNORED_BENEFICIARY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'metamodel_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'beneficiary_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'addIgnoredBeneficiary'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'metamodel_id'),
                value: VariableNode(name: NameNode(value: 'metamodel_id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'beneficiary_id'),
                value: VariableNode(name: NameNode(value: 'beneficiary_id')),
              ),
            ],
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
                  name: NameNode(value: 'type'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'metadata'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'ignored_beneficiaries'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'created_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updated_at'),
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

class Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary {
  Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary({
    required this.id,
    required this.type,
    required this.metadata,
    this.ignored_beneficiaries,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
      id: (l$id as String),
      type: fromJson$Enum$MetamodelType((l$type as String)),
      metadata: (l$metadata as String),
      ignored_beneficiaries: (l$ignored_beneficiaries as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList(),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$MetamodelType type;

  final String metadata;

  final List<String>? ignored_beneficiaries;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MetamodelType(l$type);
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$ignored_beneficiaries = ignored_beneficiaries;
    _resultData['ignored_beneficiaries'] = l$ignored_beneficiaries
        ?.map((e) => e)
        .toList();
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$metadata = metadata;
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$type,
      l$metadata,
      l$ignored_beneficiaries == null
          ? null
          : Object.hashAll(l$ignored_beneficiaries.map((v) => v)),
      l$created_at,
      l$updated_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$ignored_beneficiaries = ignored_beneficiaries;
    final lOther$ignored_beneficiaries = other.ignored_beneficiaries;
    if (l$ignored_beneficiaries != null &&
        lOther$ignored_beneficiaries != null) {
      if (l$ignored_beneficiaries.length !=
          lOther$ignored_beneficiaries.length) {
        return false;
      }
      for (int i = 0; i < l$ignored_beneficiaries.length; i++) {
        final l$ignored_beneficiaries$entry = l$ignored_beneficiaries[i];
        final lOther$ignored_beneficiaries$entry =
            lOther$ignored_beneficiaries[i];
        if (l$ignored_beneficiaries$entry !=
            lOther$ignored_beneficiaries$entry) {
          return false;
        }
      }
    } else if (l$ignored_beneficiaries != lOther$ignored_beneficiaries) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (l$updated_at != lOther$updated_at) {
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

extension UtilityExtension$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary
    on Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary {
  CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<
    Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary
  >
  get copyWith =>
      CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<
  TRes
> {
  factory CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
    Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary instance,
    TRes Function(Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary) then,
  ) = _CopyWithImpl$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary;

  factory CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary;

  TRes call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    List<String>? ignored_beneficiaries,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<TRes>
    implements
        CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<TRes> {
  _CopyWithImpl$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
    this._instance,
    this._then,
  );

  final Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary _instance;

  final TRes Function(Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? metadata = _undefined,
    Object? ignored_beneficiaries = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      type: type == _undefined || type == null
          ? _instance.type
          : (type as Enum$MetamodelType),
      metadata: metadata == _undefined || metadata == null
          ? _instance.metadata
          : (metadata as String),
      ignored_beneficiaries: ignored_beneficiaries == _undefined
          ? _instance.ignored_beneficiaries
          : (ignored_beneficiaries as List<String>?),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      updated_at: updated_at == _undefined || updated_at == null
          ? _instance.updated_at
          : (updated_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<
  TRes
>
    implements
        CopyWith$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary<TRes> {
  _CopyWithStubImpl$Mutation$ADD_IGNORED_BENEFICIARY$addIgnoredBeneficiary(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$MetamodelType? type,
    String? metadata,
    List<String>? ignored_beneficiaries,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
