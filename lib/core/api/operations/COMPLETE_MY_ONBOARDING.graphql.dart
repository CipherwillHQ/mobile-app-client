import '../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$COMPLETE_MY_ONBOARDING {
  factory Variables$Mutation$COMPLETE_MY_ONBOARDING({
    required Input$CompleteMyOnboardingInput data,
  }) => Variables$Mutation$COMPLETE_MY_ONBOARDING._({r'data': data});

  Variables$Mutation$COMPLETE_MY_ONBOARDING._(this._$data);

  factory Variables$Mutation$COMPLETE_MY_ONBOARDING.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = Input$CompleteMyOnboardingInput.fromJson(
      (l$data as Map<String, dynamic>),
    );
    return Variables$Mutation$COMPLETE_MY_ONBOARDING._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CompleteMyOnboardingInput get data =>
      (_$data['data'] as Input$CompleteMyOnboardingInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING<
    Variables$Mutation$COMPLETE_MY_ONBOARDING
  >
  get copyWith =>
      CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$COMPLETE_MY_ONBOARDING ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }
}

abstract class CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING<TRes> {
  factory CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING(
    Variables$Mutation$COMPLETE_MY_ONBOARDING instance,
    TRes Function(Variables$Mutation$COMPLETE_MY_ONBOARDING) then,
  ) = _CopyWithImpl$Variables$Mutation$COMPLETE_MY_ONBOARDING;

  factory CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$COMPLETE_MY_ONBOARDING;

  TRes call({Input$CompleteMyOnboardingInput? data});
}

class _CopyWithImpl$Variables$Mutation$COMPLETE_MY_ONBOARDING<TRes>
    implements CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING<TRes> {
  _CopyWithImpl$Variables$Mutation$COMPLETE_MY_ONBOARDING(
    this._instance,
    this._then,
  );

  final Variables$Mutation$COMPLETE_MY_ONBOARDING _instance;

  final TRes Function(Variables$Mutation$COMPLETE_MY_ONBOARDING) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? data = _undefined}) => _then(
    Variables$Mutation$COMPLETE_MY_ONBOARDING._({
      ..._instance._$data,
      if (data != _undefined && data != null)
        'data': (data as Input$CompleteMyOnboardingInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$COMPLETE_MY_ONBOARDING<TRes>
    implements CopyWith$Variables$Mutation$COMPLETE_MY_ONBOARDING<TRes> {
  _CopyWithStubImpl$Variables$Mutation$COMPLETE_MY_ONBOARDING(this._res);

  TRes _res;

  call({Input$CompleteMyOnboardingInput? data}) => _res;
}

class Mutation$COMPLETE_MY_ONBOARDING {
  Mutation$COMPLETE_MY_ONBOARDING({
    required this.completeMyOnboarding,
    this.$__typename = 'Mutation',
  });

  factory Mutation$COMPLETE_MY_ONBOARDING.fromJson(Map<String, dynamic> json) {
    final l$completeMyOnboarding = json['completeMyOnboarding'];
    final l$$__typename = json['__typename'];
    return Mutation$COMPLETE_MY_ONBOARDING(
      completeMyOnboarding:
          Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding.fromJson(
            (l$completeMyOnboarding as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding
  completeMyOnboarding;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$completeMyOnboarding = completeMyOnboarding;
    _resultData['completeMyOnboarding'] = l$completeMyOnboarding.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$completeMyOnboarding = completeMyOnboarding;
    final l$$__typename = $__typename;
    return Object.hashAll([l$completeMyOnboarding, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$COMPLETE_MY_ONBOARDING ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$completeMyOnboarding = completeMyOnboarding;
    final lOther$completeMyOnboarding = other.completeMyOnboarding;
    if (l$completeMyOnboarding != lOther$completeMyOnboarding) {
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

extension UtilityExtension$Mutation$COMPLETE_MY_ONBOARDING
    on Mutation$COMPLETE_MY_ONBOARDING {
  CopyWith$Mutation$COMPLETE_MY_ONBOARDING<Mutation$COMPLETE_MY_ONBOARDING>
  get copyWith => CopyWith$Mutation$COMPLETE_MY_ONBOARDING(this, (i) => i);
}

abstract class CopyWith$Mutation$COMPLETE_MY_ONBOARDING<TRes> {
  factory CopyWith$Mutation$COMPLETE_MY_ONBOARDING(
    Mutation$COMPLETE_MY_ONBOARDING instance,
    TRes Function(Mutation$COMPLETE_MY_ONBOARDING) then,
  ) = _CopyWithImpl$Mutation$COMPLETE_MY_ONBOARDING;

  factory CopyWith$Mutation$COMPLETE_MY_ONBOARDING.stub(TRes res) =
      _CopyWithStubImpl$Mutation$COMPLETE_MY_ONBOARDING;

  TRes call({
    Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding? completeMyOnboarding,
    String? $__typename,
  });
  CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<TRes>
  get completeMyOnboarding;
}

class _CopyWithImpl$Mutation$COMPLETE_MY_ONBOARDING<TRes>
    implements CopyWith$Mutation$COMPLETE_MY_ONBOARDING<TRes> {
  _CopyWithImpl$Mutation$COMPLETE_MY_ONBOARDING(this._instance, this._then);

  final Mutation$COMPLETE_MY_ONBOARDING _instance;

  final TRes Function(Mutation$COMPLETE_MY_ONBOARDING) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? completeMyOnboarding = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$COMPLETE_MY_ONBOARDING(
      completeMyOnboarding:
          completeMyOnboarding == _undefined || completeMyOnboarding == null
          ? _instance.completeMyOnboarding
          : (completeMyOnboarding
                as Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<TRes>
  get completeMyOnboarding {
    final local$completeMyOnboarding = _instance.completeMyOnboarding;
    return CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
      local$completeMyOnboarding,
      (e) => call(completeMyOnboarding: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$COMPLETE_MY_ONBOARDING<TRes>
    implements CopyWith$Mutation$COMPLETE_MY_ONBOARDING<TRes> {
  _CopyWithStubImpl$Mutation$COMPLETE_MY_ONBOARDING(this._res);

  TRes _res;

  call({
    Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding? completeMyOnboarding,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<TRes>
  get completeMyOnboarding =>
      CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding.stub(_res);
}

const documentNodeMutationCOMPLETE_MY_ONBOARDING = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'COMPLETE_MY_ONBOARDING'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'data')),
          type: NamedTypeNode(
            name: NameNode(value: 'CompleteMyOnboardingInput'),
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
            name: NameNode(value: 'completeMyOnboarding'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'data'),
                value: VariableNode(name: NameNode(value: 'data')),
              ),
            ],
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
                  name: NameNode(value: 'completed_at'),
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

class Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding {
  Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding({
    required this.user_id,
    required this.is_completed,
    this.heard_from_option_id,
    this.heard_from_custom,
    required this.expectations_selected_ids,
    this.expectations_custom,
    this.completed_at,
    this.updated_at,
    this.$__typename = 'MyOnboarding',
  });

  factory Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$user_id = json['user_id'];
    final l$is_completed = json['is_completed'];
    final l$heard_from_option_id = json['heard_from_option_id'];
    final l$heard_from_custom = json['heard_from_custom'];
    final l$expectations_selected_ids = json['expectations_selected_ids'];
    final l$expectations_custom = json['expectations_custom'];
    final l$completed_at = json['completed_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
      user_id: (l$user_id as String),
      is_completed: (l$is_completed as bool),
      heard_from_option_id: (l$heard_from_option_id as String?),
      heard_from_custom: (l$heard_from_custom as String?),
      expectations_selected_ids: (l$expectations_selected_ids as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      expectations_custom: (l$expectations_custom as String?),
      completed_at: (l$completed_at as String?),
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

  final String? completed_at;

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
    final l$completed_at = completed_at;
    _resultData['completed_at'] = l$completed_at;
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
    final l$completed_at = completed_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
      l$is_completed,
      l$heard_from_option_id,
      l$heard_from_custom,
      Object.hashAll(l$expectations_selected_ids.map((v) => v)),
      l$expectations_custom,
      l$completed_at,
      l$updated_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding ||
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
    final l$completed_at = completed_at;
    final lOther$completed_at = other.completed_at;
    if (l$completed_at != lOther$completed_at) {
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

extension UtilityExtension$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding
    on Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding {
  CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<
    Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding
  >
  get copyWith => CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<
  TRes
> {
  factory CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
    Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding instance,
    TRes Function(Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding) then,
  ) = _CopyWithImpl$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding;

  factory CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding;

  TRes call({
    String? user_id,
    bool? is_completed,
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    String? completed_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<TRes>
    implements
        CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<TRes> {
  _CopyWithImpl$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
    this._instance,
    this._then,
  );

  final Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding _instance;

  final TRes Function(Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? is_completed = _undefined,
    Object? heard_from_option_id = _undefined,
    Object? heard_from_custom = _undefined,
    Object? expectations_selected_ids = _undefined,
    Object? expectations_custom = _undefined,
    Object? completed_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
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
      completed_at: completed_at == _undefined
          ? _instance.completed_at
          : (completed_at as String?),
      updated_at: updated_at == _undefined
          ? _instance.updated_at
          : (updated_at as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<
  TRes
>
    implements
        CopyWith$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding<TRes> {
  _CopyWithStubImpl$Mutation$COMPLETE_MY_ONBOARDING$completeMyOnboarding(
    this._res,
  );

  TRes _res;

  call({
    String? user_id,
    bool? is_completed,
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    String? completed_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
