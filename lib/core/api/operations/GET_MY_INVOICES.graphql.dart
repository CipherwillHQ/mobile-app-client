import 'package:gql/ast.dart';

class Query$GET_MY_INVOICES {
  Query$GET_MY_INVOICES({this.getMyInvoices, this.$__typename = 'Query'});

  factory Query$GET_MY_INVOICES.fromJson(Map<String, dynamic> json) {
    final l$getMyInvoices = json['getMyInvoices'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_INVOICES(
      getMyInvoices: (l$getMyInvoices as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GET_MY_INVOICES$getMyInvoices.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GET_MY_INVOICES$getMyInvoices?>? getMyInvoices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMyInvoices = getMyInvoices;
    _resultData['getMyInvoices'] = l$getMyInvoices
        ?.map((e) => e?.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMyInvoices = getMyInvoices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMyInvoices == null
          ? null
          : Object.hashAll(l$getMyInvoices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_MY_INVOICES || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMyInvoices = getMyInvoices;
    final lOther$getMyInvoices = other.getMyInvoices;
    if (l$getMyInvoices != null && lOther$getMyInvoices != null) {
      if (l$getMyInvoices.length != lOther$getMyInvoices.length) {
        return false;
      }
      for (int i = 0; i < l$getMyInvoices.length; i++) {
        final l$getMyInvoices$entry = l$getMyInvoices[i];
        final lOther$getMyInvoices$entry = lOther$getMyInvoices[i];
        if (l$getMyInvoices$entry != lOther$getMyInvoices$entry) {
          return false;
        }
      }
    } else if (l$getMyInvoices != lOther$getMyInvoices) {
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

extension UtilityExtension$Query$GET_MY_INVOICES on Query$GET_MY_INVOICES {
  CopyWith$Query$GET_MY_INVOICES<Query$GET_MY_INVOICES> get copyWith =>
      CopyWith$Query$GET_MY_INVOICES(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_INVOICES<TRes> {
  factory CopyWith$Query$GET_MY_INVOICES(
    Query$GET_MY_INVOICES instance,
    TRes Function(Query$GET_MY_INVOICES) then,
  ) = _CopyWithImpl$Query$GET_MY_INVOICES;

  factory CopyWith$Query$GET_MY_INVOICES.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_INVOICES;

  TRes call({
    List<Query$GET_MY_INVOICES$getMyInvoices?>? getMyInvoices,
    String? $__typename,
  });
  TRes getMyInvoices(
    Iterable<Query$GET_MY_INVOICES$getMyInvoices?>? Function(
      Iterable<
        CopyWith$Query$GET_MY_INVOICES$getMyInvoices<
          Query$GET_MY_INVOICES$getMyInvoices
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GET_MY_INVOICES<TRes>
    implements CopyWith$Query$GET_MY_INVOICES<TRes> {
  _CopyWithImpl$Query$GET_MY_INVOICES(this._instance, this._then);

  final Query$GET_MY_INVOICES _instance;

  final TRes Function(Query$GET_MY_INVOICES) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMyInvoices = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_INVOICES(
      getMyInvoices: getMyInvoices == _undefined
          ? _instance.getMyInvoices
          : (getMyInvoices as List<Query$GET_MY_INVOICES$getMyInvoices?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes getMyInvoices(
    Iterable<Query$GET_MY_INVOICES$getMyInvoices?>? Function(
      Iterable<
        CopyWith$Query$GET_MY_INVOICES$getMyInvoices<
          Query$GET_MY_INVOICES$getMyInvoices
        >?
      >?,
    )
    _fn,
  ) => call(
    getMyInvoices: _fn(
      _instance.getMyInvoices?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GET_MY_INVOICES$getMyInvoices(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GET_MY_INVOICES<TRes>
    implements CopyWith$Query$GET_MY_INVOICES<TRes> {
  _CopyWithStubImpl$Query$GET_MY_INVOICES(this._res);

  TRes _res;

  call({
    List<Query$GET_MY_INVOICES$getMyInvoices?>? getMyInvoices,
    String? $__typename,
  }) => _res;

  getMyInvoices(_fn) => _res;
}

const documentNodeQueryGET_MY_INVOICES = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_MY_INVOICES'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getMyInvoices'),
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
                  name: NameNode(value: 'amount'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'currency'),
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

class Query$GET_MY_INVOICES$getMyInvoices {
  Query$GET_MY_INVOICES$getMyInvoices({
    required this.id,
    required this.plan_name,
    required this.status,
    required this.amount,
    required this.currency,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'Invoice',
  });

  factory Query$GET_MY_INVOICES$getMyInvoices.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$plan_name = json['plan_name'];
    final l$status = json['status'];
    final l$amount = json['amount'];
    final l$currency = json['currency'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Query$GET_MY_INVOICES$getMyInvoices(
      id: (l$id as String),
      plan_name: (l$plan_name as String),
      status: (l$status as String),
      amount: (l$amount as String),
      currency: (l$currency as String),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String plan_name;

  final String status;

  final String amount;

  final String currency;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$plan_name = plan_name;
    _resultData['plan_name'] = l$plan_name;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$amount = amount;
    _resultData['amount'] = l$amount;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$updated_at = updated_at;
    _resultData['updated_at'] = l$updated_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$plan_name = plan_name;
    final l$status = status;
    final l$amount = amount;
    final l$currency = currency;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$plan_name,
      l$status,
      l$amount,
      l$currency,
      l$created_at,
      l$updated_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_MY_INVOICES$getMyInvoices ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GET_MY_INVOICES$getMyInvoices
    on Query$GET_MY_INVOICES$getMyInvoices {
  CopyWith$Query$GET_MY_INVOICES$getMyInvoices<
    Query$GET_MY_INVOICES$getMyInvoices
  >
  get copyWith => CopyWith$Query$GET_MY_INVOICES$getMyInvoices(this, (i) => i);
}

abstract class CopyWith$Query$GET_MY_INVOICES$getMyInvoices<TRes> {
  factory CopyWith$Query$GET_MY_INVOICES$getMyInvoices(
    Query$GET_MY_INVOICES$getMyInvoices instance,
    TRes Function(Query$GET_MY_INVOICES$getMyInvoices) then,
  ) = _CopyWithImpl$Query$GET_MY_INVOICES$getMyInvoices;

  factory CopyWith$Query$GET_MY_INVOICES$getMyInvoices.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_MY_INVOICES$getMyInvoices;

  TRes call({
    String? id,
    String? plan_name,
    String? status,
    String? amount,
    String? currency,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GET_MY_INVOICES$getMyInvoices<TRes>
    implements CopyWith$Query$GET_MY_INVOICES$getMyInvoices<TRes> {
  _CopyWithImpl$Query$GET_MY_INVOICES$getMyInvoices(this._instance, this._then);

  final Query$GET_MY_INVOICES$getMyInvoices _instance;

  final TRes Function(Query$GET_MY_INVOICES$getMyInvoices) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? plan_name = _undefined,
    Object? status = _undefined,
    Object? amount = _undefined,
    Object? currency = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_MY_INVOICES$getMyInvoices(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      plan_name: plan_name == _undefined || plan_name == null
          ? _instance.plan_name
          : (plan_name as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as String),
      amount: amount == _undefined || amount == null
          ? _instance.amount
          : (amount as String),
      currency: currency == _undefined || currency == null
          ? _instance.currency
          : (currency as String),
      created_at: created_at == _undefined || created_at == null
          ? _instance.created_at
          : (created_at as String),
      updated_at: updated_at == _undefined || updated_at == null
          ? _instance.updated_at
          : (updated_at as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_MY_INVOICES$getMyInvoices<TRes>
    implements CopyWith$Query$GET_MY_INVOICES$getMyInvoices<TRes> {
  _CopyWithStubImpl$Query$GET_MY_INVOICES$getMyInvoices(this._res);

  TRes _res;

  call({
    String? id,
    String? plan_name,
    String? status,
    String? amount,
    String? currency,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
