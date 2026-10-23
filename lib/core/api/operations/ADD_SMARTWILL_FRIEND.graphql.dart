import 'package:gql/ast.dart';

class Variables$Mutation$ADD_SMARTWILL_FRIEND {
  factory Variables$Mutation$ADD_SMARTWILL_FRIEND({required String id}) =>
      Variables$Mutation$ADD_SMARTWILL_FRIEND._({r'id': id});

  Variables$Mutation$ADD_SMARTWILL_FRIEND._(this._$data);

  factory Variables$Mutation$ADD_SMARTWILL_FRIEND.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$ADD_SMARTWILL_FRIEND._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND<
    Variables$Mutation$ADD_SMARTWILL_FRIEND
  >
  get copyWith =>
      CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ADD_SMARTWILL_FRIEND ||
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

abstract class CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND<TRes> {
  factory CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND(
    Variables$Mutation$ADD_SMARTWILL_FRIEND instance,
    TRes Function(Variables$Mutation$ADD_SMARTWILL_FRIEND) then,
  ) = _CopyWithImpl$Variables$Mutation$ADD_SMARTWILL_FRIEND;

  factory CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ADD_SMARTWILL_FRIEND;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$ADD_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND<TRes> {
  _CopyWithImpl$Variables$Mutation$ADD_SMARTWILL_FRIEND(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ADD_SMARTWILL_FRIEND _instance;

  final TRes Function(Variables$Mutation$ADD_SMARTWILL_FRIEND) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$ADD_SMARTWILL_FRIEND._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$ADD_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Variables$Mutation$ADD_SMARTWILL_FRIEND<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ADD_SMARTWILL_FRIEND(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$ADD_SMARTWILL_FRIEND {
  Mutation$ADD_SMARTWILL_FRIEND({
    this.addSmartWillFriend,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ADD_SMARTWILL_FRIEND.fromJson(Map<String, dynamic> json) {
    final l$addSmartWillFriend = json['addSmartWillFriend'];
    final l$$__typename = json['__typename'];
    return Mutation$ADD_SMARTWILL_FRIEND(
      addSmartWillFriend: (l$addSmartWillFriend as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? addSmartWillFriend;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addSmartWillFriend = addSmartWillFriend;
    _resultData['addSmartWillFriend'] = l$addSmartWillFriend;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addSmartWillFriend = addSmartWillFriend;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addSmartWillFriend, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ADD_SMARTWILL_FRIEND ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addSmartWillFriend = addSmartWillFriend;
    final lOther$addSmartWillFriend = other.addSmartWillFriend;
    if (l$addSmartWillFriend != lOther$addSmartWillFriend) {
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

extension UtilityExtension$Mutation$ADD_SMARTWILL_FRIEND
    on Mutation$ADD_SMARTWILL_FRIEND {
  CopyWith$Mutation$ADD_SMARTWILL_FRIEND<Mutation$ADD_SMARTWILL_FRIEND>
  get copyWith => CopyWith$Mutation$ADD_SMARTWILL_FRIEND(this, (i) => i);
}

abstract class CopyWith$Mutation$ADD_SMARTWILL_FRIEND<TRes> {
  factory CopyWith$Mutation$ADD_SMARTWILL_FRIEND(
    Mutation$ADD_SMARTWILL_FRIEND instance,
    TRes Function(Mutation$ADD_SMARTWILL_FRIEND) then,
  ) = _CopyWithImpl$Mutation$ADD_SMARTWILL_FRIEND;

  factory CopyWith$Mutation$ADD_SMARTWILL_FRIEND.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ADD_SMARTWILL_FRIEND;

  TRes call({String? addSmartWillFriend, String? $__typename});
}

class _CopyWithImpl$Mutation$ADD_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Mutation$ADD_SMARTWILL_FRIEND<TRes> {
  _CopyWithImpl$Mutation$ADD_SMARTWILL_FRIEND(this._instance, this._then);

  final Mutation$ADD_SMARTWILL_FRIEND _instance;

  final TRes Function(Mutation$ADD_SMARTWILL_FRIEND) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addSmartWillFriend = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$ADD_SMARTWILL_FRIEND(
      addSmartWillFriend: addSmartWillFriend == _undefined
          ? _instance.addSmartWillFriend
          : (addSmartWillFriend as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$ADD_SMARTWILL_FRIEND<TRes>
    implements CopyWith$Mutation$ADD_SMARTWILL_FRIEND<TRes> {
  _CopyWithStubImpl$Mutation$ADD_SMARTWILL_FRIEND(this._res);

  TRes _res;

  call({String? addSmartWillFriend, String? $__typename}) => _res;
}

const documentNodeMutationADD_SMARTWILL_FRIEND = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'ADD_SMARTWILL_FRIEND'),
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
            name: NameNode(value: 'addSmartWillFriend'),
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
