import 'package:gql/ast.dart';

class Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY {
  factory Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY({
    required String access_id,
  }) => Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY._({
    r'access_id': access_id,
  });

  Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY._(this._$data);

  factory Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$access_id = data['access_id'];
    result$data['access_id'] = (l$access_id as String);
    return Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY._(result$data);
  }

  Map<String, dynamic> _$data;

  String get access_id => (_$data['access_id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$access_id = access_id;
    result$data['access_id'] = l$access_id;
    return result$data;
  }

  CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY<
    Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY
  >
  get copyWith =>
      CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$access_id = access_id;
    final lOther$access_id = other.access_id;
    if (l$access_id != lOther$access_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$access_id = access_id;
    return Object.hashAll([l$access_id]);
  }
}

abstract class CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes> {
  factory CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY(
    Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY instance,
    TRes Function(Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY) then,
  ) = _CopyWithImpl$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY;

  factory CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY;

  TRes call({String? access_id});
}

class _CopyWithImpl$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes>
    implements CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes> {
  _CopyWithImpl$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY(
    this._instance,
    this._then,
  );

  final Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY _instance;

  final TRes Function(Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? access_id = _undefined}) => _then(
    Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY._({
      ..._instance._$data,
      if (access_id != _undefined && access_id != null)
        'access_id': (access_id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes>
    implements CopyWith$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_BENEFICIARY_ENCRYPTION_KEY(this._res);

  TRes _res;

  call({String? access_id}) => _res;
}

class Query$GET_BENEFICIARY_ENCRYPTION_KEY {
  Query$GET_BENEFICIARY_ENCRYPTION_KEY({
    this.getBeneficiaryEncryptionKey,
    this.$__typename = 'Query',
  });

  factory Query$GET_BENEFICIARY_ENCRYPTION_KEY.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$getBeneficiaryEncryptionKey = json['getBeneficiaryEncryptionKey'];
    final l$$__typename = json['__typename'];
    return Query$GET_BENEFICIARY_ENCRYPTION_KEY(
      getBeneficiaryEncryptionKey: (l$getBeneficiaryEncryptionKey as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? getBeneficiaryEncryptionKey;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getBeneficiaryEncryptionKey = getBeneficiaryEncryptionKey;
    _resultData['getBeneficiaryEncryptionKey'] = l$getBeneficiaryEncryptionKey;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getBeneficiaryEncryptionKey = getBeneficiaryEncryptionKey;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getBeneficiaryEncryptionKey, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_BENEFICIARY_ENCRYPTION_KEY ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getBeneficiaryEncryptionKey = getBeneficiaryEncryptionKey;
    final lOther$getBeneficiaryEncryptionKey =
        other.getBeneficiaryEncryptionKey;
    if (l$getBeneficiaryEncryptionKey != lOther$getBeneficiaryEncryptionKey) {
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

extension UtilityExtension$Query$GET_BENEFICIARY_ENCRYPTION_KEY
    on Query$GET_BENEFICIARY_ENCRYPTION_KEY {
  CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY<
    Query$GET_BENEFICIARY_ENCRYPTION_KEY
  >
  get copyWith => CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY(this, (i) => i);
}

abstract class CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes> {
  factory CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY(
    Query$GET_BENEFICIARY_ENCRYPTION_KEY instance,
    TRes Function(Query$GET_BENEFICIARY_ENCRYPTION_KEY) then,
  ) = _CopyWithImpl$Query$GET_BENEFICIARY_ENCRYPTION_KEY;

  factory CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_BENEFICIARY_ENCRYPTION_KEY;

  TRes call({String? getBeneficiaryEncryptionKey, String? $__typename});
}

class _CopyWithImpl$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes>
    implements CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes> {
  _CopyWithImpl$Query$GET_BENEFICIARY_ENCRYPTION_KEY(
    this._instance,
    this._then,
  );

  final Query$GET_BENEFICIARY_ENCRYPTION_KEY _instance;

  final TRes Function(Query$GET_BENEFICIARY_ENCRYPTION_KEY) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getBeneficiaryEncryptionKey = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_BENEFICIARY_ENCRYPTION_KEY(
      getBeneficiaryEncryptionKey: getBeneficiaryEncryptionKey == _undefined
          ? _instance.getBeneficiaryEncryptionKey
          : (getBeneficiaryEncryptionKey as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes>
    implements CopyWith$Query$GET_BENEFICIARY_ENCRYPTION_KEY<TRes> {
  _CopyWithStubImpl$Query$GET_BENEFICIARY_ENCRYPTION_KEY(this._res);

  TRes _res;

  call({String? getBeneficiaryEncryptionKey, String? $__typename}) => _res;
}

const documentNodeQueryGET_BENEFICIARY_ENCRYPTION_KEY = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_BENEFICIARY_ENCRYPTION_KEY'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'access_id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getBeneficiaryEncryptionKey'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'access_id'),
                value: VariableNode(name: NameNode(value: 'access_id')),
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
