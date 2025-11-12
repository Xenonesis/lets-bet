// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  double get bonusBalance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {String id,
      String userId,
      double balance,
      double bonusBalance,
      String currency,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? balance = null,
    Object? bonusBalance = null,
    Object? currency = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      bonusBalance: null == bonusBalance
          ? _value.bonusBalance
          : bonusBalance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      double balance,
      double bonusBalance,
      String currency,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? balance = null,
    Object? bonusBalance = null,
    Object? currency = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_$WalletImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      bonusBalance: null == bonusBalance
          ? _value.bonusBalance
          : bonusBalance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletImpl extends _Wallet {
  const _$WalletImpl(
      {required this.id,
      required this.userId,
      required this.balance,
      required this.bonusBalance,
      required this.currency,
      required this.isActive,
      required this.createdAt})
      : super._();

  factory _$WalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double balance;
  @override
  final double bonusBalance;
  @override
  final String currency;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Wallet(id: $id, userId: $userId, balance: $balance, bonusBalance: $bonusBalance, currency: $currency, isActive: $isActive, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.bonusBalance, bonusBalance) ||
                other.bonusBalance == bonusBalance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, balance,
      bonusBalance, currency, isActive, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletImplToJson(
      this,
    );
  }
}

abstract class _Wallet extends Wallet {
  const factory _Wallet(
      {required final String id,
      required final String userId,
      required final double balance,
      required final double bonusBalance,
      required final String currency,
      required final bool isActive,
      required final DateTime createdAt}) = _$WalletImpl;
  const _Wallet._() : super._();

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$WalletImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  double get balance;
  @override
  double get bonusBalance;
  @override
  String get currency;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get walletId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get balanceBefore => throw _privateConstructorUsedError;
  double get balanceAfter => throw _privateConstructorUsedError;
  TransactionStatus get status => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String walletId,
      TransactionType type,
      double amount,
      double balanceBefore,
      double balanceAfter,
      TransactionStatus status,
      String? reference,
      String description,
      DateTime createdAt});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? walletId = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? status = null,
    Object? reference = freezed,
    Object? description = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String walletId,
      TransactionType type,
      double amount,
      double balanceBefore,
      double balanceAfter,
      TransactionStatus status,
      String? reference,
      String description,
      DateTime createdAt});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? walletId = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? status = null,
    Object? reference = freezed,
    Object? description = null,
    Object? createdAt = null,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.userId,
      required this.walletId,
      required this.type,
      required this.amount,
      required this.balanceBefore,
      required this.balanceAfter,
      required this.status,
      this.reference,
      required this.description,
      required this.createdAt});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String walletId;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final double balanceBefore;
  @override
  final double balanceAfter;
  @override
  final TransactionStatus status;
  @override
  final String? reference;
  @override
  final String description;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Transaction(id: $id, userId: $userId, walletId: $walletId, type: $type, amount: $amount, balanceBefore: $balanceBefore, balanceAfter: $balanceAfter, status: $status, reference: $reference, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      walletId,
      type,
      amount,
      balanceBefore,
      balanceAfter,
      status,
      reference,
      description,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String userId,
      required final String walletId,
      required final TransactionType type,
      required final double amount,
      required final double balanceBefore,
      required final double balanceAfter,
      required final TransactionStatus status,
      final String? reference,
      required final String description,
      required final DateTime createdAt}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get walletId;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  double get balanceBefore;
  @override
  double get balanceAfter;
  @override
  TransactionStatus get status;
  @override
  String? get reference;
  @override
  String get description;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return _Promotion.fromJson(json);
}

/// @nodoc
mixin _$Promotion {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PromotionType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  ValueType get valueType => throw _privateConstructorUsedError;
  double? get minDeposit => throw _privateConstructorUsedError;
  double? get maxBonus => throw _privateConstructorUsedError;
  double get wageringRequirement => throw _privateConstructorUsedError;
  int get validDays => throw _privateConstructorUsedError;
  List<String> get applicableSports => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionCopyWith<Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionCopyWith<$Res> {
  factory $PromotionCopyWith(Promotion value, $Res Function(Promotion) then) =
      _$PromotionCopyWithImpl<$Res, Promotion>;
  @useResult
  $Res call(
      {String id,
      String name,
      PromotionType type,
      String description,
      double value,
      ValueType valueType,
      double? minDeposit,
      double? maxBonus,
      double wageringRequirement,
      int validDays,
      List<String> applicableSports,
      bool isActive,
      DateTime startDate,
      DateTime endDate,
      String createdBy,
      DateTime createdAt});
}

/// @nodoc
class _$PromotionCopyWithImpl<$Res, $Val extends Promotion>
    implements $PromotionCopyWith<$Res> {
  _$PromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? value = null,
    Object? valueType = null,
    Object? minDeposit = freezed,
    Object? maxBonus = freezed,
    Object? wageringRequirement = null,
    Object? validDays = null,
    Object? applicableSports = null,
    Object? isActive = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PromotionType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as ValueType,
      minDeposit: freezed == minDeposit
          ? _value.minDeposit
          : minDeposit // ignore: cast_nullable_to_non_nullable
              as double?,
      maxBonus: freezed == maxBonus
          ? _value.maxBonus
          : maxBonus // ignore: cast_nullable_to_non_nullable
              as double?,
      wageringRequirement: null == wageringRequirement
          ? _value.wageringRequirement
          : wageringRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      validDays: null == validDays
          ? _value.validDays
          : validDays // ignore: cast_nullable_to_non_nullable
              as int,
      applicableSports: null == applicableSports
          ? _value.applicableSports
          : applicableSports // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotionImplCopyWith<$Res>
    implements $PromotionCopyWith<$Res> {
  factory _$$PromotionImplCopyWith(
          _$PromotionImpl value, $Res Function(_$PromotionImpl) then) =
      __$$PromotionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      PromotionType type,
      String description,
      double value,
      ValueType valueType,
      double? minDeposit,
      double? maxBonus,
      double wageringRequirement,
      int validDays,
      List<String> applicableSports,
      bool isActive,
      DateTime startDate,
      DateTime endDate,
      String createdBy,
      DateTime createdAt});
}

/// @nodoc
class __$$PromotionImplCopyWithImpl<$Res>
    extends _$PromotionCopyWithImpl<$Res, _$PromotionImpl>
    implements _$$PromotionImplCopyWith<$Res> {
  __$$PromotionImplCopyWithImpl(
      _$PromotionImpl _value, $Res Function(_$PromotionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? value = null,
    Object? valueType = null,
    Object? minDeposit = freezed,
    Object? maxBonus = freezed,
    Object? wageringRequirement = null,
    Object? validDays = null,
    Object? applicableSports = null,
    Object? isActive = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_$PromotionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PromotionType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as ValueType,
      minDeposit: freezed == minDeposit
          ? _value.minDeposit
          : minDeposit // ignore: cast_nullable_to_non_nullable
              as double?,
      maxBonus: freezed == maxBonus
          ? _value.maxBonus
          : maxBonus // ignore: cast_nullable_to_non_nullable
              as double?,
      wageringRequirement: null == wageringRequirement
          ? _value.wageringRequirement
          : wageringRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      validDays: null == validDays
          ? _value.validDays
          : validDays // ignore: cast_nullable_to_non_nullable
              as int,
      applicableSports: null == applicableSports
          ? _value._applicableSports
          : applicableSports // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionImpl implements _Promotion {
  const _$PromotionImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.description,
      required this.value,
      required this.valueType,
      this.minDeposit,
      this.maxBonus,
      required this.wageringRequirement,
      required this.validDays,
      required final List<String> applicableSports,
      required this.isActive,
      required this.startDate,
      required this.endDate,
      required this.createdBy,
      required this.createdAt})
      : _applicableSports = applicableSports;

  factory _$PromotionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final PromotionType type;
  @override
  final String description;
  @override
  final double value;
  @override
  final ValueType valueType;
  @override
  final double? minDeposit;
  @override
  final double? maxBonus;
  @override
  final double wageringRequirement;
  @override
  final int validDays;
  final List<String> _applicableSports;
  @override
  List<String> get applicableSports {
    if (_applicableSports is EqualUnmodifiableListView)
      return _applicableSports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableSports);
  }

  @override
  final bool isActive;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Promotion(id: $id, name: $name, type: $type, description: $description, value: $value, valueType: $valueType, minDeposit: $minDeposit, maxBonus: $maxBonus, wageringRequirement: $wageringRequirement, validDays: $validDays, applicableSports: $applicableSports, isActive: $isActive, startDate: $startDate, endDate: $endDate, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            (identical(other.minDeposit, minDeposit) ||
                other.minDeposit == minDeposit) &&
            (identical(other.maxBonus, maxBonus) ||
                other.maxBonus == maxBonus) &&
            (identical(other.wageringRequirement, wageringRequirement) ||
                other.wageringRequirement == wageringRequirement) &&
            (identical(other.validDays, validDays) ||
                other.validDays == validDays) &&
            const DeepCollectionEquality()
                .equals(other._applicableSports, _applicableSports) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      description,
      value,
      valueType,
      minDeposit,
      maxBonus,
      wageringRequirement,
      validDays,
      const DeepCollectionEquality().hash(_applicableSports),
      isActive,
      startDate,
      endDate,
      createdBy,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionImplCopyWith<_$PromotionImpl> get copyWith =>
      __$$PromotionImplCopyWithImpl<_$PromotionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionImplToJson(
      this,
    );
  }
}

abstract class _Promotion implements Promotion {
  const factory _Promotion(
      {required final String id,
      required final String name,
      required final PromotionType type,
      required final String description,
      required final double value,
      required final ValueType valueType,
      final double? minDeposit,
      final double? maxBonus,
      required final double wageringRequirement,
      required final int validDays,
      required final List<String> applicableSports,
      required final bool isActive,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String createdBy,
      required final DateTime createdAt}) = _$PromotionImpl;

  factory _Promotion.fromJson(Map<String, dynamic> json) =
      _$PromotionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  PromotionType get type;
  @override
  String get description;
  @override
  double get value;
  @override
  ValueType get valueType;
  @override
  double? get minDeposit;
  @override
  double? get maxBonus;
  @override
  double get wageringRequirement;
  @override
  int get validDays;
  @override
  List<String> get applicableSports;
  @override
  bool get isActive;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PromotionImplCopyWith<_$PromotionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBonus _$UserBonusFromJson(Map<String, dynamic> json) {
  return _UserBonus.fromJson(json);
}

/// @nodoc
mixin _$UserBonus {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get promotionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get wageringRemaining => throw _privateConstructorUsedError;
  BonusStatus get status => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBonusCopyWith<UserBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBonusCopyWith<$Res> {
  factory $UserBonusCopyWith(UserBonus value, $Res Function(UserBonus) then) =
      _$UserBonusCopyWithImpl<$Res, UserBonus>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String promotionId,
      double amount,
      double wageringRemaining,
      BonusStatus status,
      DateTime expiresAt,
      DateTime createdAt});
}

/// @nodoc
class _$UserBonusCopyWithImpl<$Res, $Val extends UserBonus>
    implements $UserBonusCopyWith<$Res> {
  _$UserBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? promotionId = null,
    Object? amount = null,
    Object? wageringRemaining = null,
    Object? status = null,
    Object? expiresAt = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      wageringRemaining: null == wageringRemaining
          ? _value.wageringRemaining
          : wageringRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BonusStatus,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBonusImplCopyWith<$Res>
    implements $UserBonusCopyWith<$Res> {
  factory _$$UserBonusImplCopyWith(
          _$UserBonusImpl value, $Res Function(_$UserBonusImpl) then) =
      __$$UserBonusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String promotionId,
      double amount,
      double wageringRemaining,
      BonusStatus status,
      DateTime expiresAt,
      DateTime createdAt});
}

/// @nodoc
class __$$UserBonusImplCopyWithImpl<$Res>
    extends _$UserBonusCopyWithImpl<$Res, _$UserBonusImpl>
    implements _$$UserBonusImplCopyWith<$Res> {
  __$$UserBonusImplCopyWithImpl(
      _$UserBonusImpl _value, $Res Function(_$UserBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? promotionId = null,
    Object? amount = null,
    Object? wageringRemaining = null,
    Object? status = null,
    Object? expiresAt = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserBonusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      promotionId: null == promotionId
          ? _value.promotionId
          : promotionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      wageringRemaining: null == wageringRemaining
          ? _value.wageringRemaining
          : wageringRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BonusStatus,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBonusImpl implements _UserBonus {
  const _$UserBonusImpl(
      {required this.id,
      required this.userId,
      required this.promotionId,
      required this.amount,
      required this.wageringRemaining,
      required this.status,
      required this.expiresAt,
      required this.createdAt});

  factory _$UserBonusImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBonusImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String promotionId;
  @override
  final double amount;
  @override
  final double wageringRemaining;
  @override
  final BonusStatus status;
  @override
  final DateTime expiresAt;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserBonus(id: $id, userId: $userId, promotionId: $promotionId, amount: $amount, wageringRemaining: $wageringRemaining, status: $status, expiresAt: $expiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBonusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.promotionId, promotionId) ||
                other.promotionId == promotionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.wageringRemaining, wageringRemaining) ||
                other.wageringRemaining == wageringRemaining) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, promotionId, amount,
      wageringRemaining, status, expiresAt, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBonusImplCopyWith<_$UserBonusImpl> get copyWith =>
      __$$UserBonusImplCopyWithImpl<_$UserBonusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBonusImplToJson(
      this,
    );
  }
}

abstract class _UserBonus implements UserBonus {
  const factory _UserBonus(
      {required final String id,
      required final String userId,
      required final String promotionId,
      required final double amount,
      required final double wageringRemaining,
      required final BonusStatus status,
      required final DateTime expiresAt,
      required final DateTime createdAt}) = _$UserBonusImpl;

  factory _UserBonus.fromJson(Map<String, dynamic> json) =
      _$UserBonusImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get promotionId;
  @override
  double get amount;
  @override
  double get wageringRemaining;
  @override
  BonusStatus get status;
  @override
  DateTime get expiresAt;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserBonusImplCopyWith<_$UserBonusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
