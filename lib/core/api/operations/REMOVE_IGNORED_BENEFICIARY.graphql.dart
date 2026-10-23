import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$REMOVE_IGNORED_BENEFICIARY {
  factory Variables$Mutation$REMOVE_IGNORED_BENEFICIARY({
    required String metamodel_id,
    required String beneficiary_id,
  }) => Variables$Mutation$REMOVE_IGNORED_BENEFICIARY._({
    r'metamodel_id': metamodel_id,
    r'beneficiary_id': beneficiary_id,
  });

  Variables$Mutation$REMOVE_IGNORED_BENEFICIARY._(this._$data);

  factory Variables$Mutation$REMOVE_IGNORED_BENEFICIARY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$metamodel_id = data['metamodel_id'];
    result$data['metamodel_id'] = (l$metamodel_id as String);
    final l$beneficiary_id = data['beneficiary_id'];
    result$data['beneficiary_id'] = (l$beneficiary_id as String);
    return Variables$Mutation$REMOVE_IGNORED_BENEFICIARY._(result$data);
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

  CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY<
    Variables$Mutation$REMOVE_IGNORED_BENEFICIARY
  >
  get copyWith =>
      CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$REMOVE_IGNORED_BENEFICIARY ||
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

abstract class CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes> {
  factory CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY(
    Variables$Mutation$REMOVE_IGNORED_BENEFICIARY instance,
    TRes Function(Variables$Mutation$REMOVE_IGNORED_BENEFICIARY) then,
  ) = _CopyWithImpl$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY;

  factory CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY;

  TRes call({String? metamodel_id, String? beneficiary_id});
}

class _CopyWithImpl$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes> {
  _CopyWithImpl$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY(
    this._instance,
    this._then,
  );

  final Variables$Mutation$REMOVE_IGNORED_BENEFICIARY _instance;

  final TRes Function(Variables$Mutation$REMOVE_IGNORED_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metamodel_id = _undefined,
    Object? beneficiary_id = _undefined,
  }) => _then(
    Variables$Mutation$REMOVE_IGNORED_BENEFICIARY._({
      ..._instance._$data,
      if (metamodel_id != _undefined && metamodel_id != null)
        'metamodel_id': (metamodel_id as String),
      if (beneficiary_id != _undefined && beneficiary_id != null)
        'beneficiary_id': (beneficiary_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Variables$Mutation$REMOVE_IGNORED_BENEFICIARY(this._res);

  TRes _res;

  call({String? metamodel_id, String? beneficiary_id}) => _res;
}

class Mutation$REMOVE_IGNORED_BENEFICIARY {
  Mutation$REMOVE_IGNORED_BENEFICIARY({
    required this.removeIgnoredBeneficiary,
    this.$__typename = 'Mutation',
  });

  factory Mutation$REMOVE_IGNORED_BENEFICIARY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$removeIgnoredBeneficiary = json['removeIgnoredBeneficiary'];
    final l$$__typename = json['__typename'];
    return Mutation$REMOVE_IGNORED_BENEFICIARY(
      removeIgnoredBeneficiary:
          Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary.fromJson(
            (l$removeIgnoredBeneficiary as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary
  removeIgnoredBeneficiary;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$removeIgnoredBeneficiary = removeIgnoredBeneficiary;
    _resultData['removeIgnoredBeneficiary'] = l$removeIgnoredBeneficiary
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$removeIgnoredBeneficiary = removeIgnoredBeneficiary;
    final l$$__typename = $__typename;
    return Object.hashAll([l$removeIgnoredBeneficiary, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$REMOVE_IGNORED_BENEFICIARY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$removeIgnoredBeneficiary = removeIgnoredBeneficiary;
    final lOther$removeIgnoredBeneficiary = other.removeIgnoredBeneficiary;
    if (l$removeIgnoredBeneficiary != lOther$removeIgnoredBeneficiary) {
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

extension UtilityExtension$Mutation$REMOVE_IGNORED_BENEFICIARY
    on Mutation$REMOVE_IGNORED_BENEFICIARY {
  CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY<
    Mutation$REMOVE_IGNORED_BENEFICIARY
  >
  get copyWith => CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY(this, (i) => i);
}

abstract class CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes> {
  factory CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY(
    Mutation$REMOVE_IGNORED_BENEFICIARY instance,
    TRes Function(Mutation$REMOVE_IGNORED_BENEFICIARY) then,
  ) = _CopyWithImpl$Mutation$REMOVE_IGNORED_BENEFICIARY;

  factory CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY.stub(TRes res) =
      _CopyWithStubImpl$Mutation$REMOVE_IGNORED_BENEFICIARY;

  TRes call({
    Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary?
    removeIgnoredBeneficiary,
    String? $__typename,
  });
  CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<TRes>
  get removeIgnoredBeneficiary;
}

class _CopyWithImpl$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes> {
  _CopyWithImpl$Mutation$REMOVE_IGNORED_BENEFICIARY(this._instance, this._then);

  final Mutation$REMOVE_IGNORED_BENEFICIARY _instance;

  final TRes Function(Mutation$REMOVE_IGNORED_BENEFICIARY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? removeIgnoredBeneficiary = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$REMOVE_IGNORED_BENEFICIARY(
      removeIgnoredBeneficiary:
          removeIgnoredBeneficiary == _undefined ||
              removeIgnoredBeneficiary == null
          ? _instance.removeIgnoredBeneficiary
          : (removeIgnoredBeneficiary
                as Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<TRes>
  get removeIgnoredBeneficiary {
    final local$removeIgnoredBeneficiary = _instance.removeIgnoredBeneficiary;
    return CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
      local$removeIgnoredBeneficiary,
      (e) => call(removeIgnoredBeneficiary: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes>
    implements CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY<TRes> {
  _CopyWithStubImpl$Mutation$REMOVE_IGNORED_BENEFICIARY(this._res);

  TRes _res;

  call({
    Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary?
    removeIgnoredBeneficiary,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<TRes>
  get removeIgnoredBeneficiary =>
      CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary.stub(
        _res,
      );
}

const documentNodeMutationREMOVE_IGNORED_BENEFICIARY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'REMOVE_IGNORED_BENEFICIARY'),
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
            name: NameNode(value: 'removeIgnoredBeneficiary'),
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

class Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary {
  Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary({
    required this.id,
    required this.type,
    required this.metadata,
    this.ignored_beneficiaries,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Metamodel',
  });

  factory Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$metadata = json['metadata'];
    final l$ignored_beneficiaries = json['ignored_beneficiaries'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
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
    if (other
            is! Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary ||
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

extension UtilityExtension$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary
    on Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary {
  CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<
    Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary
  >
  get copyWith =>
      CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<
  TRes
> {
  factory CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
    Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary instance,
    TRes Function(Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary)
    then,
  ) = _CopyWithImpl$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary;

  factory CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary;

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

class _CopyWithImpl$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<
  TRes
>
    implements
        CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<
          TRes
        > {
  _CopyWithImpl$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
    this._instance,
    this._then,
  );

  final Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary _instance;

  final TRes Function(
    Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary,
  )
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
    Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
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

class _CopyWithStubImpl$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<
  TRes
>
    implements
        CopyWith$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary<
          TRes
        > {
  _CopyWithStubImpl$Mutation$REMOVE_IGNORED_BENEFICIARY$removeIgnoredBeneficiary(
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
