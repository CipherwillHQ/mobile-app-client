import 'package:gql/ast.dart';

class Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY {
  factory Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY({
    required String publicKey,
    String? cursor,
    bool? for_beneficiary_migration,
  }) => Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY._({
    r'publicKey': publicKey,
    if (cursor != null) r'cursor': cursor,
    if (for_beneficiary_migration != null)
      r'for_beneficiary_migration': for_beneficiary_migration,
  });

  Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY._(this._$data);

  factory Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$publicKey = data['publicKey'];
    result$data['publicKey'] = (l$publicKey as String);
    if (data.containsKey('cursor')) {
      final l$cursor = data['cursor'];
      result$data['cursor'] = (l$cursor as String?);
    }
    if (data.containsKey('for_beneficiary_migration')) {
      final l$for_beneficiary_migration = data['for_beneficiary_migration'];
      result$data['for_beneficiary_migration'] =
          (l$for_beneficiary_migration as bool?);
    }
    return Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get publicKey => (_$data['publicKey'] as String);

  String? get cursor => (_$data['cursor'] as String?);

  bool? get for_beneficiary_migration =>
      (_$data['for_beneficiary_migration'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$publicKey = publicKey;
    result$data['publicKey'] = l$publicKey;
    if (_$data.containsKey('cursor')) {
      final l$cursor = cursor;
      result$data['cursor'] = l$cursor;
    }
    if (_$data.containsKey('for_beneficiary_migration')) {
      final l$for_beneficiary_migration = for_beneficiary_migration;
      result$data['for_beneficiary_migration'] = l$for_beneficiary_migration;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<
    Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (_$data.containsKey('cursor') != other._$data.containsKey('cursor')) {
      return false;
    }
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$for_beneficiary_migration = for_beneficiary_migration;
    final lOther$for_beneficiary_migration = other.for_beneficiary_migration;
    if (_$data.containsKey('for_beneficiary_migration') !=
        other._$data.containsKey('for_beneficiary_migration')) {
      return false;
    }
    if (l$for_beneficiary_migration != lOther$for_beneficiary_migration) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$publicKey = publicKey;
    final l$cursor = cursor;
    final l$for_beneficiary_migration = for_beneficiary_migration;
    return Object.hashAll([
      l$publicKey,
      _$data.containsKey('cursor') ? l$cursor : const {},
      _$data.containsKey('for_beneficiary_migration')
          ? l$for_beneficiary_migration
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes> {
  factory CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(
    Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY instance,
    TRes Function(Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY) then,
  ) = _CopyWithImpl$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY;

  factory CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY;

  TRes call({
    String? publicKey,
    String? cursor,
    bool? for_beneficiary_migration,
  });
}

class _CopyWithImpl$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes> {
  _CopyWithImpl$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY _instance;

  final TRes Function(Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? publicKey = _undefined,
    Object? cursor = _undefined,
    Object? for_beneficiary_migration = _undefined,
  }) => _then(
    Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY._({
      ..._instance._$data,
      if (publicKey != _undefined && publicKey != null)
        'publicKey': (publicKey as String),
      if (cursor != _undefined) 'cursor': (cursor as String?),
      if (for_beneficiary_migration != _undefined)
        'for_beneficiary_migration': (for_beneficiary_migration as bool?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(this._res);

  TRes _res;

  call({String? publicKey, String? cursor, bool? for_beneficiary_migration}) =>
      _res;
}

class Query$GET_KEY_ITEMS_BY_PUBLIC_KEY {
  Query$GET_KEY_ITEMS_BY_PUBLIC_KEY({
    required this.getKeyItemsByPublicKey,
    this.$__typename = 'Query',
  });

  factory Query$GET_KEY_ITEMS_BY_PUBLIC_KEY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getKeyItemsByPublicKey = json['getKeyItemsByPublicKey'];
    final l$$__typename = json['__typename'];
    return Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(
      getKeyItemsByPublicKey:
          Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey.fromJson(
            (l$getKeyItemsByPublicKey as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey
  getKeyItemsByPublicKey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getKeyItemsByPublicKey = getKeyItemsByPublicKey;
    _resultData['getKeyItemsByPublicKey'] = l$getKeyItemsByPublicKey.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getKeyItemsByPublicKey = getKeyItemsByPublicKey;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getKeyItemsByPublicKey, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_KEY_ITEMS_BY_PUBLIC_KEY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getKeyItemsByPublicKey = getKeyItemsByPublicKey;
    final lOther$getKeyItemsByPublicKey = other.getKeyItemsByPublicKey;
    if (l$getKeyItemsByPublicKey != lOther$getKeyItemsByPublicKey) {
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

extension UtilityExtension$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY
    on Query$GET_KEY_ITEMS_BY_PUBLIC_KEY {
  CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<Query$GET_KEY_ITEMS_BY_PUBLIC_KEY>
  get copyWith => CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(this, (i) => i);
}

abstract class CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes> {
  factory CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY instance,
    TRes Function(Query$GET_KEY_ITEMS_BY_PUBLIC_KEY) then,
  ) = _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY;

  factory CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY;

  TRes call({
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey?
    getKeyItemsByPublicKey,
    String? $__typename,
  });
  CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<TRes>
  get getKeyItemsByPublicKey;
}

class _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes> {
  _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(this._instance, this._then);

  final Query$GET_KEY_ITEMS_BY_PUBLIC_KEY _instance;

  final TRes Function(Query$GET_KEY_ITEMS_BY_PUBLIC_KEY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getKeyItemsByPublicKey = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(
      getKeyItemsByPublicKey:
          getKeyItemsByPublicKey == _undefined || getKeyItemsByPublicKey == null
          ? _instance.getKeyItemsByPublicKey
          : (getKeyItemsByPublicKey
                as Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<TRes>
  get getKeyItemsByPublicKey {
    final local$getKeyItemsByPublicKey = _instance.getKeyItemsByPublicKey;
    return CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
      local$getKeyItemsByPublicKey,
      (e) => call(getKeyItemsByPublicKey: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes>
    implements CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY<TRes> {
  _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY(this._res);

  TRes _res;

  call({
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey?
    getKeyItemsByPublicKey,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<TRes>
  get getKeyItemsByPublicKey =>
      CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey.stub(
        _res,
      );
}

const documentNodeQueryGET_KEY_ITEMS_BY_PUBLIC_KEY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_KEY_ITEMS_BY_PUBLIC_KEY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'publicKey')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'cursor')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(
            name: NameNode(value: 'for_beneficiary_migration'),
          ),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
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
            name: NameNode(value: 'getKeyItemsByPublicKey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'publicKey'),
                value: VariableNode(name: NameNode(value: 'publicKey')),
              ),
              ArgumentNode(
                name: NameNode(value: 'cursor'),
                value: VariableNode(name: NameNode(value: 'cursor')),
              ),
              ArgumentNode(
                name: NameNode(value: 'for_beneficiary_migration'),
                value: VariableNode(
                  name: NameNode(value: 'for_beneficiary_migration'),
                ),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'items'),
                  alias: null,
                  arguments: [],
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
                        name: NameNode(value: 'ref_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'publicKey'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'key'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'beneficiary_id'),
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
                  name: NameNode(value: 'has_more'),
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

class Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey {
  Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey({
    this.items,
    required this.has_more,
    this.$__typename = 'KeyList',
  });

  factory Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$items = json['items'];
    final l$has_more = json['has_more'];
    final l$$__typename = json['__typename'];
    return Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
      items: (l$items as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      has_more: (l$has_more as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items?>?
  items;

  final bool has_more;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$items = items;
    _resultData['items'] = l$items?.map((e) => e?.toJson()).toList();
    final l$has_more = has_more;
    _resultData['has_more'] = l$has_more;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$items = items;
    final l$has_more = has_more;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$items == null ? null : Object.hashAll(l$items.map((v) => v)),
      l$has_more,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items != null && lOther$items != null) {
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
    } else if (l$items != lOther$items) {
      return false;
    }
    final l$has_more = has_more;
    final lOther$has_more = other.has_more;
    if (l$has_more != lOther$has_more) {
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

extension UtilityExtension$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey
    on Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey {
  CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey
  >
  get copyWith =>
      CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<
  TRes
> {
  factory CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey instance,
    TRes Function(Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey)
    then,
  ) = _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey;

  factory CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey;

  TRes call({
    List<Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items?>?
    items,
    bool? has_more,
    String? $__typename,
  });
  TRes items(
    Iterable<Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items?>?
    Function(
      Iterable<
        CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
          Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<
  TRes
>
    implements
        CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<
          TRes
        > {
  _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
    this._instance,
    this._then,
  );

  final Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey _instance;

  final TRes Function(Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? items = _undefined,
    Object? has_more = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
      items: items == _undefined
          ? _instance.items
          : (items
                as List<
                  Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items?
                >?),
      has_more: has_more == _undefined || has_more == null
          ? _instance.has_more
          : (has_more as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes items(
    Iterable<Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items?>?
    Function(
      Iterable<
        CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
          Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items
        >?
      >?,
    )
    _fn,
  ) => call(
    items: _fn(
      _instance.items?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<
  TRes
>
    implements
        CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items?>?
    items,
    bool? has_more,
    String? $__typename,
  }) => _res;

  items(_fn) => _res;
}

class Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items {
  Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items({
    required this.id,
    required this.ref_id,
    required this.publicKey,
    required this.key,
    this.beneficiary_id,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Key',
  });

  factory Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$ref_id = json['ref_id'];
    final l$publicKey = json['publicKey'];
    final l$key = json['key'];
    final l$beneficiary_id = json['beneficiary_id'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
      id: (l$id as String),
      ref_id: (l$ref_id as String),
      publicKey: (l$publicKey as String),
      key: (l$key as String),
      beneficiary_id: (l$beneficiary_id as String?),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String ref_id;

  final String publicKey;

  final String key;

  final String? beneficiary_id;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$ref_id = ref_id;
    _resultData['ref_id'] = l$ref_id;
    final l$publicKey = publicKey;
    _resultData['publicKey'] = l$publicKey;
    final l$key = key;
    _resultData['key'] = l$key;
    final l$beneficiary_id = beneficiary_id;
    _resultData['beneficiary_id'] = l$beneficiary_id;
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
    final l$ref_id = ref_id;
    final l$publicKey = publicKey;
    final l$key = key;
    final l$beneficiary_id = beneficiary_id;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$ref_id,
      l$publicKey,
      l$key,
      l$beneficiary_id,
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
            is! Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (l$beneficiary_id != lOther$beneficiary_id) {
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

extension UtilityExtension$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items
    on Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items {
  CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items
  >
  get copyWith =>
      CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
  TRes
> {
  factory CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items instance,
    TRes Function(
      Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items,
    )
    then,
  ) = _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items;

  factory CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items;

  TRes call({
    String? id,
    String? ref_id,
    String? publicKey,
    String? key,
    String? beneficiary_id,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
  TRes
>
    implements
        CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
          TRes
        > {
  _CopyWithImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
    this._instance,
    this._then,
  );

  final Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items
  _instance;

  final TRes Function(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? ref_id = _undefined,
    Object? publicKey = _undefined,
    Object? key = _undefined,
    Object? beneficiary_id = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      ref_id: ref_id == _undefined || ref_id == null
          ? _instance.ref_id
          : (ref_id as String),
      publicKey: publicKey == _undefined || publicKey == null
          ? _instance.publicKey
          : (publicKey as String),
      key: key == _undefined || key == null ? _instance.key : (key as String),
      beneficiary_id: beneficiary_id == _undefined
          ? _instance.beneficiary_id
          : (beneficiary_id as String?),
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

class _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
  TRes
>
    implements
        CopyWith$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_KEY_ITEMS_BY_PUBLIC_KEY$getKeyItemsByPublicKey$items(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? ref_id,
    String? publicKey,
    String? key,
    String? beneficiary_id,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
