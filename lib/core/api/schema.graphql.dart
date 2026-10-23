class Input$UpdateUserInput {
  factory Input$UpdateUserInput({
    String? first_name,
    String? middle_name,
    String? last_name,
    String? gender,
    String? country,
    String? address_line1,
    String? address_line2,
    String? city,
    String? state,
    String? postal_code,
    String? birth_date,
  }) => Input$UpdateUserInput._({
    if (first_name != null) r'first_name': first_name,
    if (middle_name != null) r'middle_name': middle_name,
    if (last_name != null) r'last_name': last_name,
    if (gender != null) r'gender': gender,
    if (country != null) r'country': country,
    if (address_line1 != null) r'address_line1': address_line1,
    if (address_line2 != null) r'address_line2': address_line2,
    if (city != null) r'city': city,
    if (state != null) r'state': state,
    if (postal_code != null) r'postal_code': postal_code,
    if (birth_date != null) r'birth_date': birth_date,
  });

  Input$UpdateUserInput._(this._$data);

  factory Input$UpdateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first_name')) {
      final l$first_name = data['first_name'];
      result$data['first_name'] = (l$first_name as String?);
    }
    if (data.containsKey('middle_name')) {
      final l$middle_name = data['middle_name'];
      result$data['middle_name'] = (l$middle_name as String?);
    }
    if (data.containsKey('last_name')) {
      final l$last_name = data['last_name'];
      result$data['last_name'] = (l$last_name as String?);
    }
    if (data.containsKey('gender')) {
      final l$gender = data['gender'];
      result$data['gender'] = (l$gender as String?);
    }
    if (data.containsKey('country')) {
      final l$country = data['country'];
      result$data['country'] = (l$country as String?);
    }
    if (data.containsKey('address_line1')) {
      final l$address_line1 = data['address_line1'];
      result$data['address_line1'] = (l$address_line1 as String?);
    }
    if (data.containsKey('address_line2')) {
      final l$address_line2 = data['address_line2'];
      result$data['address_line2'] = (l$address_line2 as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('state')) {
      final l$state = data['state'];
      result$data['state'] = (l$state as String?);
    }
    if (data.containsKey('postal_code')) {
      final l$postal_code = data['postal_code'];
      result$data['postal_code'] = (l$postal_code as String?);
    }
    if (data.containsKey('birth_date')) {
      final l$birth_date = data['birth_date'];
      result$data['birth_date'] = (l$birth_date as String?);
    }
    return Input$UpdateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get first_name => (_$data['first_name'] as String?);

  String? get middle_name => (_$data['middle_name'] as String?);

  String? get last_name => (_$data['last_name'] as String?);

  String? get gender => (_$data['gender'] as String?);

  String? get country => (_$data['country'] as String?);

  String? get address_line1 => (_$data['address_line1'] as String?);

  String? get address_line2 => (_$data['address_line2'] as String?);

  String? get city => (_$data['city'] as String?);

  String? get state => (_$data['state'] as String?);

  String? get postal_code => (_$data['postal_code'] as String?);

  String? get birth_date => (_$data['birth_date'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first_name')) {
      final l$first_name = first_name;
      result$data['first_name'] = l$first_name;
    }
    if (_$data.containsKey('middle_name')) {
      final l$middle_name = middle_name;
      result$data['middle_name'] = l$middle_name;
    }
    if (_$data.containsKey('last_name')) {
      final l$last_name = last_name;
      result$data['last_name'] = l$last_name;
    }
    if (_$data.containsKey('gender')) {
      final l$gender = gender;
      result$data['gender'] = l$gender;
    }
    if (_$data.containsKey('country')) {
      final l$country = country;
      result$data['country'] = l$country;
    }
    if (_$data.containsKey('address_line1')) {
      final l$address_line1 = address_line1;
      result$data['address_line1'] = l$address_line1;
    }
    if (_$data.containsKey('address_line2')) {
      final l$address_line2 = address_line2;
      result$data['address_line2'] = l$address_line2;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('state')) {
      final l$state = state;
      result$data['state'] = l$state;
    }
    if (_$data.containsKey('postal_code')) {
      final l$postal_code = postal_code;
      result$data['postal_code'] = l$postal_code;
    }
    if (_$data.containsKey('birth_date')) {
      final l$birth_date = birth_date;
      result$data['birth_date'] = l$birth_date;
    }
    return result$data;
  }

  CopyWith$Input$UpdateUserInput<Input$UpdateUserInput> get copyWith =>
      CopyWith$Input$UpdateUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$first_name = first_name;
    final lOther$first_name = other.first_name;
    if (_$data.containsKey('first_name') !=
        other._$data.containsKey('first_name')) {
      return false;
    }
    if (l$first_name != lOther$first_name) {
      return false;
    }
    final l$middle_name = middle_name;
    final lOther$middle_name = other.middle_name;
    if (_$data.containsKey('middle_name') !=
        other._$data.containsKey('middle_name')) {
      return false;
    }
    if (l$middle_name != lOther$middle_name) {
      return false;
    }
    final l$last_name = last_name;
    final lOther$last_name = other.last_name;
    if (_$data.containsKey('last_name') !=
        other._$data.containsKey('last_name')) {
      return false;
    }
    if (l$last_name != lOther$last_name) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (_$data.containsKey('gender') != other._$data.containsKey('gender')) {
      return false;
    }
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (_$data.containsKey('country') != other._$data.containsKey('country')) {
      return false;
    }
    if (l$country != lOther$country) {
      return false;
    }
    final l$address_line1 = address_line1;
    final lOther$address_line1 = other.address_line1;
    if (_$data.containsKey('address_line1') !=
        other._$data.containsKey('address_line1')) {
      return false;
    }
    if (l$address_line1 != lOther$address_line1) {
      return false;
    }
    final l$address_line2 = address_line2;
    final lOther$address_line2 = other.address_line2;
    if (_$data.containsKey('address_line2') !=
        other._$data.containsKey('address_line2')) {
      return false;
    }
    if (l$address_line2 != lOther$address_line2) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (_$data.containsKey('state') != other._$data.containsKey('state')) {
      return false;
    }
    if (l$state != lOther$state) {
      return false;
    }
    final l$postal_code = postal_code;
    final lOther$postal_code = other.postal_code;
    if (_$data.containsKey('postal_code') !=
        other._$data.containsKey('postal_code')) {
      return false;
    }
    if (l$postal_code != lOther$postal_code) {
      return false;
    }
    final l$birth_date = birth_date;
    final lOther$birth_date = other.birth_date;
    if (_$data.containsKey('birth_date') !=
        other._$data.containsKey('birth_date')) {
      return false;
    }
    if (l$birth_date != lOther$birth_date) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first_name = first_name;
    final l$middle_name = middle_name;
    final l$last_name = last_name;
    final l$gender = gender;
    final l$country = country;
    final l$address_line1 = address_line1;
    final l$address_line2 = address_line2;
    final l$city = city;
    final l$state = state;
    final l$postal_code = postal_code;
    final l$birth_date = birth_date;
    return Object.hashAll([
      _$data.containsKey('first_name') ? l$first_name : const {},
      _$data.containsKey('middle_name') ? l$middle_name : const {},
      _$data.containsKey('last_name') ? l$last_name : const {},
      _$data.containsKey('gender') ? l$gender : const {},
      _$data.containsKey('country') ? l$country : const {},
      _$data.containsKey('address_line1') ? l$address_line1 : const {},
      _$data.containsKey('address_line2') ? l$address_line2 : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('state') ? l$state : const {},
      _$data.containsKey('postal_code') ? l$postal_code : const {},
      _$data.containsKey('birth_date') ? l$birth_date : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateUserInput<TRes> {
  factory CopyWith$Input$UpdateUserInput(
    Input$UpdateUserInput instance,
    TRes Function(Input$UpdateUserInput) then,
  ) = _CopyWithImpl$Input$UpdateUserInput;

  factory CopyWith$Input$UpdateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateUserInput;

  TRes call({
    String? first_name,
    String? middle_name,
    String? last_name,
    String? gender,
    String? country,
    String? address_line1,
    String? address_line2,
    String? city,
    String? state,
    String? postal_code,
    String? birth_date,
  });
}

class _CopyWithImpl$Input$UpdateUserInput<TRes>
    implements CopyWith$Input$UpdateUserInput<TRes> {
  _CopyWithImpl$Input$UpdateUserInput(this._instance, this._then);

  final Input$UpdateUserInput _instance;

  final TRes Function(Input$UpdateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first_name = _undefined,
    Object? middle_name = _undefined,
    Object? last_name = _undefined,
    Object? gender = _undefined,
    Object? country = _undefined,
    Object? address_line1 = _undefined,
    Object? address_line2 = _undefined,
    Object? city = _undefined,
    Object? state = _undefined,
    Object? postal_code = _undefined,
    Object? birth_date = _undefined,
  }) => _then(
    Input$UpdateUserInput._({
      ..._instance._$data,
      if (first_name != _undefined) 'first_name': (first_name as String?),
      if (middle_name != _undefined) 'middle_name': (middle_name as String?),
      if (last_name != _undefined) 'last_name': (last_name as String?),
      if (gender != _undefined) 'gender': (gender as String?),
      if (country != _undefined) 'country': (country as String?),
      if (address_line1 != _undefined)
        'address_line1': (address_line1 as String?),
      if (address_line2 != _undefined)
        'address_line2': (address_line2 as String?),
      if (city != _undefined) 'city': (city as String?),
      if (state != _undefined) 'state': (state as String?),
      if (postal_code != _undefined) 'postal_code': (postal_code as String?),
      if (birth_date != _undefined) 'birth_date': (birth_date as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateUserInput<TRes>
    implements CopyWith$Input$UpdateUserInput<TRes> {
  _CopyWithStubImpl$Input$UpdateUserInput(this._res);

  TRes _res;

  call({
    String? first_name,
    String? middle_name,
    String? last_name,
    String? gender,
    String? country,
    String? address_line1,
    String? address_line2,
    String? city,
    String? state,
    String? postal_code,
    String? birth_date,
  }) => _res;
}

class Input$CompleteMyOnboardingInput {
  factory Input$CompleteMyOnboardingInput({
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    bool? skip_questions,
  }) => Input$CompleteMyOnboardingInput._({
    if (heard_from_option_id != null)
      r'heard_from_option_id': heard_from_option_id,
    if (heard_from_custom != null) r'heard_from_custom': heard_from_custom,
    if (expectations_selected_ids != null)
      r'expectations_selected_ids': expectations_selected_ids,
    if (expectations_custom != null)
      r'expectations_custom': expectations_custom,
    if (skip_questions != null) r'skip_questions': skip_questions,
  });

  Input$CompleteMyOnboardingInput._(this._$data);

  factory Input$CompleteMyOnboardingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('heard_from_option_id')) {
      final l$heard_from_option_id = data['heard_from_option_id'];
      result$data['heard_from_option_id'] = (l$heard_from_option_id as String?);
    }
    if (data.containsKey('heard_from_custom')) {
      final l$heard_from_custom = data['heard_from_custom'];
      result$data['heard_from_custom'] = (l$heard_from_custom as String?);
    }
    if (data.containsKey('expectations_selected_ids')) {
      final l$expectations_selected_ids = data['expectations_selected_ids'];
      result$data['expectations_selected_ids'] =
          (l$expectations_selected_ids as List<dynamic>?)
              ?.map((e) => (e as String))
              .toList();
    }
    if (data.containsKey('expectations_custom')) {
      final l$expectations_custom = data['expectations_custom'];
      result$data['expectations_custom'] = (l$expectations_custom as String?);
    }
    if (data.containsKey('skip_questions')) {
      final l$skip_questions = data['skip_questions'];
      result$data['skip_questions'] = (l$skip_questions as bool?);
    }
    return Input$CompleteMyOnboardingInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get heard_from_option_id =>
      (_$data['heard_from_option_id'] as String?);

  String? get heard_from_custom => (_$data['heard_from_custom'] as String?);

  List<String>? get expectations_selected_ids =>
      (_$data['expectations_selected_ids'] as List<String>?);

  String? get expectations_custom => (_$data['expectations_custom'] as String?);

  bool? get skip_questions => (_$data['skip_questions'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('heard_from_option_id')) {
      final l$heard_from_option_id = heard_from_option_id;
      result$data['heard_from_option_id'] = l$heard_from_option_id;
    }
    if (_$data.containsKey('heard_from_custom')) {
      final l$heard_from_custom = heard_from_custom;
      result$data['heard_from_custom'] = l$heard_from_custom;
    }
    if (_$data.containsKey('expectations_selected_ids')) {
      final l$expectations_selected_ids = expectations_selected_ids;
      result$data['expectations_selected_ids'] = l$expectations_selected_ids
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('expectations_custom')) {
      final l$expectations_custom = expectations_custom;
      result$data['expectations_custom'] = l$expectations_custom;
    }
    if (_$data.containsKey('skip_questions')) {
      final l$skip_questions = skip_questions;
      result$data['skip_questions'] = l$skip_questions;
    }
    return result$data;
  }

  CopyWith$Input$CompleteMyOnboardingInput<Input$CompleteMyOnboardingInput>
  get copyWith => CopyWith$Input$CompleteMyOnboardingInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CompleteMyOnboardingInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$heard_from_option_id = heard_from_option_id;
    final lOther$heard_from_option_id = other.heard_from_option_id;
    if (_$data.containsKey('heard_from_option_id') !=
        other._$data.containsKey('heard_from_option_id')) {
      return false;
    }
    if (l$heard_from_option_id != lOther$heard_from_option_id) {
      return false;
    }
    final l$heard_from_custom = heard_from_custom;
    final lOther$heard_from_custom = other.heard_from_custom;
    if (_$data.containsKey('heard_from_custom') !=
        other._$data.containsKey('heard_from_custom')) {
      return false;
    }
    if (l$heard_from_custom != lOther$heard_from_custom) {
      return false;
    }
    final l$expectations_selected_ids = expectations_selected_ids;
    final lOther$expectations_selected_ids = other.expectations_selected_ids;
    if (_$data.containsKey('expectations_selected_ids') !=
        other._$data.containsKey('expectations_selected_ids')) {
      return false;
    }
    if (l$expectations_selected_ids != null &&
        lOther$expectations_selected_ids != null) {
      if (l$expectations_selected_ids.length !=
          lOther$expectations_selected_ids.length) {
        return false;
      }
      for (int i = 0; i < l$expectations_selected_ids.length; i++) {
        final l$expectations_selected_ids$entry =
            l$expectations_selected_ids[i];
        final lOther$expectations_selected_ids$entry =
            lOther$expectations_selected_ids[i];
        if (l$expectations_selected_ids$entry !=
            lOther$expectations_selected_ids$entry) {
          return false;
        }
      }
    } else if (l$expectations_selected_ids !=
        lOther$expectations_selected_ids) {
      return false;
    }
    final l$expectations_custom = expectations_custom;
    final lOther$expectations_custom = other.expectations_custom;
    if (_$data.containsKey('expectations_custom') !=
        other._$data.containsKey('expectations_custom')) {
      return false;
    }
    if (l$expectations_custom != lOther$expectations_custom) {
      return false;
    }
    final l$skip_questions = skip_questions;
    final lOther$skip_questions = other.skip_questions;
    if (_$data.containsKey('skip_questions') !=
        other._$data.containsKey('skip_questions')) {
      return false;
    }
    if (l$skip_questions != lOther$skip_questions) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$heard_from_option_id = heard_from_option_id;
    final l$heard_from_custom = heard_from_custom;
    final l$expectations_selected_ids = expectations_selected_ids;
    final l$expectations_custom = expectations_custom;
    final l$skip_questions = skip_questions;
    return Object.hashAll([
      _$data.containsKey('heard_from_option_id')
          ? l$heard_from_option_id
          : const {},
      _$data.containsKey('heard_from_custom') ? l$heard_from_custom : const {},
      _$data.containsKey('expectations_selected_ids')
          ? l$expectations_selected_ids == null
                ? null
                : Object.hashAll(l$expectations_selected_ids.map((v) => v))
          : const {},
      _$data.containsKey('expectations_custom')
          ? l$expectations_custom
          : const {},
      _$data.containsKey('skip_questions') ? l$skip_questions : const {},
    ]);
  }
}

abstract class CopyWith$Input$CompleteMyOnboardingInput<TRes> {
  factory CopyWith$Input$CompleteMyOnboardingInput(
    Input$CompleteMyOnboardingInput instance,
    TRes Function(Input$CompleteMyOnboardingInput) then,
  ) = _CopyWithImpl$Input$CompleteMyOnboardingInput;

  factory CopyWith$Input$CompleteMyOnboardingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CompleteMyOnboardingInput;

  TRes call({
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    bool? skip_questions,
  });
}

class _CopyWithImpl$Input$CompleteMyOnboardingInput<TRes>
    implements CopyWith$Input$CompleteMyOnboardingInput<TRes> {
  _CopyWithImpl$Input$CompleteMyOnboardingInput(this._instance, this._then);

  final Input$CompleteMyOnboardingInput _instance;

  final TRes Function(Input$CompleteMyOnboardingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? heard_from_option_id = _undefined,
    Object? heard_from_custom = _undefined,
    Object? expectations_selected_ids = _undefined,
    Object? expectations_custom = _undefined,
    Object? skip_questions = _undefined,
  }) => _then(
    Input$CompleteMyOnboardingInput._({
      ..._instance._$data,
      if (heard_from_option_id != _undefined)
        'heard_from_option_id': (heard_from_option_id as String?),
      if (heard_from_custom != _undefined)
        'heard_from_custom': (heard_from_custom as String?),
      if (expectations_selected_ids != _undefined)
        'expectations_selected_ids':
            (expectations_selected_ids as List<String>?),
      if (expectations_custom != _undefined)
        'expectations_custom': (expectations_custom as String?),
      if (skip_questions != _undefined)
        'skip_questions': (skip_questions as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$CompleteMyOnboardingInput<TRes>
    implements CopyWith$Input$CompleteMyOnboardingInput<TRes> {
  _CopyWithStubImpl$Input$CompleteMyOnboardingInput(this._res);

  TRes _res;

  call({
    String? heard_from_option_id,
    String? heard_from_custom,
    List<String>? expectations_selected_ids,
    String? expectations_custom,
    bool? skip_questions,
  }) => _res;
}

class Input$KeyInput {
  factory Input$KeyInput({
    String? beneficiary_id,
    String? ref_id,
    String? publicKey,
    String? key,
  }) => Input$KeyInput._({
    if (beneficiary_id != null) r'beneficiary_id': beneficiary_id,
    if (ref_id != null) r'ref_id': ref_id,
    if (publicKey != null) r'publicKey': publicKey,
    if (key != null) r'key': key,
  });

  Input$KeyInput._(this._$data);

  factory Input$KeyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('beneficiary_id')) {
      final l$beneficiary_id = data['beneficiary_id'];
      result$data['beneficiary_id'] = (l$beneficiary_id as String?);
    }
    if (data.containsKey('ref_id')) {
      final l$ref_id = data['ref_id'];
      result$data['ref_id'] = (l$ref_id as String?);
    }
    if (data.containsKey('publicKey')) {
      final l$publicKey = data['publicKey'];
      result$data['publicKey'] = (l$publicKey as String?);
    }
    if (data.containsKey('key')) {
      final l$key = data['key'];
      result$data['key'] = (l$key as String?);
    }
    return Input$KeyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get beneficiary_id => (_$data['beneficiary_id'] as String?);

  String? get ref_id => (_$data['ref_id'] as String?);

  String? get publicKey => (_$data['publicKey'] as String?);

  String? get key => (_$data['key'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('beneficiary_id')) {
      final l$beneficiary_id = beneficiary_id;
      result$data['beneficiary_id'] = l$beneficiary_id;
    }
    if (_$data.containsKey('ref_id')) {
      final l$ref_id = ref_id;
      result$data['ref_id'] = l$ref_id;
    }
    if (_$data.containsKey('publicKey')) {
      final l$publicKey = publicKey;
      result$data['publicKey'] = l$publicKey;
    }
    if (_$data.containsKey('key')) {
      final l$key = key;
      result$data['key'] = l$key;
    }
    return result$data;
  }

  CopyWith$Input$KeyInput<Input$KeyInput> get copyWith =>
      CopyWith$Input$KeyInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$KeyInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$beneficiary_id = beneficiary_id;
    final lOther$beneficiary_id = other.beneficiary_id;
    if (_$data.containsKey('beneficiary_id') !=
        other._$data.containsKey('beneficiary_id')) {
      return false;
    }
    if (l$beneficiary_id != lOther$beneficiary_id) {
      return false;
    }
    final l$ref_id = ref_id;
    final lOther$ref_id = other.ref_id;
    if (_$data.containsKey('ref_id') != other._$data.containsKey('ref_id')) {
      return false;
    }
    if (l$ref_id != lOther$ref_id) {
      return false;
    }
    final l$publicKey = publicKey;
    final lOther$publicKey = other.publicKey;
    if (_$data.containsKey('publicKey') !=
        other._$data.containsKey('publicKey')) {
      return false;
    }
    if (l$publicKey != lOther$publicKey) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (_$data.containsKey('key') != other._$data.containsKey('key')) {
      return false;
    }
    if (l$key != lOther$key) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$beneficiary_id = beneficiary_id;
    final l$ref_id = ref_id;
    final l$publicKey = publicKey;
    final l$key = key;
    return Object.hashAll([
      _$data.containsKey('beneficiary_id') ? l$beneficiary_id : const {},
      _$data.containsKey('ref_id') ? l$ref_id : const {},
      _$data.containsKey('publicKey') ? l$publicKey : const {},
      _$data.containsKey('key') ? l$key : const {},
    ]);
  }
}

abstract class CopyWith$Input$KeyInput<TRes> {
  factory CopyWith$Input$KeyInput(
    Input$KeyInput instance,
    TRes Function(Input$KeyInput) then,
  ) = _CopyWithImpl$Input$KeyInput;

  factory CopyWith$Input$KeyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$KeyInput;

  TRes call({
    String? beneficiary_id,
    String? ref_id,
    String? publicKey,
    String? key,
  });
}

class _CopyWithImpl$Input$KeyInput<TRes>
    implements CopyWith$Input$KeyInput<TRes> {
  _CopyWithImpl$Input$KeyInput(this._instance, this._then);

  final Input$KeyInput _instance;

  final TRes Function(Input$KeyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? beneficiary_id = _undefined,
    Object? ref_id = _undefined,
    Object? publicKey = _undefined,
    Object? key = _undefined,
  }) => _then(
    Input$KeyInput._({
      ..._instance._$data,
      if (beneficiary_id != _undefined)
        'beneficiary_id': (beneficiary_id as String?),
      if (ref_id != _undefined) 'ref_id': (ref_id as String?),
      if (publicKey != _undefined) 'publicKey': (publicKey as String?),
      if (key != _undefined) 'key': (key as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$KeyInput<TRes>
    implements CopyWith$Input$KeyInput<TRes> {
  _CopyWithStubImpl$Input$KeyInput(this._res);

  TRes _res;

  call({
    String? beneficiary_id,
    String? ref_id,
    String? publicKey,
    String? key,
  }) => _res;
}

class Input$UpdateMetamodelInput {
  factory Input$UpdateMetamodelInput({required String id, String? metadata}) =>
      Input$UpdateMetamodelInput._({
        r'id': id,
        if (metadata != null) r'metadata': metadata,
      });

  Input$UpdateMetamodelInput._(this._$data);

  factory Input$UpdateMetamodelInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('metadata')) {
      final l$metadata = data['metadata'];
      result$data['metadata'] = (l$metadata as String?);
    }
    return Input$UpdateMetamodelInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get metadata => (_$data['metadata'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('metadata')) {
      final l$metadata = metadata;
      result$data['metadata'] = l$metadata;
    }
    return result$data;
  }

  CopyWith$Input$UpdateMetamodelInput<Input$UpdateMetamodelInput>
  get copyWith => CopyWith$Input$UpdateMetamodelInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateMetamodelInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (_$data.containsKey('metadata') !=
        other._$data.containsKey('metadata')) {
      return false;
    }
    if (l$metadata != lOther$metadata) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$metadata = metadata;
    return Object.hashAll([
      l$id,
      _$data.containsKey('metadata') ? l$metadata : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateMetamodelInput<TRes> {
  factory CopyWith$Input$UpdateMetamodelInput(
    Input$UpdateMetamodelInput instance,
    TRes Function(Input$UpdateMetamodelInput) then,
  ) = _CopyWithImpl$Input$UpdateMetamodelInput;

  factory CopyWith$Input$UpdateMetamodelInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateMetamodelInput;

  TRes call({String? id, String? metadata});
}

class _CopyWithImpl$Input$UpdateMetamodelInput<TRes>
    implements CopyWith$Input$UpdateMetamodelInput<TRes> {
  _CopyWithImpl$Input$UpdateMetamodelInput(this._instance, this._then);

  final Input$UpdateMetamodelInput _instance;

  final TRes Function(Input$UpdateMetamodelInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? metadata = _undefined}) => _then(
    Input$UpdateMetamodelInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (metadata != _undefined) 'metadata': (metadata as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateMetamodelInput<TRes>
    implements CopyWith$Input$UpdateMetamodelInput<TRes> {
  _CopyWithStubImpl$Input$UpdateMetamodelInput(this._res);

  TRes _res;

  call({String? id, String? metadata}) => _res;
}

class Input$UpdateFolderInput {
  factory Input$UpdateFolderInput({required String id, String? name}) =>
      Input$UpdateFolderInput._({r'id': id, if (name != null) r'name': name});

  Input$UpdateFolderInput._(this._$data);

  factory Input$UpdateFolderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    return Input$UpdateFolderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    return result$data;
  }

  CopyWith$Input$UpdateFolderInput<Input$UpdateFolderInput> get copyWith =>
      CopyWith$Input$UpdateFolderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateFolderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateFolderInput<TRes> {
  factory CopyWith$Input$UpdateFolderInput(
    Input$UpdateFolderInput instance,
    TRes Function(Input$UpdateFolderInput) then,
  ) = _CopyWithImpl$Input$UpdateFolderInput;

  factory CopyWith$Input$UpdateFolderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateFolderInput;

  TRes call({String? id, String? name});
}

class _CopyWithImpl$Input$UpdateFolderInput<TRes>
    implements CopyWith$Input$UpdateFolderInput<TRes> {
  _CopyWithImpl$Input$UpdateFolderInput(this._instance, this._then);

  final Input$UpdateFolderInput _instance;

  final TRes Function(Input$UpdateFolderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? name = _undefined}) => _then(
    Input$UpdateFolderInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateFolderInput<TRes>
    implements CopyWith$Input$UpdateFolderInput<TRes> {
  _CopyWithStubImpl$Input$UpdateFolderInput(this._res);

  TRes _res;

  call({String? id, String? name}) => _res;
}

class Input$HQBroadcastDraftInput {
  factory Input$HQBroadcastDraftInput({
    required String name,
    Enum$HQBroadcastCategory? category,
    String? from,
    required String subject,
    required String html,
    required Object rules,
  }) => Input$HQBroadcastDraftInput._({
    r'name': name,
    if (category != null) r'category': category,
    if (from != null) r'from': from,
    r'subject': subject,
    r'html': html,
    r'rules': rules,
  });

  Input$HQBroadcastDraftInput._(this._$data);

  factory Input$HQBroadcastDraftInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = l$category == null
          ? null
          : fromJson$Enum$HQBroadcastCategory((l$category as String));
    }
    if (data.containsKey('from')) {
      final l$from = data['from'];
      result$data['from'] = (l$from as String?);
    }
    final l$subject = data['subject'];
    result$data['subject'] = (l$subject as String);
    final l$html = data['html'];
    result$data['html'] = (l$html as String);
    final l$rules = data['rules'];
    result$data['rules'] = (l$rules as Object);
    return Input$HQBroadcastDraftInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  Enum$HQBroadcastCategory? get category =>
      (_$data['category'] as Enum$HQBroadcastCategory?);

  String? get from => (_$data['from'] as String?);

  String get subject => (_$data['subject'] as String);

  String get html => (_$data['html'] as String);

  Object get rules => (_$data['rules'] as Object);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category == null
          ? null
          : toJson$Enum$HQBroadcastCategory(l$category);
    }
    if (_$data.containsKey('from')) {
      final l$from = from;
      result$data['from'] = l$from;
    }
    final l$subject = subject;
    result$data['subject'] = l$subject;
    final l$html = html;
    result$data['html'] = l$html;
    final l$rules = rules;
    result$data['rules'] = l$rules;
    return result$data;
  }

  CopyWith$Input$HQBroadcastDraftInput<Input$HQBroadcastDraftInput>
  get copyWith => CopyWith$Input$HQBroadcastDraftInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$HQBroadcastDraftInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (_$data.containsKey('from') != other._$data.containsKey('from')) {
      return false;
    }
    if (l$from != lOther$from) {
      return false;
    }
    final l$subject = subject;
    final lOther$subject = other.subject;
    if (l$subject != lOther$subject) {
      return false;
    }
    final l$html = html;
    final lOther$html = other.html;
    if (l$html != lOther$html) {
      return false;
    }
    final l$rules = rules;
    final lOther$rules = other.rules;
    if (l$rules != lOther$rules) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$category = category;
    final l$from = from;
    final l$subject = subject;
    final l$html = html;
    final l$rules = rules;
    return Object.hashAll([
      l$name,
      _$data.containsKey('category') ? l$category : const {},
      _$data.containsKey('from') ? l$from : const {},
      l$subject,
      l$html,
      l$rules,
    ]);
  }
}

abstract class CopyWith$Input$HQBroadcastDraftInput<TRes> {
  factory CopyWith$Input$HQBroadcastDraftInput(
    Input$HQBroadcastDraftInput instance,
    TRes Function(Input$HQBroadcastDraftInput) then,
  ) = _CopyWithImpl$Input$HQBroadcastDraftInput;

  factory CopyWith$Input$HQBroadcastDraftInput.stub(TRes res) =
      _CopyWithStubImpl$Input$HQBroadcastDraftInput;

  TRes call({
    String? name,
    Enum$HQBroadcastCategory? category,
    String? from,
    String? subject,
    String? html,
    Object? rules,
  });
}

class _CopyWithImpl$Input$HQBroadcastDraftInput<TRes>
    implements CopyWith$Input$HQBroadcastDraftInput<TRes> {
  _CopyWithImpl$Input$HQBroadcastDraftInput(this._instance, this._then);

  final Input$HQBroadcastDraftInput _instance;

  final TRes Function(Input$HQBroadcastDraftInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? category = _undefined,
    Object? from = _undefined,
    Object? subject = _undefined,
    Object? html = _undefined,
    Object? rules = _undefined,
  }) => _then(
    Input$HQBroadcastDraftInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (category != _undefined)
        'category': (category as Enum$HQBroadcastCategory?),
      if (from != _undefined) 'from': (from as String?),
      if (subject != _undefined && subject != null)
        'subject': (subject as String),
      if (html != _undefined && html != null) 'html': (html as String),
      if (rules != _undefined && rules != null) 'rules': (rules as Object),
    }),
  );
}

class _CopyWithStubImpl$Input$HQBroadcastDraftInput<TRes>
    implements CopyWith$Input$HQBroadcastDraftInput<TRes> {
  _CopyWithStubImpl$Input$HQBroadcastDraftInput(this._res);

  TRes _res;

  call({
    String? name,
    Enum$HQBroadcastCategory? category,
    String? from,
    String? subject,
    String? html,
    Object? rules,
  }) => _res;
}

class Input$ObjectiveStepInput {
  factory Input$ObjectiveStepInput({required String step, Object? value}) =>
      Input$ObjectiveStepInput._({
        r'step': step,
        if (value != null) r'value': value,
      });

  Input$ObjectiveStepInput._(this._$data);

  factory Input$ObjectiveStepInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$step = data['step'];
    result$data['step'] = (l$step as String);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as Object?);
    }
    return Input$ObjectiveStepInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get step => (_$data['step'] as String);

  Object? get value => (_$data['value'] as Object?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$step = step;
    result$data['step'] = l$step;
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Input$ObjectiveStepInput<Input$ObjectiveStepInput> get copyWith =>
      CopyWith$Input$ObjectiveStepInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ObjectiveStepInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$step = step;
    final lOther$step = other.step;
    if (l$step != lOther$step) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$step = step;
    final l$value = value;
    return Object.hashAll([
      l$step,
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$ObjectiveStepInput<TRes> {
  factory CopyWith$Input$ObjectiveStepInput(
    Input$ObjectiveStepInput instance,
    TRes Function(Input$ObjectiveStepInput) then,
  ) = _CopyWithImpl$Input$ObjectiveStepInput;

  factory CopyWith$Input$ObjectiveStepInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ObjectiveStepInput;

  TRes call({String? step, Object? value});
}

class _CopyWithImpl$Input$ObjectiveStepInput<TRes>
    implements CopyWith$Input$ObjectiveStepInput<TRes> {
  _CopyWithImpl$Input$ObjectiveStepInput(this._instance, this._then);

  final Input$ObjectiveStepInput _instance;

  final TRes Function(Input$ObjectiveStepInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? step = _undefined, Object? value = _undefined}) => _then(
    Input$ObjectiveStepInput._({
      ..._instance._$data,
      if (step != _undefined && step != null) 'step': (step as String),
      if (value != _undefined) 'value': (value as Object?),
    }),
  );
}

class _CopyWithStubImpl$Input$ObjectiveStepInput<TRes>
    implements CopyWith$Input$ObjectiveStepInput<TRes> {
  _CopyWithStubImpl$Input$ObjectiveStepInput(this._res);

  TRes _res;

  call({String? step, Object? value}) => _res;
}

class Input$GuidedObjectiveAnswers {
  factory Input$GuidedObjectiveAnswers({
    String? firstName,
    String? lastName,
    String? birthDate,
    String? email,
    bool? sendInvite,
    bool? anonymousInvite,
  }) => Input$GuidedObjectiveAnswers._({
    if (firstName != null) r'firstName': firstName,
    if (lastName != null) r'lastName': lastName,
    if (birthDate != null) r'birthDate': birthDate,
    if (email != null) r'email': email,
    if (sendInvite != null) r'sendInvite': sendInvite,
    if (anonymousInvite != null) r'anonymousInvite': anonymousInvite,
  });

  Input$GuidedObjectiveAnswers._(this._$data);

  factory Input$GuidedObjectiveAnswers.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('birthDate')) {
      final l$birthDate = data['birthDate'];
      result$data['birthDate'] = (l$birthDate as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('sendInvite')) {
      final l$sendInvite = data['sendInvite'];
      result$data['sendInvite'] = (l$sendInvite as bool?);
    }
    if (data.containsKey('anonymousInvite')) {
      final l$anonymousInvite = data['anonymousInvite'];
      result$data['anonymousInvite'] = (l$anonymousInvite as bool?);
    }
    return Input$GuidedObjectiveAnswers._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get birthDate => (_$data['birthDate'] as String?);

  String? get email => (_$data['email'] as String?);

  bool? get sendInvite => (_$data['sendInvite'] as bool?);

  bool? get anonymousInvite => (_$data['anonymousInvite'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('birthDate')) {
      final l$birthDate = birthDate;
      result$data['birthDate'] = l$birthDate;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('sendInvite')) {
      final l$sendInvite = sendInvite;
      result$data['sendInvite'] = l$sendInvite;
    }
    if (_$data.containsKey('anonymousInvite')) {
      final l$anonymousInvite = anonymousInvite;
      result$data['anonymousInvite'] = l$anonymousInvite;
    }
    return result$data;
  }

  CopyWith$Input$GuidedObjectiveAnswers<Input$GuidedObjectiveAnswers>
  get copyWith => CopyWith$Input$GuidedObjectiveAnswers(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$GuidedObjectiveAnswers ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$birthDate = birthDate;
    final lOther$birthDate = other.birthDate;
    if (_$data.containsKey('birthDate') !=
        other._$data.containsKey('birthDate')) {
      return false;
    }
    if (l$birthDate != lOther$birthDate) {
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
    final l$sendInvite = sendInvite;
    final lOther$sendInvite = other.sendInvite;
    if (_$data.containsKey('sendInvite') !=
        other._$data.containsKey('sendInvite')) {
      return false;
    }
    if (l$sendInvite != lOther$sendInvite) {
      return false;
    }
    final l$anonymousInvite = anonymousInvite;
    final lOther$anonymousInvite = other.anonymousInvite;
    if (_$data.containsKey('anonymousInvite') !=
        other._$data.containsKey('anonymousInvite')) {
      return false;
    }
    if (l$anonymousInvite != lOther$anonymousInvite) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$birthDate = birthDate;
    final l$email = email;
    final l$sendInvite = sendInvite;
    final l$anonymousInvite = anonymousInvite;
    return Object.hashAll([
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('birthDate') ? l$birthDate : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('sendInvite') ? l$sendInvite : const {},
      _$data.containsKey('anonymousInvite') ? l$anonymousInvite : const {},
    ]);
  }
}

abstract class CopyWith$Input$GuidedObjectiveAnswers<TRes> {
  factory CopyWith$Input$GuidedObjectiveAnswers(
    Input$GuidedObjectiveAnswers instance,
    TRes Function(Input$GuidedObjectiveAnswers) then,
  ) = _CopyWithImpl$Input$GuidedObjectiveAnswers;

  factory CopyWith$Input$GuidedObjectiveAnswers.stub(TRes res) =
      _CopyWithStubImpl$Input$GuidedObjectiveAnswers;

  TRes call({
    String? firstName,
    String? lastName,
    String? birthDate,
    String? email,
    bool? sendInvite,
    bool? anonymousInvite,
  });
}

class _CopyWithImpl$Input$GuidedObjectiveAnswers<TRes>
    implements CopyWith$Input$GuidedObjectiveAnswers<TRes> {
  _CopyWithImpl$Input$GuidedObjectiveAnswers(this._instance, this._then);

  final Input$GuidedObjectiveAnswers _instance;

  final TRes Function(Input$GuidedObjectiveAnswers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? birthDate = _undefined,
    Object? email = _undefined,
    Object? sendInvite = _undefined,
    Object? anonymousInvite = _undefined,
  }) => _then(
    Input$GuidedObjectiveAnswers._({
      ..._instance._$data,
      if (firstName != _undefined) 'firstName': (firstName as String?),
      if (lastName != _undefined) 'lastName': (lastName as String?),
      if (birthDate != _undefined) 'birthDate': (birthDate as String?),
      if (email != _undefined) 'email': (email as String?),
      if (sendInvite != _undefined) 'sendInvite': (sendInvite as bool?),
      if (anonymousInvite != _undefined)
        'anonymousInvite': (anonymousInvite as bool?),
    }),
  );
}

class _CopyWithStubImpl$Input$GuidedObjectiveAnswers<TRes>
    implements CopyWith$Input$GuidedObjectiveAnswers<TRes> {
  _CopyWithStubImpl$Input$GuidedObjectiveAnswers(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    String? birthDate,
    String? email,
    bool? sendInvite,
    bool? anonymousInvite,
  }) => _res;
}

enum Enum$InvitationEmailStatus {
  sent,
  failed,
  already_sent,
  skipped,
  $unknown;

  factory Enum$InvitationEmailStatus.fromJson(String value) =>
      fromJson$Enum$InvitationEmailStatus(value);

  String toJson() => toJson$Enum$InvitationEmailStatus(this);
}

String toJson$Enum$InvitationEmailStatus(Enum$InvitationEmailStatus e) {
  switch (e) {
    case Enum$InvitationEmailStatus.sent:
      return r'sent';
    case Enum$InvitationEmailStatus.failed:
      return r'failed';
    case Enum$InvitationEmailStatus.already_sent:
      return r'already_sent';
    case Enum$InvitationEmailStatus.skipped:
      return r'skipped';
    case Enum$InvitationEmailStatus.$unknown:
      return r'$unknown';
  }
}

Enum$InvitationEmailStatus fromJson$Enum$InvitationEmailStatus(String value) {
  switch (value) {
    case r'sent':
      return Enum$InvitationEmailStatus.sent;
    case r'failed':
      return Enum$InvitationEmailStatus.failed;
    case r'already_sent':
      return Enum$InvitationEmailStatus.already_sent;
    case r'skipped':
      return Enum$InvitationEmailStatus.skipped;
    default:
      return Enum$InvitationEmailStatus.$unknown;
  }
}

enum Enum$UploadSessionStatus {
  CREATED,
  PODS_UPLOADED,
  KEYS_UPLOADED,
  COMPLETED,
  $unknown;

  factory Enum$UploadSessionStatus.fromJson(String value) =>
      fromJson$Enum$UploadSessionStatus(value);

  String toJson() => toJson$Enum$UploadSessionStatus(this);
}

String toJson$Enum$UploadSessionStatus(Enum$UploadSessionStatus e) {
  switch (e) {
    case Enum$UploadSessionStatus.CREATED:
      return r'CREATED';
    case Enum$UploadSessionStatus.PODS_UPLOADED:
      return r'PODS_UPLOADED';
    case Enum$UploadSessionStatus.KEYS_UPLOADED:
      return r'KEYS_UPLOADED';
    case Enum$UploadSessionStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$UploadSessionStatus.$unknown:
      return r'$unknown';
  }
}

Enum$UploadSessionStatus fromJson$Enum$UploadSessionStatus(String value) {
  switch (value) {
    case r'CREATED':
      return Enum$UploadSessionStatus.CREATED;
    case r'PODS_UPLOADED':
      return Enum$UploadSessionStatus.PODS_UPLOADED;
    case r'KEYS_UPLOADED':
      return Enum$UploadSessionStatus.KEYS_UPLOADED;
    case r'COMPLETED':
      return Enum$UploadSessionStatus.COMPLETED;
    default:
      return Enum$UploadSessionStatus.$unknown;
  }
}

enum Enum$UploadSessionType {
  STORAGE_POD,
  TEXT_POD,
  $unknown;

  factory Enum$UploadSessionType.fromJson(String value) =>
      fromJson$Enum$UploadSessionType(value);

  String toJson() => toJson$Enum$UploadSessionType(this);
}

String toJson$Enum$UploadSessionType(Enum$UploadSessionType e) {
  switch (e) {
    case Enum$UploadSessionType.STORAGE_POD:
      return r'STORAGE_POD';
    case Enum$UploadSessionType.TEXT_POD:
      return r'TEXT_POD';
    case Enum$UploadSessionType.$unknown:
      return r'$unknown';
  }
}

Enum$UploadSessionType fromJson$Enum$UploadSessionType(String value) {
  switch (value) {
    case r'STORAGE_POD':
      return Enum$UploadSessionType.STORAGE_POD;
    case r'TEXT_POD':
      return Enum$UploadSessionType.TEXT_POD;
    default:
      return Enum$UploadSessionType.$unknown;
  }
}

enum Enum$MetamodelType {
  NOTE,
  BANK_ACCOUNT,
  EMAIL_ACCOUNT,
  DEVICE_LOCK,
  PASSWORD,
  SEED_PHRASE,
  DEFI_STAKING,
  PAYMENT_CARD,
  FILE,
  $unknown;

  factory Enum$MetamodelType.fromJson(String value) =>
      fromJson$Enum$MetamodelType(value);

  String toJson() => toJson$Enum$MetamodelType(this);
}

String toJson$Enum$MetamodelType(Enum$MetamodelType e) {
  switch (e) {
    case Enum$MetamodelType.NOTE:
      return r'NOTE';
    case Enum$MetamodelType.BANK_ACCOUNT:
      return r'BANK_ACCOUNT';
    case Enum$MetamodelType.EMAIL_ACCOUNT:
      return r'EMAIL_ACCOUNT';
    case Enum$MetamodelType.DEVICE_LOCK:
      return r'DEVICE_LOCK';
    case Enum$MetamodelType.PASSWORD:
      return r'PASSWORD';
    case Enum$MetamodelType.SEED_PHRASE:
      return r'SEED_PHRASE';
    case Enum$MetamodelType.DEFI_STAKING:
      return r'DEFI_STAKING';
    case Enum$MetamodelType.PAYMENT_CARD:
      return r'PAYMENT_CARD';
    case Enum$MetamodelType.FILE:
      return r'FILE';
    case Enum$MetamodelType.$unknown:
      return r'$unknown';
  }
}

Enum$MetamodelType fromJson$Enum$MetamodelType(String value) {
  switch (value) {
    case r'NOTE':
      return Enum$MetamodelType.NOTE;
    case r'BANK_ACCOUNT':
      return Enum$MetamodelType.BANK_ACCOUNT;
    case r'EMAIL_ACCOUNT':
      return Enum$MetamodelType.EMAIL_ACCOUNT;
    case r'DEVICE_LOCK':
      return Enum$MetamodelType.DEVICE_LOCK;
    case r'PASSWORD':
      return Enum$MetamodelType.PASSWORD;
    case r'SEED_PHRASE':
      return Enum$MetamodelType.SEED_PHRASE;
    case r'DEFI_STAKING':
      return Enum$MetamodelType.DEFI_STAKING;
    case r'PAYMENT_CARD':
      return Enum$MetamodelType.PAYMENT_CARD;
    case r'FILE':
      return Enum$MetamodelType.FILE;
    default:
      return Enum$MetamodelType.$unknown;
  }
}

enum Enum$HQFactorBucket {
  ZERO,
  ONE,
  TWO,
  MORE_THAN_TWO,
  $unknown;

  factory Enum$HQFactorBucket.fromJson(String value) =>
      fromJson$Enum$HQFactorBucket(value);

  String toJson() => toJson$Enum$HQFactorBucket(this);
}

String toJson$Enum$HQFactorBucket(Enum$HQFactorBucket e) {
  switch (e) {
    case Enum$HQFactorBucket.ZERO:
      return r'ZERO';
    case Enum$HQFactorBucket.ONE:
      return r'ONE';
    case Enum$HQFactorBucket.TWO:
      return r'TWO';
    case Enum$HQFactorBucket.MORE_THAN_TWO:
      return r'MORE_THAN_TWO';
    case Enum$HQFactorBucket.$unknown:
      return r'$unknown';
  }
}

Enum$HQFactorBucket fromJson$Enum$HQFactorBucket(String value) {
  switch (value) {
    case r'ZERO':
      return Enum$HQFactorBucket.ZERO;
    case r'ONE':
      return Enum$HQFactorBucket.ONE;
    case r'TWO':
      return Enum$HQFactorBucket.TWO;
    case r'MORE_THAN_TWO':
      return Enum$HQFactorBucket.MORE_THAN_TWO;
    default:
      return Enum$HQFactorBucket.$unknown;
  }
}

enum Enum$HQLiveUserAgeBucketSegment {
  TOTAL_LIVE,
  LIVE_PREMIUM,
  LIVE_FREE,
  $unknown;

  factory Enum$HQLiveUserAgeBucketSegment.fromJson(String value) =>
      fromJson$Enum$HQLiveUserAgeBucketSegment(value);

  String toJson() => toJson$Enum$HQLiveUserAgeBucketSegment(this);
}

String toJson$Enum$HQLiveUserAgeBucketSegment(
  Enum$HQLiveUserAgeBucketSegment e,
) {
  switch (e) {
    case Enum$HQLiveUserAgeBucketSegment.TOTAL_LIVE:
      return r'TOTAL_LIVE';
    case Enum$HQLiveUserAgeBucketSegment.LIVE_PREMIUM:
      return r'LIVE_PREMIUM';
    case Enum$HQLiveUserAgeBucketSegment.LIVE_FREE:
      return r'LIVE_FREE';
    case Enum$HQLiveUserAgeBucketSegment.$unknown:
      return r'$unknown';
  }
}

Enum$HQLiveUserAgeBucketSegment fromJson$Enum$HQLiveUserAgeBucketSegment(
  String value,
) {
  switch (value) {
    case r'TOTAL_LIVE':
      return Enum$HQLiveUserAgeBucketSegment.TOTAL_LIVE;
    case r'LIVE_PREMIUM':
      return Enum$HQLiveUserAgeBucketSegment.LIVE_PREMIUM;
    case r'LIVE_FREE':
      return Enum$HQLiveUserAgeBucketSegment.LIVE_FREE;
    default:
      return Enum$HQLiveUserAgeBucketSegment.$unknown;
  }
}

enum Enum$HQFinanceCompareMode {
  PREVIOUS_PERIOD,
  PREVIOUS_MONTH,
  $unknown;

  factory Enum$HQFinanceCompareMode.fromJson(String value) =>
      fromJson$Enum$HQFinanceCompareMode(value);

  String toJson() => toJson$Enum$HQFinanceCompareMode(this);
}

String toJson$Enum$HQFinanceCompareMode(Enum$HQFinanceCompareMode e) {
  switch (e) {
    case Enum$HQFinanceCompareMode.PREVIOUS_PERIOD:
      return r'PREVIOUS_PERIOD';
    case Enum$HQFinanceCompareMode.PREVIOUS_MONTH:
      return r'PREVIOUS_MONTH';
    case Enum$HQFinanceCompareMode.$unknown:
      return r'$unknown';
  }
}

Enum$HQFinanceCompareMode fromJson$Enum$HQFinanceCompareMode(String value) {
  switch (value) {
    case r'PREVIOUS_PERIOD':
      return Enum$HQFinanceCompareMode.PREVIOUS_PERIOD;
    case r'PREVIOUS_MONTH':
      return Enum$HQFinanceCompareMode.PREVIOUS_MONTH;
    default:
      return Enum$HQFinanceCompareMode.$unknown;
  }
}

enum Enum$HQUserKPIGranularity {
  HOURLY,
  DAILY,
  WEEKLY,
  MONTHLY,
  YEARLY,
  $unknown;

  factory Enum$HQUserKPIGranularity.fromJson(String value) =>
      fromJson$Enum$HQUserKPIGranularity(value);

  String toJson() => toJson$Enum$HQUserKPIGranularity(this);
}

String toJson$Enum$HQUserKPIGranularity(Enum$HQUserKPIGranularity e) {
  switch (e) {
    case Enum$HQUserKPIGranularity.HOURLY:
      return r'HOURLY';
    case Enum$HQUserKPIGranularity.DAILY:
      return r'DAILY';
    case Enum$HQUserKPIGranularity.WEEKLY:
      return r'WEEKLY';
    case Enum$HQUserKPIGranularity.MONTHLY:
      return r'MONTHLY';
    case Enum$HQUserKPIGranularity.YEARLY:
      return r'YEARLY';
    case Enum$HQUserKPIGranularity.$unknown:
      return r'$unknown';
  }
}

Enum$HQUserKPIGranularity fromJson$Enum$HQUserKPIGranularity(String value) {
  switch (value) {
    case r'HOURLY':
      return Enum$HQUserKPIGranularity.HOURLY;
    case r'DAILY':
      return Enum$HQUserKPIGranularity.DAILY;
    case r'WEEKLY':
      return Enum$HQUserKPIGranularity.WEEKLY;
    case r'MONTHLY':
      return Enum$HQUserKPIGranularity.MONTHLY;
    case r'YEARLY':
      return Enum$HQUserKPIGranularity.YEARLY;
    default:
      return Enum$HQUserKPIGranularity.$unknown;
  }
}

enum Enum$HQUserKPISeriesMode {
  PERIOD,
  CUMULATIVE,
  $unknown;

  factory Enum$HQUserKPISeriesMode.fromJson(String value) =>
      fromJson$Enum$HQUserKPISeriesMode(value);

  String toJson() => toJson$Enum$HQUserKPISeriesMode(this);
}

String toJson$Enum$HQUserKPISeriesMode(Enum$HQUserKPISeriesMode e) {
  switch (e) {
    case Enum$HQUserKPISeriesMode.PERIOD:
      return r'PERIOD';
    case Enum$HQUserKPISeriesMode.CUMULATIVE:
      return r'CUMULATIVE';
    case Enum$HQUserKPISeriesMode.$unknown:
      return r'$unknown';
  }
}

Enum$HQUserKPISeriesMode fromJson$Enum$HQUserKPISeriesMode(String value) {
  switch (value) {
    case r'PERIOD':
      return Enum$HQUserKPISeriesMode.PERIOD;
    case r'CUMULATIVE':
      return Enum$HQUserKPISeriesMode.CUMULATIVE;
    default:
      return Enum$HQUserKPISeriesMode.$unknown;
  }
}

enum Enum$HQGuidanceStatus {
  COMPLETED,
  FOLLOW_UP_PENDING,
  AVAILABLE,
  DEFERRED,
  PREMIUM_LOCKED,
  SEGMENT_DISABLED,
  DEPENDENCY_BLOCKED,
  NOT_APPLICABLE,
  BROWSER_CHECK_REQUIRED,
  LEGACY_DISMISSED,
  $unknown;

  factory Enum$HQGuidanceStatus.fromJson(String value) =>
      fromJson$Enum$HQGuidanceStatus(value);

  String toJson() => toJson$Enum$HQGuidanceStatus(this);
}

String toJson$Enum$HQGuidanceStatus(Enum$HQGuidanceStatus e) {
  switch (e) {
    case Enum$HQGuidanceStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$HQGuidanceStatus.FOLLOW_UP_PENDING:
      return r'FOLLOW_UP_PENDING';
    case Enum$HQGuidanceStatus.AVAILABLE:
      return r'AVAILABLE';
    case Enum$HQGuidanceStatus.DEFERRED:
      return r'DEFERRED';
    case Enum$HQGuidanceStatus.PREMIUM_LOCKED:
      return r'PREMIUM_LOCKED';
    case Enum$HQGuidanceStatus.SEGMENT_DISABLED:
      return r'SEGMENT_DISABLED';
    case Enum$HQGuidanceStatus.DEPENDENCY_BLOCKED:
      return r'DEPENDENCY_BLOCKED';
    case Enum$HQGuidanceStatus.NOT_APPLICABLE:
      return r'NOT_APPLICABLE';
    case Enum$HQGuidanceStatus.BROWSER_CHECK_REQUIRED:
      return r'BROWSER_CHECK_REQUIRED';
    case Enum$HQGuidanceStatus.LEGACY_DISMISSED:
      return r'LEGACY_DISMISSED';
    case Enum$HQGuidanceStatus.$unknown:
      return r'$unknown';
  }
}

Enum$HQGuidanceStatus fromJson$Enum$HQGuidanceStatus(String value) {
  switch (value) {
    case r'COMPLETED':
      return Enum$HQGuidanceStatus.COMPLETED;
    case r'FOLLOW_UP_PENDING':
      return Enum$HQGuidanceStatus.FOLLOW_UP_PENDING;
    case r'AVAILABLE':
      return Enum$HQGuidanceStatus.AVAILABLE;
    case r'DEFERRED':
      return Enum$HQGuidanceStatus.DEFERRED;
    case r'PREMIUM_LOCKED':
      return Enum$HQGuidanceStatus.PREMIUM_LOCKED;
    case r'SEGMENT_DISABLED':
      return Enum$HQGuidanceStatus.SEGMENT_DISABLED;
    case r'DEPENDENCY_BLOCKED':
      return Enum$HQGuidanceStatus.DEPENDENCY_BLOCKED;
    case r'NOT_APPLICABLE':
      return Enum$HQGuidanceStatus.NOT_APPLICABLE;
    case r'BROWSER_CHECK_REQUIRED':
      return Enum$HQGuidanceStatus.BROWSER_CHECK_REQUIRED;
    case r'LEGACY_DISMISSED':
      return Enum$HQGuidanceStatus.LEGACY_DISMISSED;
    default:
      return Enum$HQGuidanceStatus.$unknown;
  }
}

enum Enum$HQBroadcastCategory {
  PROMOTIONAL,
  OPERATIONAL,
  $unknown;

  factory Enum$HQBroadcastCategory.fromJson(String value) =>
      fromJson$Enum$HQBroadcastCategory(value);

  String toJson() => toJson$Enum$HQBroadcastCategory(this);
}

String toJson$Enum$HQBroadcastCategory(Enum$HQBroadcastCategory e) {
  switch (e) {
    case Enum$HQBroadcastCategory.PROMOTIONAL:
      return r'PROMOTIONAL';
    case Enum$HQBroadcastCategory.OPERATIONAL:
      return r'OPERATIONAL';
    case Enum$HQBroadcastCategory.$unknown:
      return r'$unknown';
  }
}

Enum$HQBroadcastCategory fromJson$Enum$HQBroadcastCategory(String value) {
  switch (value) {
    case r'PROMOTIONAL':
      return Enum$HQBroadcastCategory.PROMOTIONAL;
    case r'OPERATIONAL':
      return Enum$HQBroadcastCategory.OPERATIONAL;
    default:
      return Enum$HQBroadcastCategory.$unknown;
  }
}

enum Enum$HQBroadcastStatus {
  DRAFT,
  PREPARING,
  READY,
  REVIEW_FAILED,
  SENDING,
  COMPLETED,
  STOPPED,
  $unknown;

  factory Enum$HQBroadcastStatus.fromJson(String value) =>
      fromJson$Enum$HQBroadcastStatus(value);

  String toJson() => toJson$Enum$HQBroadcastStatus(this);
}

String toJson$Enum$HQBroadcastStatus(Enum$HQBroadcastStatus e) {
  switch (e) {
    case Enum$HQBroadcastStatus.DRAFT:
      return r'DRAFT';
    case Enum$HQBroadcastStatus.PREPARING:
      return r'PREPARING';
    case Enum$HQBroadcastStatus.READY:
      return r'READY';
    case Enum$HQBroadcastStatus.REVIEW_FAILED:
      return r'REVIEW_FAILED';
    case Enum$HQBroadcastStatus.SENDING:
      return r'SENDING';
    case Enum$HQBroadcastStatus.COMPLETED:
      return r'COMPLETED';
    case Enum$HQBroadcastStatus.STOPPED:
      return r'STOPPED';
    case Enum$HQBroadcastStatus.$unknown:
      return r'$unknown';
  }
}

Enum$HQBroadcastStatus fromJson$Enum$HQBroadcastStatus(String value) {
  switch (value) {
    case r'DRAFT':
      return Enum$HQBroadcastStatus.DRAFT;
    case r'PREPARING':
      return Enum$HQBroadcastStatus.PREPARING;
    case r'READY':
      return Enum$HQBroadcastStatus.READY;
    case r'REVIEW_FAILED':
      return Enum$HQBroadcastStatus.REVIEW_FAILED;
    case r'SENDING':
      return Enum$HQBroadcastStatus.SENDING;
    case r'COMPLETED':
      return Enum$HQBroadcastStatus.COMPLETED;
    case r'STOPPED':
      return Enum$HQBroadcastStatus.STOPPED;
    default:
      return Enum$HQBroadcastStatus.$unknown;
  }
}

enum Enum$HQBroadcastRecipientStatus {
  PENDING,
  PROCESSING,
  ACCEPTED,
  FAILED,
  SKIPPED,
  STOPPED,
  $unknown;

  factory Enum$HQBroadcastRecipientStatus.fromJson(String value) =>
      fromJson$Enum$HQBroadcastRecipientStatus(value);

  String toJson() => toJson$Enum$HQBroadcastRecipientStatus(this);
}

String toJson$Enum$HQBroadcastRecipientStatus(
  Enum$HQBroadcastRecipientStatus e,
) {
  switch (e) {
    case Enum$HQBroadcastRecipientStatus.PENDING:
      return r'PENDING';
    case Enum$HQBroadcastRecipientStatus.PROCESSING:
      return r'PROCESSING';
    case Enum$HQBroadcastRecipientStatus.ACCEPTED:
      return r'ACCEPTED';
    case Enum$HQBroadcastRecipientStatus.FAILED:
      return r'FAILED';
    case Enum$HQBroadcastRecipientStatus.SKIPPED:
      return r'SKIPPED';
    case Enum$HQBroadcastRecipientStatus.STOPPED:
      return r'STOPPED';
    case Enum$HQBroadcastRecipientStatus.$unknown:
      return r'$unknown';
  }
}

Enum$HQBroadcastRecipientStatus fromJson$Enum$HQBroadcastRecipientStatus(
  String value,
) {
  switch (value) {
    case r'PENDING':
      return Enum$HQBroadcastRecipientStatus.PENDING;
    case r'PROCESSING':
      return Enum$HQBroadcastRecipientStatus.PROCESSING;
    case r'ACCEPTED':
      return Enum$HQBroadcastRecipientStatus.ACCEPTED;
    case r'FAILED':
      return Enum$HQBroadcastRecipientStatus.FAILED;
    case r'SKIPPED':
      return Enum$HQBroadcastRecipientStatus.SKIPPED;
    case r'STOPPED':
      return Enum$HQBroadcastRecipientStatus.STOPPED;
    default:
      return Enum$HQBroadcastRecipientStatus.$unknown;
  }
}

enum Enum$HQBroadcastFieldType {
  TEXT,
  NUMBER,
  DATE,
  BOOLEAN,
  $unknown;

  factory Enum$HQBroadcastFieldType.fromJson(String value) =>
      fromJson$Enum$HQBroadcastFieldType(value);

  String toJson() => toJson$Enum$HQBroadcastFieldType(this);
}

String toJson$Enum$HQBroadcastFieldType(Enum$HQBroadcastFieldType e) {
  switch (e) {
    case Enum$HQBroadcastFieldType.TEXT:
      return r'TEXT';
    case Enum$HQBroadcastFieldType.NUMBER:
      return r'NUMBER';
    case Enum$HQBroadcastFieldType.DATE:
      return r'DATE';
    case Enum$HQBroadcastFieldType.BOOLEAN:
      return r'BOOLEAN';
    case Enum$HQBroadcastFieldType.$unknown:
      return r'$unknown';
  }
}

Enum$HQBroadcastFieldType fromJson$Enum$HQBroadcastFieldType(String value) {
  switch (value) {
    case r'TEXT':
      return Enum$HQBroadcastFieldType.TEXT;
    case r'NUMBER':
      return Enum$HQBroadcastFieldType.NUMBER;
    case r'DATE':
      return Enum$HQBroadcastFieldType.DATE;
    case r'BOOLEAN':
      return Enum$HQBroadcastFieldType.BOOLEAN;
    default:
      return Enum$HQBroadcastFieldType.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Person': {'Guest', 'User'},
};
