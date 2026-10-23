import 'package:gql/ast.dart';

class Query$GUIDANCE_BOOTSTRAP {
  Query$GUIDANCE_BOOTSTRAP({
    required this.getGuidedObjectiveCatalog,
    required this.getGuidedActionCompletions,
    required this.getGuidedActionSkips,
    required this.getGuidedActionDeferrals,
    required this.getGuidedActionRecovery,
    required this.getGuidedAssetCounts,
    this.$__typename = 'Query',
  });

  factory Query$GUIDANCE_BOOTSTRAP.fromJson(Map<String, dynamic> json) {
    final l$getGuidedObjectiveCatalog = json['getGuidedObjectiveCatalog'];
    final l$getGuidedActionCompletions = json['getGuidedActionCompletions'];
    final l$getGuidedActionSkips = json['getGuidedActionSkips'];
    final l$getGuidedActionDeferrals = json['getGuidedActionDeferrals'];
    final l$getGuidedActionRecovery = json['getGuidedActionRecovery'];
    final l$getGuidedAssetCounts = json['getGuidedAssetCounts'];
    final l$$__typename = json['__typename'];
    return Query$GUIDANCE_BOOTSTRAP(
      getGuidedObjectiveCatalog: (l$getGuidedObjectiveCatalog as Object),
      getGuidedActionCompletions:
          (l$getGuidedActionCompletions as List<dynamic>)
              .map((e) => (e as String))
              .toList(),
      getGuidedActionSkips: (l$getGuidedActionSkips as List<dynamic>)
          .map((e) => (e as String))
          .toList(),
      getGuidedActionDeferrals: (l$getGuidedActionDeferrals as List<dynamic>)
          .map(
            (e) => Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      getGuidedActionRecovery: (l$getGuidedActionRecovery as Object),
      getGuidedAssetCounts: (l$getGuidedAssetCounts as Object),
      $__typename: (l$$__typename as String),
    );
  }

  final Object getGuidedObjectiveCatalog;

  final List<String> getGuidedActionCompletions;

  final List<String> getGuidedActionSkips;

  final List<Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals>
  getGuidedActionDeferrals;

  final Object getGuidedActionRecovery;

  final Object getGuidedAssetCounts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getGuidedObjectiveCatalog = getGuidedObjectiveCatalog;
    _resultData['getGuidedObjectiveCatalog'] = l$getGuidedObjectiveCatalog;
    final l$getGuidedActionCompletions = getGuidedActionCompletions;
    _resultData['getGuidedActionCompletions'] = l$getGuidedActionCompletions
        .map((e) => e)
        .toList();
    final l$getGuidedActionSkips = getGuidedActionSkips;
    _resultData['getGuidedActionSkips'] = l$getGuidedActionSkips
        .map((e) => e)
        .toList();
    final l$getGuidedActionDeferrals = getGuidedActionDeferrals;
    _resultData['getGuidedActionDeferrals'] = l$getGuidedActionDeferrals
        .map((e) => e.toJson())
        .toList();
    final l$getGuidedActionRecovery = getGuidedActionRecovery;
    _resultData['getGuidedActionRecovery'] = l$getGuidedActionRecovery;
    final l$getGuidedAssetCounts = getGuidedAssetCounts;
    _resultData['getGuidedAssetCounts'] = l$getGuidedAssetCounts;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getGuidedObjectiveCatalog = getGuidedObjectiveCatalog;
    final l$getGuidedActionCompletions = getGuidedActionCompletions;
    final l$getGuidedActionSkips = getGuidedActionSkips;
    final l$getGuidedActionDeferrals = getGuidedActionDeferrals;
    final l$getGuidedActionRecovery = getGuidedActionRecovery;
    final l$getGuidedAssetCounts = getGuidedAssetCounts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getGuidedObjectiveCatalog,
      Object.hashAll(l$getGuidedActionCompletions.map((v) => v)),
      Object.hashAll(l$getGuidedActionSkips.map((v) => v)),
      Object.hashAll(l$getGuidedActionDeferrals.map((v) => v)),
      l$getGuidedActionRecovery,
      l$getGuidedAssetCounts,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GUIDANCE_BOOTSTRAP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getGuidedObjectiveCatalog = getGuidedObjectiveCatalog;
    final lOther$getGuidedObjectiveCatalog = other.getGuidedObjectiveCatalog;
    if (l$getGuidedObjectiveCatalog != lOther$getGuidedObjectiveCatalog) {
      return false;
    }
    final l$getGuidedActionCompletions = getGuidedActionCompletions;
    final lOther$getGuidedActionCompletions = other.getGuidedActionCompletions;
    if (l$getGuidedActionCompletions.length !=
        lOther$getGuidedActionCompletions.length) {
      return false;
    }
    for (int i = 0; i < l$getGuidedActionCompletions.length; i++) {
      final l$getGuidedActionCompletions$entry =
          l$getGuidedActionCompletions[i];
      final lOther$getGuidedActionCompletions$entry =
          lOther$getGuidedActionCompletions[i];
      if (l$getGuidedActionCompletions$entry !=
          lOther$getGuidedActionCompletions$entry) {
        return false;
      }
    }
    final l$getGuidedActionSkips = getGuidedActionSkips;
    final lOther$getGuidedActionSkips = other.getGuidedActionSkips;
    if (l$getGuidedActionSkips.length != lOther$getGuidedActionSkips.length) {
      return false;
    }
    for (int i = 0; i < l$getGuidedActionSkips.length; i++) {
      final l$getGuidedActionSkips$entry = l$getGuidedActionSkips[i];
      final lOther$getGuidedActionSkips$entry = lOther$getGuidedActionSkips[i];
      if (l$getGuidedActionSkips$entry != lOther$getGuidedActionSkips$entry) {
        return false;
      }
    }
    final l$getGuidedActionDeferrals = getGuidedActionDeferrals;
    final lOther$getGuidedActionDeferrals = other.getGuidedActionDeferrals;
    if (l$getGuidedActionDeferrals.length !=
        lOther$getGuidedActionDeferrals.length) {
      return false;
    }
    for (int i = 0; i < l$getGuidedActionDeferrals.length; i++) {
      final l$getGuidedActionDeferrals$entry = l$getGuidedActionDeferrals[i];
      final lOther$getGuidedActionDeferrals$entry =
          lOther$getGuidedActionDeferrals[i];
      if (l$getGuidedActionDeferrals$entry !=
          lOther$getGuidedActionDeferrals$entry) {
        return false;
      }
    }
    final l$getGuidedActionRecovery = getGuidedActionRecovery;
    final lOther$getGuidedActionRecovery = other.getGuidedActionRecovery;
    if (l$getGuidedActionRecovery != lOther$getGuidedActionRecovery) {
      return false;
    }
    final l$getGuidedAssetCounts = getGuidedAssetCounts;
    final lOther$getGuidedAssetCounts = other.getGuidedAssetCounts;
    if (l$getGuidedAssetCounts != lOther$getGuidedAssetCounts) {
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

extension UtilityExtension$Query$GUIDANCE_BOOTSTRAP
    on Query$GUIDANCE_BOOTSTRAP {
  CopyWith$Query$GUIDANCE_BOOTSTRAP<Query$GUIDANCE_BOOTSTRAP> get copyWith =>
      CopyWith$Query$GUIDANCE_BOOTSTRAP(this, (i) => i);
}

abstract class CopyWith$Query$GUIDANCE_BOOTSTRAP<TRes> {
  factory CopyWith$Query$GUIDANCE_BOOTSTRAP(
    Query$GUIDANCE_BOOTSTRAP instance,
    TRes Function(Query$GUIDANCE_BOOTSTRAP) then,
  ) = _CopyWithImpl$Query$GUIDANCE_BOOTSTRAP;

  factory CopyWith$Query$GUIDANCE_BOOTSTRAP.stub(TRes res) =
      _CopyWithStubImpl$Query$GUIDANCE_BOOTSTRAP;

  TRes call({
    Object? getGuidedObjectiveCatalog,
    List<String>? getGuidedActionCompletions,
    List<String>? getGuidedActionSkips,
    List<Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals>?
    getGuidedActionDeferrals,
    Object? getGuidedActionRecovery,
    Object? getGuidedAssetCounts,
    String? $__typename,
  });
  TRes getGuidedActionDeferrals(
    Iterable<Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals> Function(
      Iterable<
        CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<
          Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GUIDANCE_BOOTSTRAP<TRes>
    implements CopyWith$Query$GUIDANCE_BOOTSTRAP<TRes> {
  _CopyWithImpl$Query$GUIDANCE_BOOTSTRAP(this._instance, this._then);

  final Query$GUIDANCE_BOOTSTRAP _instance;

  final TRes Function(Query$GUIDANCE_BOOTSTRAP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getGuidedObjectiveCatalog = _undefined,
    Object? getGuidedActionCompletions = _undefined,
    Object? getGuidedActionSkips = _undefined,
    Object? getGuidedActionDeferrals = _undefined,
    Object? getGuidedActionRecovery = _undefined,
    Object? getGuidedAssetCounts = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GUIDANCE_BOOTSTRAP(
      getGuidedObjectiveCatalog:
          getGuidedObjectiveCatalog == _undefined ||
              getGuidedObjectiveCatalog == null
          ? _instance.getGuidedObjectiveCatalog
          : (getGuidedObjectiveCatalog as Object),
      getGuidedActionCompletions:
          getGuidedActionCompletions == _undefined ||
              getGuidedActionCompletions == null
          ? _instance.getGuidedActionCompletions
          : (getGuidedActionCompletions as List<String>),
      getGuidedActionSkips:
          getGuidedActionSkips == _undefined || getGuidedActionSkips == null
          ? _instance.getGuidedActionSkips
          : (getGuidedActionSkips as List<String>),
      getGuidedActionDeferrals:
          getGuidedActionDeferrals == _undefined ||
              getGuidedActionDeferrals == null
          ? _instance.getGuidedActionDeferrals
          : (getGuidedActionDeferrals
                as List<Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals>),
      getGuidedActionRecovery:
          getGuidedActionRecovery == _undefined ||
              getGuidedActionRecovery == null
          ? _instance.getGuidedActionRecovery
          : (getGuidedActionRecovery as Object),
      getGuidedAssetCounts:
          getGuidedAssetCounts == _undefined || getGuidedAssetCounts == null
          ? _instance.getGuidedAssetCounts
          : (getGuidedAssetCounts as Object),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getGuidedActionDeferrals(
    Iterable<Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals> Function(
      Iterable<
        CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<
          Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals
        >
      >,
    )
    _fn,
  ) => call(
    getGuidedActionDeferrals: _fn(
      _instance.getGuidedActionDeferrals.map(
        (e) => CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
          e,
          (i) => i,
        ),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GUIDANCE_BOOTSTRAP<TRes>
    implements CopyWith$Query$GUIDANCE_BOOTSTRAP<TRes> {
  _CopyWithStubImpl$Query$GUIDANCE_BOOTSTRAP(this._res);

  TRes _res;

  call({
    Object? getGuidedObjectiveCatalog,
    List<String>? getGuidedActionCompletions,
    List<String>? getGuidedActionSkips,
    List<Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals>?
    getGuidedActionDeferrals,
    Object? getGuidedActionRecovery,
    Object? getGuidedAssetCounts,
    String? $__typename,
  }) => _res;

  getGuidedActionDeferrals(_fn) => _res;
}

const documentNodeQueryGUIDANCE_BOOTSTRAP = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GUIDANCE_BOOTSTRAP'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getGuidedObjectiveCatalog'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'getGuidedActionCompletions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'getGuidedActionSkips'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'getGuidedActionDeferrals'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'objectiveId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'resumeAfter'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'dismissed'),
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
            name: NameNode(value: 'getGuidedActionRecovery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'getGuidedAssetCounts'),
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

class Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals {
  Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals({
    required this.objectiveId,
    this.resumeAfter,
    required this.dismissed,
    this.$__typename = 'GuidedActionDeferral',
  });

  factory Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$objectiveId = json['objectiveId'];
    final l$resumeAfter = json['resumeAfter'];
    final l$dismissed = json['dismissed'];
    final l$$__typename = json['__typename'];
    return Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
      objectiveId: (l$objectiveId as String),
      resumeAfter: (l$resumeAfter as String?),
      dismissed: (l$dismissed as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String objectiveId;

  final String? resumeAfter;

  final bool dismissed;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$objectiveId = objectiveId;
    _resultData['objectiveId'] = l$objectiveId;
    final l$resumeAfter = resumeAfter;
    _resultData['resumeAfter'] = l$resumeAfter;
    final l$dismissed = dismissed;
    _resultData['dismissed'] = l$dismissed;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$objectiveId = objectiveId;
    final l$resumeAfter = resumeAfter;
    final l$dismissed = dismissed;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$objectiveId,
      l$resumeAfter,
      l$dismissed,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$objectiveId = objectiveId;
    final lOther$objectiveId = other.objectiveId;
    if (l$objectiveId != lOther$objectiveId) {
      return false;
    }
    final l$resumeAfter = resumeAfter;
    final lOther$resumeAfter = other.resumeAfter;
    if (l$resumeAfter != lOther$resumeAfter) {
      return false;
    }
    final l$dismissed = dismissed;
    final lOther$dismissed = other.dismissed;
    if (l$dismissed != lOther$dismissed) {
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

extension UtilityExtension$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals
    on Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals {
  CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<
    Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals
  >
  get copyWith => CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<
  TRes
> {
  factory CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
    Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals instance,
    TRes Function(Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals) then,
  ) = _CopyWithImpl$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals;

  factory CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals;

  TRes call({
    String? objectiveId,
    String? resumeAfter,
    bool? dismissed,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<TRes>
    implements
        CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<TRes> {
  _CopyWithImpl$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
    this._instance,
    this._then,
  );

  final Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals _instance;

  final TRes Function(Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? objectiveId = _undefined,
    Object? resumeAfter = _undefined,
    Object? dismissed = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
      objectiveId: objectiveId == _undefined || objectiveId == null
          ? _instance.objectiveId
          : (objectiveId as String),
      resumeAfter: resumeAfter == _undefined
          ? _instance.resumeAfter
          : (resumeAfter as String?),
      dismissed: dismissed == _undefined || dismissed == null
          ? _instance.dismissed
          : (dismissed as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<TRes>
    implements
        CopyWith$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals<TRes> {
  _CopyWithStubImpl$Query$GUIDANCE_BOOTSTRAP$getGuidedActionDeferrals(
    this._res,
  );

  TRes _res;

  call({
    String? objectiveId,
    String? resumeAfter,
    bool? dismissed,
    String? $__typename,
  }) => _res;
}
