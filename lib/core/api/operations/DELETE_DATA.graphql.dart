import 'package:gql/ast.dart';

class Mutation$DELETE_DATA {
  Mutation$DELETE_DATA({
    required this.deleteData,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_DATA.fromJson(Map<String, dynamic> json) {
    final l$deleteData = json['deleteData'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_DATA(
      deleteData: (l$deleteData as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteData;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteData = deleteData;
    _resultData['deleteData'] = l$deleteData;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteData = deleteData;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteData, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_DATA || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteData = deleteData;
    final lOther$deleteData = other.deleteData;
    if (l$deleteData != lOther$deleteData) {
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

extension UtilityExtension$Mutation$DELETE_DATA on Mutation$DELETE_DATA {
  CopyWith$Mutation$DELETE_DATA<Mutation$DELETE_DATA> get copyWith =>
      CopyWith$Mutation$DELETE_DATA(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_DATA<TRes> {
  factory CopyWith$Mutation$DELETE_DATA(
    Mutation$DELETE_DATA instance,
    TRes Function(Mutation$DELETE_DATA) then,
  ) = _CopyWithImpl$Mutation$DELETE_DATA;

  factory CopyWith$Mutation$DELETE_DATA.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_DATA;

  TRes call({bool? deleteData, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_DATA<TRes>
    implements CopyWith$Mutation$DELETE_DATA<TRes> {
  _CopyWithImpl$Mutation$DELETE_DATA(this._instance, this._then);

  final Mutation$DELETE_DATA _instance;

  final TRes Function(Mutation$DELETE_DATA) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteData = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_DATA(
      deleteData: deleteData == _undefined || deleteData == null
          ? _instance.deleteData
          : (deleteData as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_DATA<TRes>
    implements CopyWith$Mutation$DELETE_DATA<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_DATA(this._res);

  TRes _res;

  call({bool? deleteData, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_DATA = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_DATA'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteData'),
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
  ],
);
