import 'package:gql/ast.dart';

class Query$GET_MY_SUBSCRIPTION {
  Query$GET_MY_SUBSCRIPTION({
    this.getMySubscription,
    this.$__typename = 'Query',
  });

  factory Query$GET_MY_SUBSCRIPTION.fromJson(Map<String, dynamic> json) {
    final l$getMySubscription = json['getMySubscription'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_SUBSCRIPTION(
      getMySubscription: l$getMySubscription == null
          ? null
          : Query$GET_MY_SUBSCRIPTION$getMySubscription.fromJson(
              (l$getMySubscription as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GET_MY_SUBSCRIPTION$getMySubscription? getMySubscription;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMySubscription = getMySubscription;
    _resultData['getMySubscription'] = l$getMySubscription?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMySubscription = getMySubscription;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getMySubscription, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_MY_SUBSCRIPTION ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMySubscription = getMySubscription;
    final lOther$getMySubscription = other.getMySubscription;
    if (l$getMySubscription != lOther$getMySubscription) {
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

extension UtilityExtension$Query$GET_MY_SUBSCRIPTION
    on Query$GET_MY_SUBSCRIPTION {
  CopyWith$Query$GET_MY_SUBSCRIPTION<Query$GET_MY_SUBSCRIPTION> get copyWith =>
      CopyWith$Query$GET_MY_SUBSCRIPTION(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_SUBSCRIPTION<TRes> {
  factory CopyWith$Query$GET_MY_SUBSCRIPTION(
    Query$GET_MY_SUBSCRIPTION instance,
    TRes Function(Query$GET_MY_SUBSCRIPTION) then,
  ) = _CopyWithImpl$Query$GET_MY_SUBSCRIPTION;

  factory CopyWith$Query$GET_MY_SUBSCRIPTION.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_SUBSCRIPTION;

  TRes call({
    Query$GET_MY_SUBSCRIPTION$getMySubscription? getMySubscription,
    String? $__typename,
  });
  CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes>
  get getMySubscription;
}

class _CopyWithImpl$Query$GET_MY_SUBSCRIPTION<TRes>
    implements CopyWith$Query$GET_MY_SUBSCRIPTION<TRes> {
  _CopyWithImpl$Query$GET_MY_SUBSCRIPTION(this._instance, this._then);

  final Query$GET_MY_SUBSCRIPTION _instance;

  final TRes Function(Query$GET_MY_SUBSCRIPTION) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMySubscription = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_SUBSCRIPTION(
      getMySubscription: getMySubscription == _undefined
          ? _instance.getMySubscription
          : (getMySubscription as Query$GET_MY_SUBSCRIPTION$getMySubscription?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes>
  get getMySubscription {
    final local$getMySubscription = _instance.getMySubscription;
    return local$getMySubscription == null
        ? CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription.stub(
            _then(_instance),
          )
        : CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription(
            local$getMySubscription,
            (e) => call(getMySubscription: e),
          );
  }
}

class _CopyWithStubImpl$Query$GET_MY_SUBSCRIPTION<TRes>
    implements CopyWith$Query$GET_MY_SUBSCRIPTION<TRes> {
  _CopyWithStubImpl$Query$GET_MY_SUBSCRIPTION(this._res);

  TRes _res;

  call({
    Query$GET_MY_SUBSCRIPTION$getMySubscription? getMySubscription,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes>
  get getMySubscription =>
      CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription.stub(_res);
}

const documentNodeQueryGET_MY_SUBSCRIPTION = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_MY_SUBSCRIPTION'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getMySubscription'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'payment_gateway'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'plan_name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'next_billing_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'last_payment_method'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'created_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'updated_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'cancel_at'),
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

class Query$GET_MY_SUBSCRIPTION$getMySubscription {
  Query$GET_MY_SUBSCRIPTION$getMySubscription({
    required this.id,
    required this.payment_gateway,
    required this.plan_name,
    required this.status,
    this.next_billing_at,
    this.last_payment_method,
    required this.created_at,
    required this.updated_at,
    this.cancel_at,
    this.$__typename = 'Subscription',
  });

  factory Query$GET_MY_SUBSCRIPTION$getMySubscription.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$payment_gateway = json['payment_gateway'];
    final l$plan_name = json['plan_name'];
    final l$status = json['status'];
    final l$next_billing_at = json['next_billing_at'];
    final l$last_payment_method = json['last_payment_method'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$cancel_at = json['cancel_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_SUBSCRIPTION$getMySubscription(
      id: (l$id as String),
      payment_gateway: (l$payment_gateway as String),
      plan_name: (l$plan_name as String),
      status: (l$status as String),
      next_billing_at: (l$next_billing_at as String?),
      last_payment_method: (l$last_payment_method as String?),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      cancel_at: (l$cancel_at as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String payment_gateway;

  final String plan_name;

  final String status;

  final String? next_billing_at;

  final String? last_payment_method;

  final String created_at;

  final String updated_at;

  final String? cancel_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$payment_gateway = payment_gateway;
    _resultData['payment_gateway'] = l$payment_gateway;
    final l$plan_name = plan_name;
    _resultData['plan_name'] = l$plan_name;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$next_billing_at = next_billing_at;
    _resultData['next_billing_at'] = l$next_billing_at;
    final l$last_payment_method = last_payment_method;
    _resultData['last_payment_method'] = l$last_payment_method;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$cancel_at = cancel_at;
    _resultData['cancel_at'] = l$cancel_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$payment_gateway = payment_gateway;
    final l$plan_name = plan_name;
    final l$status = status;
    final l$next_billing_at = next_billing_at;
    final l$last_payment_method = last_payment_method;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$cancel_at = cancel_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$payment_gateway,
      l$plan_name,
      l$status,
      l$next_billing_at,
      l$last_payment_method,
      l$created_at,
      l$updated_at,
      l$cancel_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_MY_SUBSCRIPTION$getMySubscription ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$payment_gateway = payment_gateway;
    final lOther$payment_gateway = other.payment_gateway;
    if (l$payment_gateway != lOther$payment_gateway) {
      return false;
    }
    final l$plan_name = plan_name;
    final lOther$plan_name = other.plan_name;
    if (l$plan_name != lOther$plan_name) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$next_billing_at = next_billing_at;
    final lOther$next_billing_at = other.next_billing_at;
    if (l$next_billing_at != lOther$next_billing_at) {
      return false;
    }
    final l$last_payment_method = last_payment_method;
    final lOther$last_payment_method = other.last_payment_method;
    if (l$last_payment_method != lOther$last_payment_method) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$cancel_at = cancel_at;
    final lOther$cancel_at = other.cancel_at;
    if (l$cancel_at != lOther$cancel_at) {
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

extension UtilityExtension$Query$GET_MY_SUBSCRIPTION$getMySubscription
    on Query$GET_MY_SUBSCRIPTION$getMySubscription {
  CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<
    Query$GET_MY_SUBSCRIPTION$getMySubscription
  >
  get copyWith =>
      CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes> {
  factory CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription(
    Query$GET_MY_SUBSCRIPTION$getMySubscription instance,
    TRes Function(Query$GET_MY_SUBSCRIPTION$getMySubscription) then,
  ) = _CopyWithImpl$Query$GET_MY_SUBSCRIPTION$getMySubscription;

  factory CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_SUBSCRIPTION$getMySubscription;

  TRes call({
    String? id,
    String? payment_gateway,
    String? plan_name,
    String? status,
    String? next_billing_at,
    String? last_payment_method,
    String? created_at,
    String? updated_at,
    String? cancel_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes>
    implements CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes> {
  _CopyWithImpl$Query$GET_MY_SUBSCRIPTION$getMySubscription(
    this._instance,
    this._then,
  );

  final Query$GET_MY_SUBSCRIPTION$getMySubscription _instance;

  final TRes Function(Query$GET_MY_SUBSCRIPTION$getMySubscription) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? payment_gateway = _undefined,
    Object? plan_name = _undefined,
    Object? status = _undefined,
    Object? next_billing_at = _undefined,
    Object? last_payment_method = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? cancel_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_SUBSCRIPTION$getMySubscription(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      payment_gateway: payment_gateway == _undefined || payment_gateway == null
          ? _instance.payment_gateway
          : (payment_gateway as String),
      plan_name: plan_name == _undefined || plan_name == null
          ? _instance.plan_name
          : (plan_name as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as String),
      next_billing_at: next_billing_at == _undefined
          ? _instance.next_billing_at
          : (next_billing_at as String?),
      last_payment_method: last_payment_method == _undefined
          ? _instance.last_payment_method
          : (last_payment_method as String?),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      updated_at: updated_at == _undefined || updated_at == null
          ? _instance.updated_at
          : (updated_at as String),
      cancel_at: cancel_at == _undefined
          ? _instance.cancel_at
          : (cancel_at as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes>
    implements CopyWith$Query$GET_MY_SUBSCRIPTION$getMySubscription<TRes> {
  _CopyWithStubImpl$Query$GET_MY_SUBSCRIPTION$getMySubscription(this._res);

  TRes _res;

  call({
    String? id,
    String? payment_gateway,
    String? plan_name,
    String? status,
    String? next_billing_at,
    String? last_payment_method,
    String? created_at,
    String? updated_at,
    String? cancel_at,
    String? $__typename,
  }) => _res;
}
