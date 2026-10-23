import 'package:gql/ast.dart';

class Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END {
  factory Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END({
    required String subscriptionId,
  }) => Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END._({
    r'subscriptionId': subscriptionId,
  });

  Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END._(this._$data);

  factory Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$subscriptionId = data['subscriptionId'];
    result$data['subscriptionId'] = (l$subscriptionId as String);
    return Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END._(result$data);
  }

  Map<String, dynamic> _$data;

  String get subscriptionId => (_$data['subscriptionId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$subscriptionId = subscriptionId;
    result$data['subscriptionId'] = l$subscriptionId;
    return result$data;
  }

  CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<
    Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END
  >
  get copyWith => CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
    this,
    (i) => i,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$subscriptionId = subscriptionId;
    final lOther$subscriptionId = other.subscriptionId;
    if (l$subscriptionId != lOther$subscriptionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$subscriptionId = subscriptionId;
    return Object.hashAll([l$subscriptionId]);
  }
}

abstract class CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<
  TRes
> {
  factory CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
    Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END instance,
    TRes Function(Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END) then,
  ) = _CopyWithImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END;

  factory CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END;

  TRes call({String? subscriptionId});
}

class _CopyWithImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes>
    implements
        CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes> {
  _CopyWithImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END _instance;

  final TRes Function(Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? subscriptionId = _undefined}) => _then(
    Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END._({
      ..._instance._$data,
      if (subscriptionId != _undefined && subscriptionId != null)
        'subscriptionId': (subscriptionId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<
  TRes
>
    implements
        CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
    this._res,
  );

  TRes _res;

  call({String? subscriptionId}) => _res;
}

class Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END {
  Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END({
    required this.cancelSubscriptionAtPeriodEnd,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$cancelSubscriptionAtPeriodEnd =
        json['cancelSubscriptionAtPeriodEnd'];
    final l$$__typename = json['__typename'];
    return Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
      cancelSubscriptionAtPeriodEnd: (l$cancelSubscriptionAtPeriodEnd as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool cancelSubscriptionAtPeriodEnd;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelSubscriptionAtPeriodEnd = cancelSubscriptionAtPeriodEnd;
    _resultData['cancelSubscriptionAtPeriodEnd'] =
        l$cancelSubscriptionAtPeriodEnd;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelSubscriptionAtPeriodEnd = cancelSubscriptionAtPeriodEnd;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelSubscriptionAtPeriodEnd, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelSubscriptionAtPeriodEnd = cancelSubscriptionAtPeriodEnd;
    final lOther$cancelSubscriptionAtPeriodEnd =
        other.cancelSubscriptionAtPeriodEnd;
    if (l$cancelSubscriptionAtPeriodEnd !=
        lOther$cancelSubscriptionAtPeriodEnd) {
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

extension UtilityExtension$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END
    on Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END {
  CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<
    Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END
  >
  get copyWith =>
      CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(this, (i) => i);
}

abstract class CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes> {
  factory CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
    Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END instance,
    TRes Function(Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END) then,
  ) = _CopyWithImpl$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END;

  factory CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END;

  TRes call({bool? cancelSubscriptionAtPeriodEnd, String? $__typename});
}

class _CopyWithImpl$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes>
    implements CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes> {
  _CopyWithImpl$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
    this._instance,
    this._then,
  );

  final Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END _instance;

  final TRes Function(Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cancelSubscriptionAtPeriodEnd = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(
      cancelSubscriptionAtPeriodEnd:
          cancelSubscriptionAtPeriodEnd == _undefined ||
              cancelSubscriptionAtPeriodEnd == null
          ? _instance.cancelSubscriptionAtPeriodEnd
          : (cancelSubscriptionAtPeriodEnd as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes>
    implements CopyWith$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END<TRes> {
  _CopyWithStubImpl$Mutation$CANCEL_SUBSCRIPTION_AT_PERIOD_END(this._res);

  TRes _res;

  call({bool? cancelSubscriptionAtPeriodEnd, String? $__typename}) => _res;
}

const documentNodeMutationCANCEL_SUBSCRIPTION_AT_PERIOD_END = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CANCEL_SUBSCRIPTION_AT_PERIOD_END'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'subscriptionId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'cancelSubscriptionAtPeriodEnd'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'subscriptionId'),
                value: VariableNode(name: NameNode(value: 'subscriptionId')),
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
