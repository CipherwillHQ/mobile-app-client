import 'package:gql/ast.dart';

class Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND {
  factory Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND({
    required String subscriptionId,
  }) => Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND._({
    r'subscriptionId': subscriptionId,
  });

  Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND._(this._$data);

  factory Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$subscriptionId = data['subscriptionId'];
    result$data['subscriptionId'] = (l$subscriptionId as String);
    return Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND._(result$data);
  }

  Map<String, dynamic> _$data;

  String get subscriptionId => (_$data['subscriptionId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$subscriptionId = subscriptionId;
    result$data['subscriptionId'] = l$subscriptionId;
    return result$data;
  }

  CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<
    Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND ||
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

abstract class CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<
  TRes
> {
  factory CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
    Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND instance,
    TRes Function(Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND) then,
  ) = _CopyWithImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND;

  factory CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND.stub(
    TRes res,
  ) = _CopyWithStubImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND;

  TRes call({String? subscriptionId});
}

class _CopyWithImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes>
    implements
        CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes> {
  _CopyWithImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND _instance;

  final TRes Function(Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? subscriptionId = _undefined}) => _then(
    Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND._({
      ..._instance._$data,
      if (subscriptionId != _undefined && subscriptionId != null)
        'subscriptionId': (subscriptionId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<
  TRes
>
    implements
        CopyWith$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
    this._res,
  );

  TRes _res;

  call({String? subscriptionId}) => _res;
}

class Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND {
  Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND({
    required this.cancelSubscriptionNowAndRefund,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$cancelSubscriptionNowAndRefund =
        json['cancelSubscriptionNowAndRefund'];
    final l$$__typename = json['__typename'];
    return Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
      cancelSubscriptionNowAndRefund:
          (l$cancelSubscriptionNowAndRefund as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool cancelSubscriptionNowAndRefund;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cancelSubscriptionNowAndRefund = cancelSubscriptionNowAndRefund;
    _resultData['cancelSubscriptionNowAndRefund'] =
        l$cancelSubscriptionNowAndRefund;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cancelSubscriptionNowAndRefund = cancelSubscriptionNowAndRefund;
    final l$$__typename = $__typename;
    return Object.hashAll([l$cancelSubscriptionNowAndRefund, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cancelSubscriptionNowAndRefund = cancelSubscriptionNowAndRefund;
    final lOther$cancelSubscriptionNowAndRefund =
        other.cancelSubscriptionNowAndRefund;
    if (l$cancelSubscriptionNowAndRefund !=
        lOther$cancelSubscriptionNowAndRefund) {
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

extension UtilityExtension$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND
    on Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND {
  CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<
    Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND
  >
  get copyWith =>
      CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(this, (i) => i);
}

abstract class CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes> {
  factory CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
    Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND instance,
    TRes Function(Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND) then,
  ) = _CopyWithImpl$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND;

  factory CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND;

  TRes call({bool? cancelSubscriptionNowAndRefund, String? $__typename});
}

class _CopyWithImpl$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes>
    implements CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes> {
  _CopyWithImpl$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
    this._instance,
    this._then,
  );

  final Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND _instance;

  final TRes Function(Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cancelSubscriptionNowAndRefund = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(
      cancelSubscriptionNowAndRefund:
          cancelSubscriptionNowAndRefund == _undefined ||
              cancelSubscriptionNowAndRefund == null
          ? _instance.cancelSubscriptionNowAndRefund
          : (cancelSubscriptionNowAndRefund as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes>
    implements CopyWith$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND<TRes> {
  _CopyWithStubImpl$Mutation$CANCEL_SUBSCRIPTION_NOW_AND_REFUND(this._res);

  TRes _res;

  call({bool? cancelSubscriptionNowAndRefund, String? $__typename}) => _res;
}

const documentNodeMutationCANCEL_SUBSCRIPTION_NOW_AND_REFUND = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CANCEL_SUBSCRIPTION_NOW_AND_REFUND'),
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
            name: NameNode(value: 'cancelSubscriptionNowAndRefund'),
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
