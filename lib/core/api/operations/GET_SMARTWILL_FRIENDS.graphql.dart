import 'package:gql/ast.dart';

class Query$GET_SMARTWILL_FRIENDS {
  Query$GET_SMARTWILL_FRIENDS({
    this.getSmartWillFriends,
    this.$__typename = 'Query',
  });

  factory Query$GET_SMARTWILL_FRIENDS.fromJson(Map<String, dynamic> json) {
    final l$getSmartWillFriends = json['getSmartWillFriends'];
    final l$$__typename = json['__typename'];
    return Query$GET_SMARTWILL_FRIENDS(
      getSmartWillFriends: (l$getSmartWillFriends as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<String?>? getSmartWillFriends;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSmartWillFriends = getSmartWillFriends;
    _resultData['getSmartWillFriends'] = l$getSmartWillFriends
        ?.map((e) => e)
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSmartWillFriends = getSmartWillFriends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSmartWillFriends == null
          ? null
          : Object.hashAll(l$getSmartWillFriends.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_SMARTWILL_FRIENDS ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSmartWillFriends = getSmartWillFriends;
    final lOther$getSmartWillFriends = other.getSmartWillFriends;
    if (l$getSmartWillFriends != null && lOther$getSmartWillFriends != null) {
      if (l$getSmartWillFriends.length != lOther$getSmartWillFriends.length) {
        return false;
      }
      for (int i = 0; i < l$getSmartWillFriends.length; i++) {
        final l$getSmartWillFriends$entry = l$getSmartWillFriends[i];
        final lOther$getSmartWillFriends$entry = lOther$getSmartWillFriends[i];
        if (l$getSmartWillFriends$entry != lOther$getSmartWillFriends$entry) {
          return false;
        }
      }
    } else if (l$getSmartWillFriends != lOther$getSmartWillFriends) {
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

extension UtilityExtension$Query$GET_SMARTWILL_FRIENDS
    on Query$GET_SMARTWILL_FRIENDS {
  CopyWith$Query$GET_SMARTWILL_FRIENDS<Query$GET_SMARTWILL_FRIENDS>
  get copyWith => CopyWith$Query$GET_SMARTWILL_FRIENDS(this, (i) => i);
}

abstract class CopyWith$Query$GET_SMARTWILL_FRIENDS<TRes> {
  factory CopyWith$Query$GET_SMARTWILL_FRIENDS(
    Query$GET_SMARTWILL_FRIENDS instance,
    TRes Function(Query$GET_SMARTWILL_FRIENDS) then,
  ) = _CopyWithImpl$Query$GET_SMARTWILL_FRIENDS;

  factory CopyWith$Query$GET_SMARTWILL_FRIENDS.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_SMARTWILL_FRIENDS;

  TRes call({List<String?>? getSmartWillFriends, String? $__typename});
}

class _CopyWithImpl$Query$GET_SMARTWILL_FRIENDS<TRes>
    implements CopyWith$Query$GET_SMARTWILL_FRIENDS<TRes> {
  _CopyWithImpl$Query$GET_SMARTWILL_FRIENDS(this._instance, this._then);

  final Query$GET_SMARTWILL_FRIENDS _instance;

  final TRes Function(Query$GET_SMARTWILL_FRIENDS) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSmartWillFriends = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_SMARTWILL_FRIENDS(
      getSmartWillFriends: getSmartWillFriends == _undefined
          ? _instance.getSmartWillFriends
          : (getSmartWillFriends as List<String?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_SMARTWILL_FRIENDS<TRes>
    implements CopyWith$Query$GET_SMARTWILL_FRIENDS<TRes> {
  _CopyWithStubImpl$Query$GET_SMARTWILL_FRIENDS(this._res);

  TRes _res;

  call({List<String?>? getSmartWillFriends, String? $__typename}) => _res;
}

const documentNodeQueryGET_SMARTWILL_FRIENDS = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_SMARTWILL_FRIENDS'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getSmartWillFriends'),
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
