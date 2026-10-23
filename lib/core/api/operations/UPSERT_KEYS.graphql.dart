import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$UPSERT_KEYS {
  factory Variables$Mutation$UPSERT_KEYS({
    required List<Input$KeyInput> items,
  }) => Variables$Mutation$UPSERT_KEYS._({r'items': items});

  Variables$Mutation$UPSERT_KEYS._(this._$data);

  factory Variables$Mutation$UPSERT_KEYS.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$items = data['items'];
    result$data['items'] = (l$items as List<dynamic>)
        .map((e) => Input$KeyInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Variables$Mutation$UPSERT_KEYS._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$KeyInput> get items => (_$data['items'] as List<Input$KeyInput>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$items = items;
    result$data['items'] = l$items.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$UPSERT_KEYS<Variables$Mutation$UPSERT_KEYS>
  get copyWith => CopyWith$Variables$Mutation$UPSERT_KEYS(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UPSERT_KEYS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$items = items;
    return Object.hashAll([Object.hashAll(l$items.map((v) => v))]);
  }
}

abstract class CopyWith$Variables$Mutation$UPSERT_KEYS<TRes> {
  factory CopyWith$Variables$Mutation$UPSERT_KEYS(
    Variables$Mutation$UPSERT_KEYS instance,
    TRes Function(Variables$Mutation$UPSERT_KEYS) then,
  ) = _CopyWithImpl$Variables$Mutation$UPSERT_KEYS;

  factory CopyWith$Variables$Mutation$UPSERT_KEYS.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UPSERT_KEYS;

  TRes call({List<Input$KeyInput>? items});
}

class _CopyWithImpl$Variables$Mutation$UPSERT_KEYS<TRes>
    implements CopyWith$Variables$Mutation$UPSERT_KEYS<TRes> {
  _CopyWithImpl$Variables$Mutation$UPSERT_KEYS(this._instance, this._then);

  final Variables$Mutation$UPSERT_KEYS _instance;

  final TRes Function(Variables$Mutation$UPSERT_KEYS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? items = _undefined}) => _then(
    Variables$Mutation$UPSERT_KEYS._({
      ..._instance._$data,
      if (items != _undefined && items != null)
        'items': (items as List<Input$KeyInput>),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UPSERT_KEYS<TRes>
    implements CopyWith$Variables$Mutation$UPSERT_KEYS<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UPSERT_KEYS(this._res);

  TRes _res;

  call({List<Input$KeyInput>? items}) => _res;
}

class Mutation$UPSERT_KEYS {
  Mutation$UPSERT_KEYS({this.upsertKeys, this.$__typename = 'Mutation'});

  factory Mutation$UPSERT_KEYS.fromJson(Map<String, dynamic> json) {
    final l$upsertKeys = json['upsertKeys'];
    final l$$__typename = json['__typename'];
    return Mutation$UPSERT_KEYS(
      upsertKeys: (l$upsertKeys as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? upsertKeys;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$upsertKeys = upsertKeys;
    _resultData['upsertKeys'] = l$upsertKeys;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$upsertKeys = upsertKeys;
    final l$$__typename = $__typename;
    return Object.hashAll([l$upsertKeys, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPSERT_KEYS || runtimeType != other.runtimeType) {
      return false;
    }
    final l$upsertKeys = upsertKeys;
    final lOther$upsertKeys = other.upsertKeys;
    if (l$upsertKeys != lOther$upsertKeys) {
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

extension UtilityExtension$Mutation$UPSERT_KEYS on Mutation$UPSERT_KEYS {
  CopyWith$Mutation$UPSERT_KEYS<Mutation$UPSERT_KEYS> get copyWith =>
      CopyWith$Mutation$UPSERT_KEYS(this, (i) => i);
}

abstract class CopyWith$Mutation$UPSERT_KEYS<TRes> {
  factory CopyWith$Mutation$UPSERT_KEYS(
    Mutation$UPSERT_KEYS instance,
    TRes Function(Mutation$UPSERT_KEYS) then,
  ) = _CopyWithImpl$Mutation$UPSERT_KEYS;

  factory CopyWith$Mutation$UPSERT_KEYS.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPSERT_KEYS;

  TRes call({bool? upsertKeys, String? $__typename});
}

class _CopyWithImpl$Mutation$UPSERT_KEYS<TRes>
    implements CopyWith$Mutation$UPSERT_KEYS<TRes> {
  _CopyWithImpl$Mutation$UPSERT_KEYS(this._instance, this._then);

  final Mutation$UPSERT_KEYS _instance;

  final TRes Function(Mutation$UPSERT_KEYS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? upsertKeys = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPSERT_KEYS(
      upsertKeys: upsertKeys == _undefined
          ? _instance.upsertKeys
          : (upsertKeys as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UPSERT_KEYS<TRes>
    implements CopyWith$Mutation$UPSERT_KEYS<TRes> {
  _CopyWithStubImpl$Mutation$UPSERT_KEYS(this._res);

  TRes _res;

  call({bool? upsertKeys, String? $__typename}) => _res;
}

const documentNodeMutationUPSERT_KEYS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UPSERT_KEYS'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'items')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'KeyInput'),
              isNonNull: true,
            ),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'upsertKeys'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'items'),
                value: VariableNode(name: NameNode(value: 'items')),
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
