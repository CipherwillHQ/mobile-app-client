import 'package:gql/ast.dart';

class Variables$Query$GET_INVOICE_PDF {
  factory Variables$Query$GET_INVOICE_PDF({required String invoiceId}) =>
      Variables$Query$GET_INVOICE_PDF._({r'invoiceId': invoiceId});

  Variables$Query$GET_INVOICE_PDF._(this._$data);

  factory Variables$Query$GET_INVOICE_PDF.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$invoiceId = data['invoiceId'];
    result$data['invoiceId'] = (l$invoiceId as String);
    return Variables$Query$GET_INVOICE_PDF._(result$data);
  }

  Map<String, dynamic> _$data;

  String get invoiceId => (_$data['invoiceId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$invoiceId = invoiceId;
    result$data['invoiceId'] = l$invoiceId;
    return result$data;
  }

  CopyWith$Variables$Query$GET_INVOICE_PDF<Variables$Query$GET_INVOICE_PDF>
  get copyWith => CopyWith$Variables$Query$GET_INVOICE_PDF(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GET_INVOICE_PDF ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$invoiceId = invoiceId;
    final lOther$invoiceId = other.invoiceId;
    if (l$invoiceId != lOther$invoiceId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$invoiceId = invoiceId;
    return Object.hashAll([l$invoiceId]);
  }
}

abstract class CopyWith$Variables$Query$GET_INVOICE_PDF<TRes> {
  factory CopyWith$Variables$Query$GET_INVOICE_PDF(
    Variables$Query$GET_INVOICE_PDF instance,
    TRes Function(Variables$Query$GET_INVOICE_PDF) then,
  ) = _CopyWithImpl$Variables$Query$GET_INVOICE_PDF;

  factory CopyWith$Variables$Query$GET_INVOICE_PDF.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GET_INVOICE_PDF;

  TRes call({String? invoiceId});
}

class _CopyWithImpl$Variables$Query$GET_INVOICE_PDF<TRes>
    implements CopyWith$Variables$Query$GET_INVOICE_PDF<TRes> {
  _CopyWithImpl$Variables$Query$GET_INVOICE_PDF(this._instance, this._then);

  final Variables$Query$GET_INVOICE_PDF _instance;

  final TRes Function(Variables$Query$GET_INVOICE_PDF) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? invoiceId = _undefined}) => _then(
    Variables$Query$GET_INVOICE_PDF._({
      ..._instance._$data,
      if (invoiceId != _undefined && invoiceId != null)
        'invoiceId': (invoiceId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GET_INVOICE_PDF<TRes>
    implements CopyWith$Variables$Query$GET_INVOICE_PDF<TRes> {
  _CopyWithStubImpl$Variables$Query$GET_INVOICE_PDF(this._res);

  TRes _res;

  call({String? invoiceId}) => _res;
}

class Query$GET_INVOICE_PDF {
  Query$GET_INVOICE_PDF({this.getInvoicePdf, this.$__typename = 'Query'});

  factory Query$GET_INVOICE_PDF.fromJson(Map<String, dynamic> json) {
    final l$getInvoicePdf = json['getInvoicePdf'];
    final l$$__typename = json['__typename'];
    return Query$GET_INVOICE_PDF(
      getInvoicePdf: (l$getInvoicePdf as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? getInvoicePdf;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getInvoicePdf = getInvoicePdf;
    _resultData['getInvoicePdf'] = l$getInvoicePdf;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getInvoicePdf = getInvoicePdf;
    final l$$__typename = $__typename;
    return Object.hashAll([l$getInvoicePdf, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GET_INVOICE_PDF || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getInvoicePdf = getInvoicePdf;
    final lOther$getInvoicePdf = other.getInvoicePdf;
    if (l$getInvoicePdf != lOther$getInvoicePdf) {
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

extension UtilityExtension$Query$GET_INVOICE_PDF on Query$GET_INVOICE_PDF {
  CopyWith$Query$GET_INVOICE_PDF<Query$GET_INVOICE_PDF> get copyWith =>
      CopyWith$Query$GET_INVOICE_PDF(this, (i) => i);
}

abstract class CopyWith$Query$GET_INVOICE_PDF<TRes> {
  factory CopyWith$Query$GET_INVOICE_PDF(
    Query$GET_INVOICE_PDF instance,
    TRes Function(Query$GET_INVOICE_PDF) then,
  ) = _CopyWithImpl$Query$GET_INVOICE_PDF;

  factory CopyWith$Query$GET_INVOICE_PDF.stub(TRes res) =
      _CopyWithStubImpl$Query$GET_INVOICE_PDF;

  TRes call({String? getInvoicePdf, String? $__typename});
}

class _CopyWithImpl$Query$GET_INVOICE_PDF<TRes>
    implements CopyWith$Query$GET_INVOICE_PDF<TRes> {
  _CopyWithImpl$Query$GET_INVOICE_PDF(this._instance, this._then);

  final Query$GET_INVOICE_PDF _instance;

  final TRes Function(Query$GET_INVOICE_PDF) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getInvoicePdf = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GET_INVOICE_PDF(
      getInvoicePdf: getInvoicePdf == _undefined
          ? _instance.getInvoicePdf
          : (getInvoicePdf as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GET_INVOICE_PDF<TRes>
    implements CopyWith$Query$GET_INVOICE_PDF<TRes> {
  _CopyWithStubImpl$Query$GET_INVOICE_PDF(this._res);

  TRes _res;

  call({String? getInvoicePdf, String? $__typename}) => _res;
}

const documentNodeQueryGET_INVOICE_PDF = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GET_INVOICE_PDF'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'invoiceId')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'getInvoicePdf'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'invoiceId'),
                value: VariableNode(name: NameNode(value: 'invoiceId')),
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
