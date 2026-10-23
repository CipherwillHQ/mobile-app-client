import 'package:gql/ast.dart';

class Variables$Mutation$UPDATE_MOBILE_PREFERENCES {
  factory Variables$Mutation$UPDATE_MOBILE_PREFERENCES({
    required String id,
    required String key,
    required bool value,
  }) => Variables$Mutation$UPDATE_MOBILE_PREFERENCES._({
    r'id': id,
    r'key': key,
    r'value': value,
  });

  Variables$Mutation$UPDATE_MOBILE_PREFERENCES._(this._$data);

  factory Variables$Mutation$UPDATE_MOBILE_PREFERENCES.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$key = data['key'];
    result$data['key'] = (l$key as String);
    final l$value = data['value'];
    result$data['value'] = (l$value as bool);
    return Variables$Mutation$UPDATE_MOBILE_PREFERENCES._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String get key => (_$data['key'] as String);

  bool get value => (_$data['value'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$key = key;
    result$data['key'] = l$key;
    final l$value = value;
    result$data['value'] = l$value;
    return result$data;
  }

  CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES<
    Variables$Mutation$UPDATE_MOBILE_PREFERENCES
  >
  get copyWith =>
      CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UPDATE_MOBILE_PREFERENCES ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$key = key;
    final l$value = value;
    return Object.hashAll([l$id, l$key, l$value]);
  }
}

abstract class CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES<TRes> {
  factory CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES(
    Variables$Mutation$UPDATE_MOBILE_PREFERENCES instance,
    TRes Function(Variables$Mutation$UPDATE_MOBILE_PREFERENCES) then,
  ) = _CopyWithImpl$Variables$Mutation$UPDATE_MOBILE_PREFERENCES;

  factory CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UPDATE_MOBILE_PREFERENCES;

  TRes call({String? id, String? key, bool? value});
}

class _CopyWithImpl$Variables$Mutation$UPDATE_MOBILE_PREFERENCES<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES<TRes> {
  _CopyWithImpl$Variables$Mutation$UPDATE_MOBILE_PREFERENCES(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UPDATE_MOBILE_PREFERENCES _instance;

  final TRes Function(Variables$Mutation$UPDATE_MOBILE_PREFERENCES) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? key = _undefined,
    Object? value = _undefined,
  }) => _then(
    Variables$Mutation$UPDATE_MOBILE_PREFERENCES._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (key != _undefined && key != null) 'key': (key as String),
      if (value != _undefined && value != null) 'value': (value as bool),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UPDATE_MOBILE_PREFERENCES<TRes>
    implements CopyWith$Variables$Mutation$UPDATE_MOBILE_PREFERENCES<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UPDATE_MOBILE_PREFERENCES(this._res);

  TRes _res;

  call({String? id, String? key, bool? value}) => _res;
}

class Mutation$UPDATE_MOBILE_PREFERENCES {
  Mutation$UPDATE_MOBILE_PREFERENCES({
    required this.updateMobilePreferences,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UPDATE_MOBILE_PREFERENCES.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$updateMobilePreferences = json['updateMobilePreferences'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_MOBILE_PREFERENCES(
      updateMobilePreferences:
          Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences.fromJson(
            (l$updateMobilePreferences as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences
  updateMobilePreferences;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMobilePreferences = updateMobilePreferences;
    _resultData['updateMobilePreferences'] = l$updateMobilePreferences.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMobilePreferences = updateMobilePreferences;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateMobilePreferences, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UPDATE_MOBILE_PREFERENCES ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMobilePreferences = updateMobilePreferences;
    final lOther$updateMobilePreferences = other.updateMobilePreferences;
    if (l$updateMobilePreferences != lOther$updateMobilePreferences) {
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

extension UtilityExtension$Mutation$UPDATE_MOBILE_PREFERENCES
    on Mutation$UPDATE_MOBILE_PREFERENCES {
  CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES<
    Mutation$UPDATE_MOBILE_PREFERENCES
  >
  get copyWith => CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES(this, (i) => i);
}

abstract class CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES<TRes> {
  factory CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES(
    Mutation$UPDATE_MOBILE_PREFERENCES instance,
    TRes Function(Mutation$UPDATE_MOBILE_PREFERENCES) then,
  ) = _CopyWithImpl$Mutation$UPDATE_MOBILE_PREFERENCES;

  factory CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UPDATE_MOBILE_PREFERENCES;

  TRes call({
    Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences?
    updateMobilePreferences,
    String? $__typename,
  });
  CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<TRes>
  get updateMobilePreferences;
}

class _CopyWithImpl$Mutation$UPDATE_MOBILE_PREFERENCES<TRes>
    implements CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES<TRes> {
  _CopyWithImpl$Mutation$UPDATE_MOBILE_PREFERENCES(this._instance, this._then);

  final Mutation$UPDATE_MOBILE_PREFERENCES _instance;

  final TRes Function(Mutation$UPDATE_MOBILE_PREFERENCES) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMobilePreferences = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_MOBILE_PREFERENCES(
      updateMobilePreferences:
          updateMobilePreferences == _undefined ||
              updateMobilePreferences == null
          ? _instance.updateMobilePreferences
          : (updateMobilePreferences
                as Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<TRes>
  get updateMobilePreferences {
    final local$updateMobilePreferences = _instance.updateMobilePreferences;
    return CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
      local$updateMobilePreferences,
      (e) => call(updateMobilePreferences: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UPDATE_MOBILE_PREFERENCES<TRes>
    implements CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES<TRes> {
  _CopyWithStubImpl$Mutation$UPDATE_MOBILE_PREFERENCES(this._res);

  TRes _res;

  call({
    Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences?
    updateMobilePreferences,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<TRes>
  get updateMobilePreferences =>
      CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences.stub(
        _res,
      );
}

const documentNodeMutationUPDATE_MOBILE_PREFERENCES = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UPDATE_MOBILE_PREFERENCES'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'key')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'value')),
          type: NamedTypeNode(
            name: NameNode(value: 'Boolean'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateMobilePreferences'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'key'),
                value: VariableNode(name: NameNode(value: 'key')),
              ),
              ArgumentNode(
                name: NameNode(value: 'value'),
                value: VariableNode(name: NameNode(value: 'value')),
              ),
            ],
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
                  name: NameNode(value: 'phone_code'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'phone_num'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'verified'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mandatory_phone_calls'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mandatory_sms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'mandatory_whatsapp'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_phone_calls'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_sms'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'promotional_whatsapp'),
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

class Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences {
  Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences({
    required this.id,
    required this.phone_code,
    required this.phone_num,
    required this.verified,
    required this.mandatory_phone_calls,
    required this.mandatory_sms,
    required this.mandatory_whatsapp,
    required this.promotional_phone_calls,
    required this.promotional_sms,
    required this.promotional_whatsapp,
    required this.created_at,
    required this.updated_at,
    this.$__typename = 'UserPhoneNumber',
  });

  factory Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$phone_code = json['phone_code'];
    final l$phone_num = json['phone_num'];
    final l$verified = json['verified'];
    final l$mandatory_phone_calls = json['mandatory_phone_calls'];
    final l$mandatory_sms = json['mandatory_sms'];
    final l$mandatory_whatsapp = json['mandatory_whatsapp'];
    final l$promotional_phone_calls = json['promotional_phone_calls'];
    final l$promotional_sms = json['promotional_sms'];
    final l$promotional_whatsapp = json['promotional_whatsapp'];
    final l$created_at = json['created_at'];
    final l$updated_at = json['updated_at'];
    final l$$__typename = json['__typename'];
    return Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
      id: (l$id as String),
      phone_code: (l$phone_code as String),
      phone_num: (l$phone_num as String),
      verified: (l$verified as bool),
      mandatory_phone_calls: (l$mandatory_phone_calls as bool),
      mandatory_sms: (l$mandatory_sms as bool),
      mandatory_whatsapp: (l$mandatory_whatsapp as bool),
      promotional_phone_calls: (l$promotional_phone_calls as bool),
      promotional_sms: (l$promotional_sms as bool),
      promotional_whatsapp: (l$promotional_whatsapp as bool),
      created_at: (l$created_at as String),
      updated_at: (l$updated_at as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String phone_code;

  final String phone_num;

  final bool verified;

  final bool mandatory_phone_calls;

  final bool mandatory_sms;

  final bool mandatory_whatsapp;

  final bool promotional_phone_calls;

  final bool promotional_sms;

  final bool promotional_whatsapp;

  final String created_at;

  final String updated_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$phone_code = phone_code;
    _resultData['phone_code'] = l$phone_code;
    final l$phone_num = phone_num;
    _resultData['phone_num'] = l$phone_num;
    final l$verified = verified;
    _resultData['verified'] = l$verified;
    final l$mandatory_phone_calls = mandatory_phone_calls;
    _resultData['mandatory_phone_calls'] = l$mandatory_phone_calls;
    final l$mandatory_sms = mandatory_sms;
    _resultData['mandatory_sms'] = l$mandatory_sms;
    final l$mandatory_whatsapp = mandatory_whatsapp;
    _resultData['mandatory_whatsapp'] = l$mandatory_whatsapp;
    final l$promotional_phone_calls = promotional_phone_calls;
    _resultData['promotional_phone_calls'] = l$promotional_phone_calls;
    final l$promotional_sms = promotional_sms;
    _resultData['promotional_sms'] = l$promotional_sms;
    final l$promotional_whatsapp = promotional_whatsapp;
    _resultData['promotional_whatsapp'] = l$promotional_whatsapp;
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
    final l$phone_code = phone_code;
    final l$phone_num = phone_num;
    final l$verified = verified;
    final l$mandatory_phone_calls = mandatory_phone_calls;
    final l$mandatory_sms = mandatory_sms;
    final l$mandatory_whatsapp = mandatory_whatsapp;
    final l$promotional_phone_calls = promotional_phone_calls;
    final l$promotional_sms = promotional_sms;
    final l$promotional_whatsapp = promotional_whatsapp;
    final l$created_at = created_at;
    final l$updated_at = updated_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$phone_code,
      l$phone_num,
      l$verified,
      l$mandatory_phone_calls,
      l$mandatory_sms,
      l$mandatory_whatsapp,
      l$promotional_phone_calls,
      l$promotional_sms,
      l$promotional_whatsapp,
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
    if (other is! Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$phone_code = phone_code;
    final lOther$phone_code = other.phone_code;
    if (l$phone_code != lOther$phone_code) {
      return false;
    }
    final l$phone_num = phone_num;
    final lOther$phone_num = other.phone_num;
    if (l$phone_num != lOther$phone_num) {
      return false;
    }
    final l$verified = verified;
    final lOther$verified = other.verified;
    if (l$verified != lOther$verified) {
      return false;
    }
    final l$mandatory_phone_calls = mandatory_phone_calls;
    final lOther$mandatory_phone_calls = other.mandatory_phone_calls;
    if (l$mandatory_phone_calls != lOther$mandatory_phone_calls) {
      return false;
    }
    final l$mandatory_sms = mandatory_sms;
    final lOther$mandatory_sms = other.mandatory_sms;
    if (l$mandatory_sms != lOther$mandatory_sms) {
      return false;
    }
    final l$mandatory_whatsapp = mandatory_whatsapp;
    final lOther$mandatory_whatsapp = other.mandatory_whatsapp;
    if (l$mandatory_whatsapp != lOther$mandatory_whatsapp) {
      return false;
    }
    final l$promotional_phone_calls = promotional_phone_calls;
    final lOther$promotional_phone_calls = other.promotional_phone_calls;
    if (l$promotional_phone_calls != lOther$promotional_phone_calls) {
      return false;
    }
    final l$promotional_sms = promotional_sms;
    final lOther$promotional_sms = other.promotional_sms;
    if (l$promotional_sms != lOther$promotional_sms) {
      return false;
    }
    final l$promotional_whatsapp = promotional_whatsapp;
    final lOther$promotional_whatsapp = other.promotional_whatsapp;
    if (l$promotional_whatsapp != lOther$promotional_whatsapp) {
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

extension UtilityExtension$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences
    on Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences {
  CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<
    Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences
  >
  get copyWith =>
      CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<
  TRes
> {
  factory CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
    Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences instance,
    TRes Function(Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences)
    then,
  ) = _CopyWithImpl$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences;

  factory CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences;

  TRes call({
    String? id,
    String? phone_code,
    String? phone_num,
    bool? verified,
    bool? mandatory_phone_calls,
    bool? mandatory_sms,
    bool? mandatory_whatsapp,
    bool? promotional_phone_calls,
    bool? promotional_sms,
    bool? promotional_whatsapp,
    String? created_at,
    String? updated_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<
  TRes
>
    implements
        CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<
          TRes
        > {
  _CopyWithImpl$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
    this._instance,
    this._then,
  );

  final Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences _instance;

  final TRes Function(
    Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? phone_code = _undefined,
    Object? phone_num = _undefined,
    Object? verified = _undefined,
    Object? mandatory_phone_calls = _undefined,
    Object? mandatory_sms = _undefined,
    Object? mandatory_whatsapp = _undefined,
    Object? promotional_phone_calls = _undefined,
    Object? promotional_sms = _undefined,
    Object? promotional_whatsapp = _undefined,
    Object? created_at = _undefined,
    Object? updated_at = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      phone_code: phone_code == _undefined || phone_code == null
          ? _instance.phone_code
          : (phone_code as String),
      phone_num: phone_num == _undefined || phone_num == null
          ? _instance.phone_num
          : (phone_num as String),
      verified: verified == _undefined || verified == null
          ? _instance.verified
          : (verified as bool),
      mandatory_phone_calls:
          mandatory_phone_calls == _undefined || mandatory_phone_calls == null
          ? _instance.mandatory_phone_calls
          : (mandatory_phone_calls as bool),
      mandatory_sms: mandatory_sms == _undefined || mandatory_sms == null
          ? _instance.mandatory_sms
          : (mandatory_sms as bool),
      mandatory_whatsapp:
          mandatory_whatsapp == _undefined || mandatory_whatsapp == null
          ? _instance.mandatory_whatsapp
          : (mandatory_whatsapp as bool),
      promotional_phone_calls:
          promotional_phone_calls == _undefined ||
              promotional_phone_calls == null
          ? _instance.promotional_phone_calls
          : (promotional_phone_calls as bool),
      promotional_sms: promotional_sms == _undefined || promotional_sms == null
          ? _instance.promotional_sms
          : (promotional_sms as bool),
      promotional_whatsapp:
          promotional_whatsapp == _undefined || promotional_whatsapp == null
          ? _instance.promotional_whatsapp
          : (promotional_whatsapp as bool),
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

class _CopyWithStubImpl$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<
  TRes
>
    implements
        CopyWith$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UPDATE_MOBILE_PREFERENCES$updateMobilePreferences(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? phone_code,
    String? phone_num,
    bool? verified,
    bool? mandatory_phone_calls,
    bool? mandatory_sms,
    bool? mandatory_whatsapp,
    bool? promotional_phone_calls,
    bool? promotional_sms,
    bool? promotional_whatsapp,
    String? created_at,
    String? updated_at,
    String? $__typename,
  }) => _res;
}
