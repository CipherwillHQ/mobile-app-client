import 'package:gql/ast.dart';

class Variables$Mutation$DELETE_SMARTWILL_FRIEND {
  factory Variables$Mutation$DELETE_SMARTWILL_FRIEND({required String id}) =>
      Variables$Mutation$DELETE_SMARTWILL_FRIEND._({r'id': id});

  Variables$Mutation$DELETE_SMARTWILL_FRIEND._(this._$data);

  factory Variables$Mutation$DELETE_SMARTWILL_FRIEND.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DELETE_SMARTWILL_FRIEND._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND<
    Variables$Mutation$DELETE_SMARTWILL_FRIEND
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DELETE_SMARTWILL_FRIEND ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND<TRes> {
  factory CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND(
    Variables$Mutation$DELETE_SMARTWILL_FRIEND instance,
    TRes Function(Variables$Mutation$DELETE_SMARTWILL_FRIEND) then,
  ) = _CopyWithImpl$Variables$Mutation$DELETE_SMARTWILL_FRIEND;

  factory CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DELETE_SMARTWILL_FRIEND;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DELETE_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND<TRes> {
  _CopyWithImpl$Variables$Mutation$DELETE_SMARTWILL_FRIEND(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DELETE_SMARTWILL_FRIEND _instance;

  final TRes Function(Variables$Mutation$DELETE_SMARTWILL_FRIEND) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DELETE_SMARTWILL_FRIEND._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DELETE_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Variables$Mutation$DELETE_SMARTWILL_FRIEND<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DELETE_SMARTWILL_FRIEND(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DELETE_SMARTWILL_FRIEND {
  Mutation$DELETE_SMARTWILL_FRIEND({
    this.deleteSmartWillFriend,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DELETE_SMARTWILL_FRIEND.fromJson(Map<String, dynamic> json) {
    final l$deleteSmartWillFriend = json['deleteSmartWillFriend'];
    final l$$__typename = json['__typename'];
    return Mutation$DELETE_SMARTWILL_FRIEND(
      deleteSmartWillFriend: (l$deleteSmartWillFriend as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? deleteSmartWillFriend;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteSmartWillFriend = deleteSmartWillFriend;
    _resultData['deleteSmartWillFriend'] = l$deleteSmartWillFriend;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteSmartWillFriend = deleteSmartWillFriend;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteSmartWillFriend, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DELETE_SMARTWILL_FRIEND ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteSmartWillFriend = deleteSmartWillFriend;
    final lOther$deleteSmartWillFriend = other.deleteSmartWillFriend;
    if (l$deleteSmartWillFriend != lOther$deleteSmartWillFriend) {
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

extension UtilityExtension$Mutation$DELETE_SMARTWILL_FRIEND
    on Mutation$DELETE_SMARTWILL_FRIEND {
  CopyWith$Mutation$DELETE_SMARTWILL_FRIEND<Mutation$DELETE_SMARTWILL_FRIEND>
  get copyWith => CopyWith$Mutation$DELETE_SMARTWILL_FRIEND(this, (i) => i);
}

abstract class CopyWith$Mutation$DELETE_SMARTWILL_FRIEND<TRes> {
  factory CopyWith$Mutation$DELETE_SMARTWILL_FRIEND(
    Mutation$DELETE_SMARTWILL_FRIEND instance,
    TRes Function(Mutation$DELETE_SMARTWILL_FRIEND) then,
  ) = _CopyWithImpl$Mutation$DELETE_SMARTWILL_FRIEND;

  factory CopyWith$Mutation$DELETE_SMARTWILL_FRIEND.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DELETE_SMARTWILL_FRIEND;

  TRes call({String? deleteSmartWillFriend, String? $__typename});
}

class _CopyWithImpl$Mutation$DELETE_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Mutation$DELETE_SMARTWILL_FRIEND<TRes> {
  _CopyWithImpl$Mutation$DELETE_SMARTWILL_FRIEND(this._instance, this._then);

  final Mutation$DELETE_SMARTWILL_FRIEND _instance;

  final TRes Function(Mutation$DELETE_SMARTWILL_FRIEND) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteSmartWillFriend = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DELETE_SMARTWILL_FRIEND(
      deleteSmartWillFriend: deleteSmartWillFriend == _undefined
          ? _instance.deleteSmartWillFriend
          : (deleteSmartWillFriend as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DELETE_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Mutation$DELETE_SMARTWILL_FRIEND<TRes> {
  _CopyWithStubImpl$Mutation$DELETE_SMARTWILL_FRIEND(this._res);

  TRes _res;

  call({String? deleteSmartWillFriend, String? $__typename}) => _res;
}

const documentNodeMutationDELETE_SMARTWILL_FRIEND = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DELETE_SMARTWILL_FRIEND'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteSmartWillFriend'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
