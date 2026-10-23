import 'package:gql/ast.dart';

class Mutation$SEND_EMAIL_VERIFICATION {
  Mutation$SEND_EMAIL_VERIFICATION({
    required this.sendEmailVerification,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SEND_EMAIL_VERIFICATION.fromJson(Map<String, dynamic> json) {
    final l$sendEmailVerification = json['sendEmailVerification'];
    final l$$__typename = json['__typename'];
    return Mutation$SEND_EMAIL_VERIFICATION(
      sendEmailVerification: (l$sendEmailVerification as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool sendEmailVerification;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendEmailVerification = sendEmailVerification;
    _resultData['sendEmailVerification'] = l$sendEmailVerification;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendEmailVerification = sendEmailVerification;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendEmailVerification, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SEND_EMAIL_VERIFICATION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendEmailVerification = sendEmailVerification;
    final lOther$sendEmailVerification = other.sendEmailVerification;
    if (l$sendEmailVerification != lOther$sendEmailVerification) {
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

extension UtilityExtension$Mutation$SEND_EMAIL_VERIFICATION
    on Mutation$SEND_EMAIL_VERIFICATION {
  CopyWith$Mutation$SEND_EMAIL_VERIFICATION<Mutation$SEND_EMAIL_VERIFICATION>
  get copyWith => CopyWith$Mutation$SEND_EMAIL_VERIFICATION(this, (i) => i);
}

abstract class CopyWith$Mutation$SEND_EMAIL_VERIFICATION<TRes> {
  factory CopyWith$Mutation$SEND_EMAIL_VERIFICATION(
    Mutation$SEND_EMAIL_VERIFICATION instance,
    TRes Function(Mutation$SEND_EMAIL_VERIFICATION) then,
  ) = _CopyWithImpl$Mutation$SEND_EMAIL_VERIFICATION;

  factory CopyWith$Mutation$SEND_EMAIL_VERIFICATION.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SEND_EMAIL_VERIFICATION;

  TRes call({bool? sendEmailVerification, String? $__typename});
}

class _CopyWithImpl$Mutation$SEND_EMAIL_VERIFICATION<TRes>
    implements CopyWith$Mutation$SEND_EMAIL_VERIFICATION<TRes> {
  _CopyWithImpl$Mutation$SEND_EMAIL_VERIFICATION(this._instance, this._then);

  final Mutation$SEND_EMAIL_VERIFICATION _instance;

  final TRes Function(Mutation$SEND_EMAIL_VERIFICATION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendEmailVerification = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SEND_EMAIL_VERIFICATION(
      sendEmailVerification:
          sendEmailVerification == _undefined || sendEmailVerification == null
          ? _instance.sendEmailVerification
          : (sendEmailVerification as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$SEND_EMAIL_VERIFICATION<TRes>
    implements CopyWith$Mutation$SEND_EMAIL_VERIFICATION<TRes> {
  _CopyWithStubImpl$Mutation$SEND_EMAIL_VERIFICATION(this._res);

  TRes _res;

  call({bool? sendEmailVerification, String? $__typename}) => _res;
}

const documentNodeMutationSEND_EMAIL_VERIFICATION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SEND_EMAIL_VERIFICATION'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'sendEmailVerification'),
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
