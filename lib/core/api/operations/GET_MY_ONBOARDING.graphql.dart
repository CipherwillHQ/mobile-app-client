import 'package:gql/ast.dart';

class Query$GET_MY_ONBOARDING {
  Query$GET_MY_ONBOARDING({
    required this.getMyOnboarding,
    this.$__typename = 'Query',
  });

  factory Query$GET_MY_ONBOARDING.fromJson(Map<String, dynamic> json) {
    final l$getMyOnboarding = json['getMyOnboarding'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_ONBOARDING(
      getMyOnboarding: Query$GET_MY_ONBOARDING$getMyOnboarding.fromJson(
        (l$getMyOnboarding as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_MY_ONBOARDING$getMyOnboarding getMyOnboarding;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMyOnboarding = getMyOnboarding;
    _resultData['getMyOnboarding'] = l$getMyOnboarding.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMyOnboarding = getMyOnboarding;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getMyOnboarding, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_MY_ONBOARDING || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMyOnboarding = getMyOnboarding;
    final lOther$getMyOnboarding = other.getMyOnboarding;
    if (l$getMyOnboarding != lOther$getMyOnboarding) {
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

extension UtilityExtension$Query$GET_MY_ONBOARDING on Query$GET_MY_ONBOARDING {
  CopyWith$Query$GET_MY_ONBOARDING<Query$GET_MY_ONBOARDING> get copyWith =>
      CopyWith$Query$GET_MY_ONBOARDING(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_ONBOARDING<TRes> {
  factory CopyWith$Query$GET_MY_ONBOARDING(
    Query$GET_MY_ONBOARDING instance,
    TRes Function(Query$GET_MY_ONBOARDING) then,
  ) = _CopyWithImpl$Query$GET_MY_ONBOARDING;

  factory CopyWith$Query$GET_MY_ONBOARDING.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_ONBOARDING;

  TRes call({
    Query$GET_MY_ONBOARDING$getMyOnboarding? getMyOnboarding,
    String? $__typename,
  });
  CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes> get getMyOnboarding;
}

class _CopyWithImpl$Query$GET_MY_ONBOARDING<TRes>
    implements CopyWith$Query$GET_MY_ONBOARDING<TRes> {
  _CopyWithImpl$Query$GET_MY_ONBOARDING(this._instance, this._then);

  final Query$GET_MY_ONBOARDING _instance;

  final TRes Function(Query$GET_MY_ONBOARDING) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMyOnboarding = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_ONBOARDING(
      getMyOnboarding: getMyOnboarding == _undefined || getMyOnboarding == null
          ? _instance.getMyOnboarding
          : (getMyOnboarding as Query$GET_MY_ONBOARDING$getMyOnboarding),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes> get getMyOnboarding {
    final local$getMyOnboarding = _instance.getMyOnboarding;
    return CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding(
      local$getMyOnboarding,
      (e) => call(getMyOnboarding: e),
    );
  }
}

class _CopyWithStubImpl$Query$GET_MY_ONBOARDING<TRes>
    implements CopyWith$Query$GET_MY_ONBOARDING<TRes> {
  _CopyWithStubImpl$Query$GET_MY_ONBOARDING(this._res);

  TRes _res;

  call({
    Query$GET_MY_ONBOARDING$getMyOnboarding? getMyOnboarding,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes> get getMyOnboarding =>
      CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding.stub(_res);
}

const documentNodeQueryGET_MY_ONBOARDING = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_MY_ONBOARDING'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getMyOnboarding'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'user_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'is_completed'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'heard_from_option_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'heard_from_custom'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'expectations_selected_ids'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'expectations_custom'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'heard_from_options_catalog'),
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
                        name: NameNode(value: 'label'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'requires_custom_text'),
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
                  name: NameNode(value: 'expectation_options_catalog'),
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
                        name: NameNode(value: 'label'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'requires_custom_text'),
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
                  name: NameNode(value: 'completed_at'),
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

class Query$GET_MY_ONBOARDING$getMyOnboarding {
  Query$GET_MY_ONBOARDING$getMyOnboarding({
    required this.user_id,
    required this.is_completed,
    this.heard_from_option_id,
    this.heard_from_custom,
    required this.expectations_selected_ids,
    this.expectations_custom,
    required this.heard_from_options_catalog,
    required this.expectation_options_catalog,
    this.completed_at,
    this.created_at,
    this.updated_at,
    this.$__typename = 'MyOnboarding',
  });

  factory Query$GET_MY_ONBOARDING$getMyOnboarding.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$user_id = json['user_id'];
    final l$is_completed = json['is_completed'];
    final l$heard_from_option_id = json['heard_from_option_id'];
    final l$heard_from_custom = json['heard_from_custom'];
    final l$expectations_selected_ids = json['expectations_selected_ids'];
    final l$expectations_custom = json['expectations_custom'];
    final l$heard_from_options_catalog = json['heard_from_options_catalog'];
    final l$expectation_options_catalog = json['expectation_options_catalog'];
    final l$completed_at = json['completed_at'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_ONBOARDING$getMyOnboarding(
      user_id: (l$user_id as String),
      is_completed: (l$is_completed as bool),
      heard_from_option_id: (l$heard_from_option_id as String?),
      heard_from_custom: (l$heard_from_custom as String?),
      expectations_selected_ids: (l$expectations_selected_ids as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      expectations_custom: (l$expectations_custom as String?),
      heard_from_options_catalog: (l$heard_from_options_catalog as List<dynamic>)
          .map(
            (e) =>
                Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      expectation_options_catalog: (l$expectation_options_catalog as List<dynamic>)
          .map(
            (e) =>
                Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog.fromJson(
                  (e as Map<String, dynamic>),
                ),
          )
          .toList(),
      completed_at: (l$completed_at as String?),
      created_at: (l$created_at as String?),
      updated_at: (l$updated_at as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String user_id;

  final bool is_completed;

  final String? heard_from_option_id;

  final String? heard_from_custom;

  final List<String> expectations_selected_ids;

  final String? expectations_custom;

  final List<Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog>
  heard_from_options_catalog;

  final List<
    Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
  >
  expectation_options_catalog;

  final String? completed_at;

  final String? created_at;

  final String? updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$is_completed = is_completed;
    _resultData['is_completed'] = l$is_completed;
    final l$heard_from_option_id = heard_from_option_id;
    _resultData['heard_from_option_id'] = l$heard_from_option_id;
    final l$heard_from_custom = heard_from_custom;
    _resultData['heard_from_custom'] = l$heard_from_custom;
    final l$expectations_selected_ids = expectations_selected_ids;
    _resultData['expectations_selected_ids'] = l$expectations_selected_ids
        .map((e) => e)
        .toList();
    final l$expectations_custom = expectations_custom;
    _resultData['expectations_custom'] = l$expectations_custom;
    final l$heard_from_options_catalog = heard_from_options_catalog;
    _resultData['heard_from_options_catalog'] = l$heard_from_options_catalog
        .map((e) => e.toJson())
        .toList();
    final l$expectation_options_catalog = expectation_options_catalog;
    _resultData['expectation_options_catalog'] = l$expectation_options_catalog
        .map((e) => e.toJson())
        .toList();
    final l$completed_at = completed_at;
    _resultData['completed_at'] = l$completed_at;
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
    final l$user_id = user_id;
    final l$is_completed = is_completed;
    final l$heard_from_option_id = heard_from_option_id;
    final l$heard_from_custom = heard_from_custom;
    final l$expectations_selected_ids = expectations_selected_ids;
    final l$expectations_custom = expectations_custom;
    final l$heard_from_options_catalog = heard_from_options_catalog;
    final l$expectation_options_catalog = expectation_options_catalog;
    final l$completed_at = completed_at;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
      l$is_completed,
      l$heard_from_option_id,
      l$heard_from_custom,
      Object.hashAll(l$expectations_selected_ids.map((v) => v)),
      l$expectations_custom,
      Object.hashAll(l$heard_from_options_catalog.map((v) => v)),
      Object.hashAll(l$expectation_options_catalog.map((v) => v)),
      l$completed_at,
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
    if (other is! Query$GET_MY_ONBOARDING$getMyOnboarding ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$is_completed = is_completed;
    final lOther$is_completed = other.is_completed;
    if (l$is_completed != lOther$is_completed) {
      return false;
    }
    final l$heard_from_option_id = heard_from_option_id;
    final lOther$heard_from_option_id = other.heard_from_option_id;
    if (l$heard_from_option_id != lOther$heard_from_option_id) {
      return false;
    }
    final l$heard_from_custom = heard_from_custom;
    final lOther$heard_from_custom = other.heard_from_custom;
    if (l$heard_from_custom != lOther$heard_from_custom) {
      return false;
    }
    final l$expectations_selected_ids = expectations_selected_ids;
    final lOther$expectations_selected_ids = other.expectations_selected_ids;
    if (l$expectations_selected_ids.length !=
        lOther$expectations_selected_ids.length) {
      return false;
    }
    for (int i = 0; i < l$expectations_selected_ids.length; i++) {
      final l$expectations_selected_ids$entry = l$expectations_selected_ids[i];
      final lOther$expectations_selected_ids$entry =
          lOther$expectations_selected_ids[i];
      if (l$expectations_selected_ids$entry !=
          lOther$expectations_selected_ids$entry) {
        return false;
      }
    }
    final l$expectations_custom = expectations_custom;
    final lOther$expectations_custom = other.expectations_custom;
    if (l$expectations_custom != lOther$expectations_custom) {
      return false;
    }
    final l$heard_from_options_catalog = heard_from_options_catalog;
    final lOther$heard_from_options_catalog = other.heard_from_options_catalog;
    if (l$heard_from_options_catalog.length !=
        lOther$heard_from_options_catalog.length) {
      return false;
    }
    for (int i = 0; i < l$heard_from_options_catalog.length; i++) {
      final l$heard_from_options_catalog$entry =
          l$heard_from_options_catalog[i];
      final lOther$heard_from_options_catalog$entry =
          lOther$heard_from_options_catalog[i];
      if (l$heard_from_options_catalog$entry !=
          lOther$heard_from_options_catalog$entry) {
        return false;
      }
    }
    final l$expectation_options_catalog = expectation_options_catalog;
    final lOther$expectation_options_catalog =
        other.expectation_options_catalog;
    if (l$expectation_options_catalog.length !=
        lOther$expectation_options_catalog.length) {
      return false;
    }
    for (int i = 0; i < l$expectation_options_catalog.length; i++) {
      final l$expectation_options_catalog$entry =
          l$expectation_options_catalog[i];
      final lOther$expectation_options_catalog$entry =
          lOther$expectation_options_catalog[i];
      if (l$expectation_options_catalog$entry !=
          lOther$expectation_options_catalog$entry) {
        return false;
      }
    }
    final l$completed_at = completed_at;
    final lOther$completed_at = other.completed_at;
    if (l$completed_at != lOther$completed_at) {
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

extension UtilityExtension$Query$GET_MY_ONBOARDING$getMyOnboarding
    on Query$GET_MY_ONBOARDING$getMyOnboarding {
  CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<
    Query$GET_MY_ONBOARDING$getMyOnboarding
  >
  get copyWith =>
      CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes> {
  factory CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding(
    Query$GET_MY_ONBOARDING$getMyOnboarding instance,
    TRes Function(Query$GET_MY_ONBOARDING$getMyOnboarding) then,
  ) = _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding;

  factory CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding;

  TRes call({
    String? user_id,
    bool? is_completed,
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    List<Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog>?
    heard_from_options_catalog,
    List<Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog>?
    expectation_options_catalog,
    String? completed_at,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
  TRes heard_from_options_catalog(
    Iterable<Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog>
    Function(
      Iterable<
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
          Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog
        >
      >,
    )
    _fn,
  );
  TRes expectation_options_catalog(
    Iterable<
      Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
    >
    Function(
      Iterable<
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
          Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes>
    implements CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes> {
  _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding(
    this._instance,
    this._then,
  );

  final Query$GET_MY_ONBOARDING$getMyOnboarding _instance;

  final TRes Function(Query$GET_MY_ONBOARDING$getMyOnboarding) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? is_completed = _undefined,
    Object? heard_from_option_id = _undefined,
    Object? heard_from_custom = _undefined,
    Object? expectations_selected_ids = _undefined,
    Object? expectations_custom = _undefined,
    Object? heard_from_options_catalog = _undefined,
    Object? expectation_options_catalog = _undefined,
    Object? completed_at = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_ONBOARDING$getMyOnboarding(
      user_id: user_id == _undefined || user_id == null
          ? _instance.user_id
          : (user_id as String),
      is_completed: is_completed == _undefined || is_completed == null
          ? _instance.is_completed
          : (is_completed as bool),
      heard_from_option_id: heard_from_option_id == _undefined
          ? _instance.heard_from_option_id
          : (heard_from_option_id as String?),
      heard_from_custom: heard_from_custom == _undefined
          ? _instance.heard_from_custom
          : (heard_from_custom as String?),
      expectations_selected_ids:
          expectations_selected_ids == _undefined ||
              expectations_selected_ids == null
          ? _instance.expectations_selected_ids
          : (expectations_selected_ids as List<String>),
      expectations_custom: expectations_custom == _undefined
          ? _instance.expectations_custom
          : (expectations_custom as String?),
      heard_from_options_catalog:
          heard_from_options_catalog == _undefined ||
              heard_from_options_catalog == null
          ? _instance.heard_from_options_catalog
          : (heard_from_options_catalog
                as List<
                  Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog
                >),
      expectation_options_catalog:
          expectation_options_catalog == _undefined ||
              expectation_options_catalog == null
          ? _instance.expectation_options_catalog
          : (expectation_options_catalog
                as List<
                  Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
                >),
      completed_at: completed_at == _undefined
          ? _instance.completed_at
          : (completed_at as String?),
      created_at: created_at == _undefined
          ? _instance.created_at
          : (created_at as String?),
      updated_at: updated_at == _undefined
          ? _instance.updated_at
          : (updated_at as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes heard_from_options_catalog(
    Iterable<Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog>
    Function(
      Iterable<
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
          Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog
        >
      >,
    )
    _fn,
  ) => call(
    heard_from_options_catalog: _fn(
      _instance.heard_from_options_catalog.map(
        (e) =>
            CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );

  TRes expectation_options_catalog(
    Iterable<
      Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
    >
    Function(
      Iterable<
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
          Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
        >
      >,
    )
    _fn,
  ) => call(
    expectation_options_catalog: _fn(
      _instance.expectation_options_catalog.map(
        (e) =>
            CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
              e,
              (i) => i,
            ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes>
    implements CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding<TRes> {
  _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding(this._res);

  TRes _res;

  call({
    String? user_id,
    bool? is_completed,
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    List<Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog>?
    heard_from_options_catalog,
    List<Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog>?
    expectation_options_catalog,
    String? completed_at,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;

  heard_from_options_catalog(_fn) => _res;

  expectation_options_catalog(_fn) => _res;
}

class Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog {
  Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog({
    required this.id,
    required this.label,
    required this.requires_custom_text,
    this.$__typename = 'OnboardingOption',
  });

  factory Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$label = json['label'];
    final l$requires_custom_text = json['requires_custom_text'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
      id: (l$id as String),
      label: (l$label as String),
      requires_custom_text: (l$requires_custom_text as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String label;

  final bool requires_custom_text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$label = label;
    _resultData['label'] = l$label;
    final l$requires_custom_text = requires_custom_text;
    _resultData['requires_custom_text'] = l$requires_custom_text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$label = label;
    final l$requires_custom_text = requires_custom_text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$label,
      l$requires_custom_text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$requires_custom_text = requires_custom_text;
    final lOther$requires_custom_text = other.requires_custom_text;
    if (l$requires_custom_text != lOther$requires_custom_text) {
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

extension UtilityExtension$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog
    on Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog {
  CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
    Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog
  >
  get copyWith =>
      CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
  TRes
> {
  factory CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
    Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog instance,
    TRes Function(
      Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog,
    )
    then,
  ) = _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog;

  factory CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog;

  TRes call({
    String? id,
    String? label,
    bool? requires_custom_text,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
  TRes
>
    implements
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
          TRes
        > {
  _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
    this._instance,
    this._then,
  );

  final Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog
  _instance;

  final TRes Function(
    Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? label = _undefined,
    Object? requires_custom_text = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      label: label == _undefined || label == null
          ? _instance.label
          : (label as String),
      requires_custom_text:
          requires_custom_text == _undefined || requires_custom_text == null
          ? _instance.requires_custom_text
          : (requires_custom_text as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
  TRes
>
    implements
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$heard_from_options_catalog(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? label,
    bool? requires_custom_text,
    String? $__typename,
  }) => _res;
}

class Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog {
  Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog({
    required this.id,
    required this.label,
    required this.requires_custom_text,
    this.$__typename = 'OnboardingOption',
  });

  factory Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$label = json['label'];
    final l$requires_custom_text = json['requires_custom_text'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
      id: (l$id as String),
      label: (l$label as String),
      requires_custom_text: (l$requires_custom_text as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String label;

  final bool requires_custom_text;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$label = label;
    _resultData['label'] = l$label;
    final l$requires_custom_text = requires_custom_text;
    _resultData['requires_custom_text'] = l$requires_custom_text;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$label = label;
    final l$requires_custom_text = requires_custom_text;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$label,
      l$requires_custom_text,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$requires_custom_text = requires_custom_text;
    final lOther$requires_custom_text = other.requires_custom_text;
    if (l$requires_custom_text != lOther$requires_custom_text) {
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

extension UtilityExtension$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
    on Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog {
  CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
    Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
  >
  get copyWith =>
      CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
  TRes
> {
  factory CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
    Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
    instance,
    TRes Function(
      Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog,
    )
    then,
  ) = _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog;

  factory CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog;

  TRes call({
    String? id,
    String? label,
    bool? requires_custom_text,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
  TRes
>
    implements
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
          TRes
        > {
  _CopyWithImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
    this._instance,
    this._then,
  );

  final Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog
  _instance;

  final TRes Function(
    Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? label = _undefined,
    Object? requires_custom_text = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      label: label == _undefined || label == null
          ? _instance.label
          : (label as String),
      requires_custom_text:
          requires_custom_text == _undefined || requires_custom_text == null
          ? _instance.requires_custom_text
          : (requires_custom_text as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
  TRes
>
    implements
        CopyWith$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog<
          TRes
        > {
  _CopyWithStubImpl$Query$GET_MY_ONBOARDING$getMyOnboarding$expectation_options_catalog(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? label,
    bool? requires_custom_text,
    String? $__typename,
  }) => _res;
}
