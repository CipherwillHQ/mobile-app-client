import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_POD {
  factory Variables$Mutation$DELETE_POD({required String ref_id}) =>
      Variables$Mutation$DELETE_POD._({r'ref_id': ref_id});

  Variables$Mutation$DELETE_POD._(this._$data);

  factory Variables$Mutation$DELETE_POD.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$ref_id = data['ref_id'];
    result$data['ref_id'] = (l$ref_id as String);
    return Variables$Mutation$DELETE_POD._(result$data);
  }

  Map<String, dynamic> _$data;

  String get ref_id => (_$data['ref_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$ref_id = ref_id;
    result$data['ref_id'] = l$ref_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_POD<Variables$Mutation$DELETE_POD>
  get copyWith => CopyWith$Variables$Mutation$DELETE_POD(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_POD ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$ref_id = ref_id;
    return Object.hashAll([l$ref_id]);
  }
}

abstract class CopyWith$Variables$Mutation$DELETE_POD<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_POD(
    Variables$Mutation$DELETE_POD instance,
    TRes Function(Variables$Mutation$DELETE_POD) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_POD;

  factory CopyWith$Variables$Mutation$DELETE_POD.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DELETE_POD;

  TRes call({String? ref_id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_POD<TRes>
    implements CopyWith$Variables$Mutation$DELETE_POD<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_POD(this._instance, this._then);

  final Variables$Mutation$DELETE_POD _instance;

  final TRes Function(Variables$Mutation$DELETE_POD) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? ref_id = _undefined}) => _then(
    Variables$Mutation$DELETE_POD._({
      ..._instance._$data,
      if (ref_id != _undefined && ref_id != null) 'ref_id': (ref_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_POD<TRes>
    implements CopyWith$Variables$Mutation$DELETE_POD<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_POD(this._res);

  TRes _res;

  call({String? ref_id}) => _res;
}

class Mutation$DELETE_POD {
  Mutation$DELETE_POD({this.deletePod, this.$__typename = 'Mutation'});

  factory Mutation$DELETE_POD.fromJson(Map<String, dynamic> json) {
    final l$deletePod = json['deletePod'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_POD(
      deletePod: (l$deletePod as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deletePod;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletePod = deletePod;
    _resultData['deletePod'] = l$deletePod;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletePod = deletePod;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deletePod, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_POD || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletePod = deletePod;
    final lOther$deletePod = other.deletePod;
    if (l$deletePod != lOther$deletePod) {
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

extension UtilityExtension$Mutation$DELETE_POD on Mutation$DELETE_POD {
  CopyWith$Mutation$DELETE_POD<Mutation$DELETE_POD> get copyWith =>
      CopyWith$Mutation$DELETE_POD(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_POD<TRes> {
  factory CopyWith$Mutation$DELETE_POD(
    Mutation$DELETE_POD instance,
    TRes Function(Mutation$DELETE_POD) then,
  ) = _CopyWithImpl$Mutation$DELETE_POD;

  factory CopyWith$Mutation$DELETE_POD.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_POD;

  TRes call({bool? deletePod, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_POD<TRes>
    implements CopyWith$Mutation$DELETE_POD<TRes> {
  _CopyWithImpl$Mutation$DELETE_POD(this._instance, this._then);

  final Mutation$DELETE_POD _instance;

  final TRes Function(Mutation$DELETE_POD) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deletePod = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_POD(
      deletePod: deletePod == _undefined
          ? _instance.deletePod
          : (deletePod as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_POD<TRes>
    implements CopyWith$Mutation$DELETE_POD<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_POD(this._res);

  TRes _res;

  call({bool? deletePod, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_POD = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_POD'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'ref_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deletePod'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'ref_id'),
                value: VariableNode(name: NameNode(value: 'ref_id')),
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
