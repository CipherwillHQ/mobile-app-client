import 'package:gql/ast.dart';

class Query$GET_USER_SCORE {
  Query$GET_USER_SCORE({
    required this.getUserScore,
    this.$__typename = 'Query',
  });

  factory Query$GET_USER_SCORE.fromJson(Map<String, dynamic> json) {
    final l$getUserScore = json['getUserScore'];
    final l$$__typename = json['__typename'];
    return Query$GET_USER_SCORE(
      getUserScore: (l$getUserScore as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String getUserScore;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUserScore = getUserScore;
    _resultData['getUserScore'] = l$getUserScore;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUserScore = getUserScore;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getUserScore, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_USER_SCORE || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUserScore = getUserScore;
    final lOther$getUserScore = other.getUserScore;
    if (l$getUserScore != lOther$getUserScore) {
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

extension UtilityExtension$Query$GET_USER_SCORE on Query$GET_USER_SCORE {
  CopyWith$Query$GET_USER_SCORE<Query$GET_USER_SCORE> get copyWith =>
      CopyWith$Query$GET_USER_SCORE(this, (i) => i);
}

abstract class CopyWith$Query$GET_USER_SCORE<TRes> {
  factory CopyWith$Query$GET_USER_SCORE(
    Query$GET_USER_SCORE instance,
    TRes Function(Query$GET_USER_SCORE) then,
  ) = _CopyWithImpl$Query$GET_USER_SCORE;

  factory CopyWith$Query$GET_USER_SCORE.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_USER_SCORE;

  TRes call({String? getUserScore, String? $__typename});
}

class _CopyWithImpl$Query$GET_USER_SCORE<TRes>
    implements CopyWith$Query$GET_USER_SCORE<TRes> {
  _CopyWithImpl$Query$GET_USER_SCORE(this._instance, this._then);

  final Query$GET_USER_SCORE _instance;

  final TRes Function(Query$GET_USER_SCORE) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUserScore = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_USER_SCORE(
      getUserScore: getUserScore == _undefined || getUserScore == null
          ? _instance.getUserScore
          : (getUserScore as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_USER_SCORE<TRes>
    implements CopyWith$Query$GET_USER_SCORE<TRes> {
  _CopyWithStubImpl$Query$GET_USER_SCORE(this._res);

  TRes _res;

  call({String? getUserScore, String? $__typename}) => _res;
}

const documentNodeQueryGET_USER_SCORE = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_USER_SCORE'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getUserScore'),
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
