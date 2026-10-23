import 'package:gql/ast.dart';

class Variables$Mutation$sendFeedback {
  factory Variables$Mutation$sendFeedback({String? email, String? message}) =>
      Variables$Mutation$sendFeedback._({
        if (email != null) r'email': email,
        if (message != null) r'message': message,
      });

  Variables$Mutation$sendFeedback._(this._$data);

  factory Variables$Mutation$sendFeedback.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    return Variables$Mutation$sendFeedback._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get email => (_$data['email'] as String?);

  String? get message => (_$data['message'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] = l$message;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$sendFeedback<Variables$Mutation$sendFeedback>
  get copyWith => CopyWith$Variables$Mutation$sendFeedback(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$sendFeedback ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (_$data.containsKey('message') != other._$data.containsKey('message')) {
      return false;
    }
    if (l$message != lOther$message) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$message = message;
    return Object.hashAll([
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('message') ? l$message : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$sendFeedback<TRes> {
  factory CopyWith$Variables$Mutation$sendFeedback(
    Variables$Mutation$sendFeedback instance,
    TRes Function(Variables$Mutation$sendFeedback) then,
  ) = _CopyWithImpl$Variables$Mutation$sendFeedback;

  factory CopyWith$Variables$Mutation$sendFeedback.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$sendFeedback;

  TRes call({String? email, String? message});
}

class _CopyWithImpl$Variables$Mutation$sendFeedback<TRes>
    implements CopyWith$Variables$Mutation$sendFeedback<TRes> {
  _CopyWithImpl$Variables$Mutation$sendFeedback(this._instance, this._then);

  final Variables$Mutation$sendFeedback _instance;

  final TRes Function(Variables$Mutation$sendFeedback) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined, Object? message = _undefined}) =>
      _then(
        Variables$Mutation$sendFeedback._({
          ..._instance._$data,
          if (email != _undefined) 'email': (email as String?),
          if (message != _undefined) 'message': (message as String?),
        }),
      );
}

class _CopyWithStubImpl$Variables$Mutation$sendFeedback<TRes>
    implements CopyWith$Variables$Mutation$sendFeedback<TRes> {
  _CopyWithStubImpl$Variables$Mutation$sendFeedback(this._res);

  TRes _res;

  call({String? email, String? message}) => _res;
}

class Mutation$sendFeedback {
  Mutation$sendFeedback({
    required this.sendFeedback,
    this.$__typename = 'Mutation',
  });

  factory Mutation$sendFeedback.fromJson(Map<String, dynamic> json) {
    final l$sendFeedback = json['sendFeedback'];
    final l$$__typename = json['__typename'];
    return Mutation$sendFeedback(
      sendFeedback: (l$sendFeedback as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool sendFeedback;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendFeedback = sendFeedback;
    _resultData['sendFeedback'] = l$sendFeedback;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendFeedback = sendFeedback;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendFeedback, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$sendFeedback || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendFeedback = sendFeedback;
    final lOther$sendFeedback = other.sendFeedback;
    if (l$sendFeedback != lOther$sendFeedback) {
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

extension UtilityExtension$Mutation$sendFeedback on Mutation$sendFeedback {
  CopyWith$Mutation$sendFeedback<Mutation$sendFeedback> get copyWith =>
      CopyWith$Mutation$sendFeedback(this, (i) => i);
}

abstract class CopyWith$Mutation$sendFeedback<TRes> {
  factory CopyWith$Mutation$sendFeedback(
    Mutation$sendFeedback instance,
    TRes Function(Mutation$sendFeedback) then,
  ) = _CopyWithImpl$Mutation$sendFeedback;

  factory CopyWith$Mutation$sendFeedback.stub(TRes res) =
      _CopyWithStubImpl$Mutation$sendFeedback;

  TRes call({bool? sendFeedback, String? $__typename});
}

class _CopyWithImpl$Mutation$sendFeedback<TRes>
    implements CopyWith$Mutation$sendFeedback<TRes> {
  _CopyWithImpl$Mutation$sendFeedback(this._instance, this._then);

  final Mutation$sendFeedback _instance;

  final TRes Function(Mutation$sendFeedback) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendFeedback = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$sendFeedback(
      sendFeedback: sendFeedback == _undefined || sendFeedback == null
          ? _instance.sendFeedback
          : (sendFeedback as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$sendFeedback<TRes>
    implements CopyWith$Mutation$sendFeedback<TRes> {
  _CopyWithStubImpl$Mutation$sendFeedback(this._res);

  TRes _res;

  call({bool? sendFeedback, String? $__typename}) => _res;
}

const documentNodeMutationsendFeedback = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'sendFeedback'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'email')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'message')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
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
            name: NameNode(value: 'sendFeedback'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'email'),
                value: VariableNode(name: NameNode(value: 'email')),
              ),
              ArgumentNode(
                name: NameNode(value: 'message'),
                value: VariableNode(name: NameNode(value: 'message')),
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
