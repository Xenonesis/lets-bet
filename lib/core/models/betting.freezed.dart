// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'betting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Market _$MarketFromJson(Map<String, dynamic> json) {
  return _Market.fromJson(json);
}

/// @nodoc
mixin _$Market {
  String get id => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get displayOrder => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isSuspended => throw _privateConstructorUsedError;
  double get maxStake => throw _privateConstructorUsedError;
  double get minStake => throw _privateConstructorUsedError;
  double get margin => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<Outcome> get outcomes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketCopyWith<Market> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketCopyWith<$Res> {
  factory $MarketCopyWith(Market value, $Res Function(Market) then) =
      _$MarketCopyWithImpl<$Res, Market>;
  @useResult
  $Res call(
      {String id,
      String matchId,
      String name,
      String type,
      String description,
      String category,
      int displayOrder,
      bool isActive,
      bool isSuspended,
      double maxStake,
      double minStake,
      double margin,
      String createdBy,
      DateTime createdAt,
      List<Outcome> outcomes});
}

/// @nodoc
class _$MarketCopyWithImpl<$Res, $Val extends Market>
    implements $MarketCopyWith<$Res> {
  _$MarketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? category = null,
    Object? displayOrder = null,
    Object? isActive = null,
    Object? isSuspended = null,
    Object? maxStake = null,
    Object? minStake = null,
    Object? margin = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? outcomes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      maxStake: null == maxStake
          ? _value.maxStake
          : maxStake // ignore: cast_nullable_to_non_nullable
              as double,
      minStake: null == minStake
          ? _value.minStake
          : minStake // ignore: cast_nullable_to_non_nullable
              as double,
      margin: null == margin
          ? _value.margin
          : margin // ignore: cast_nullable_to_non_nullable
              as double,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      outcomes: null == outcomes
          ? _value.outcomes
          : outcomes // ignore: cast_nullable_to_non_nullable
              as List<Outcome>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketImplCopyWith<$Res> implements $MarketCopyWith<$Res> {
  factory _$$MarketImplCopyWith(
          _$MarketImpl value, $Res Function(_$MarketImpl) then) =
      __$$MarketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String matchId,
      String name,
      String type,
      String description,
      String category,
      int displayOrder,
      bool isActive,
      bool isSuspended,
      double maxStake,
      double minStake,
      double margin,
      String createdBy,
      DateTime createdAt,
      List<Outcome> outcomes});
}

/// @nodoc
class __$$MarketImplCopyWithImpl<$Res>
    extends _$MarketCopyWithImpl<$Res, _$MarketImpl>
    implements _$$MarketImplCopyWith<$Res> {
  __$$MarketImplCopyWithImpl(
      _$MarketImpl _value, $Res Function(_$MarketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? category = null,
    Object? displayOrder = null,
    Object? isActive = null,
    Object? isSuspended = null,
    Object? maxStake = null,
    Object? minStake = null,
    Object? margin = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? outcomes = null,
  }) {
    return _then(_$MarketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      maxStake: null == maxStake
          ? _value.maxStake
          : maxStake // ignore: cast_nullable_to_non_nullable
              as double,
      minStake: null == minStake
          ? _value.minStake
          : minStake // ignore: cast_nullable_to_non_nullable
              as double,
      margin: null == margin
          ? _value.margin
          : margin // ignore: cast_nullable_to_non_nullable
              as double,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      outcomes: null == outcomes
          ? _value._outcomes
          : outcomes // ignore: cast_nullable_to_non_nullable
              as List<Outcome>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketImpl implements _Market {
  const _$MarketImpl(
      {required this.id,
      required this.matchId,
      required this.name,
      required this.type,
      required this.description,
      required this.category,
      required this.displayOrder,
      required this.isActive,
      required this.isSuspended,
      required this.maxStake,
      required this.minStake,
      required this.margin,
      required this.createdBy,
      required this.createdAt,
      final List<Outcome> outcomes = const []})
      : _outcomes = outcomes;

  factory _$MarketImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketImplFromJson(json);

  @override
  final String id;
  @override
  final String matchId;
  @override
  final String name;
  @override
  final String type;
  @override
  final String description;
  @override
  final String category;
  @override
  final int displayOrder;
  @override
  final bool isActive;
  @override
  final bool isSuspended;
  @override
  final double maxStake;
  @override
  final double minStake;
  @override
  final double margin;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  final List<Outcome> _outcomes;
  @override
  @JsonKey()
  List<Outcome> get outcomes {
    if (_outcomes is EqualUnmodifiableListView) return _outcomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outcomes);
  }

  @override
  String toString() {
    return 'Market(id: $id, matchId: $matchId, name: $name, type: $type, description: $description, category: $category, displayOrder: $displayOrder, isActive: $isActive, isSuspended: $isSuspended, maxStake: $maxStake, minStake: $minStake, margin: $margin, createdBy: $createdBy, createdAt: $createdAt, outcomes: $outcomes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.maxStake, maxStake) ||
                other.maxStake == maxStake) &&
            (identical(other.minStake, minStake) ||
                other.minStake == minStake) &&
            (identical(other.margin, margin) || other.margin == margin) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._outcomes, _outcomes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      matchId,
      name,
      type,
      description,
      category,
      displayOrder,
      isActive,
      isSuspended,
      maxStake,
      minStake,
      margin,
      createdBy,
      createdAt,
      const DeepCollectionEquality().hash(_outcomes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketImplCopyWith<_$MarketImpl> get copyWith =>
      __$$MarketImplCopyWithImpl<_$MarketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketImplToJson(
      this,
    );
  }
}

abstract class _Market implements Market {
  const factory _Market(
      {required final String id,
      required final String matchId,
      required final String name,
      required final String type,
      required final String description,
      required final String category,
      required final int displayOrder,
      required final bool isActive,
      required final bool isSuspended,
      required final double maxStake,
      required final double minStake,
      required final double margin,
      required final String createdBy,
      required final DateTime createdAt,
      final List<Outcome> outcomes}) = _$MarketImpl;

  factory _Market.fromJson(Map<String, dynamic> json) = _$MarketImpl.fromJson;

  @override
  String get id;
  @override
  String get matchId;
  @override
  String get name;
  @override
  String get type;
  @override
  String get description;
  @override
  String get category;
  @override
  int get displayOrder;
  @override
  bool get isActive;
  @override
  bool get isSuspended;
  @override
  double get maxStake;
  @override
  double get minStake;
  @override
  double get margin;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  List<Outcome> get outcomes;
  @override
  @JsonKey(ignore: true)
  _$$MarketImplCopyWith<_$MarketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Outcome _$OutcomeFromJson(Map<String, dynamic> json) {
  return _Outcome.fromJson(json);
}

/// @nodoc
mixin _$Outcome {
  String get id => throw _privateConstructorUsedError;
  String get marketId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get odds => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isSuspended => throw _privateConstructorUsedError;
  int get displayOrder => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutcomeCopyWith<Outcome> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutcomeCopyWith<$Res> {
  factory $OutcomeCopyWith(Outcome value, $Res Function(Outcome) then) =
      _$OutcomeCopyWithImpl<$Res, Outcome>;
  @useResult
  $Res call(
      {String id,
      String marketId,
      String name,
      double odds,
      bool isActive,
      bool isSuspended,
      int displayOrder,
      DateTime updatedAt});
}

/// @nodoc
class _$OutcomeCopyWithImpl<$Res, $Val extends Outcome>
    implements $OutcomeCopyWith<$Res> {
  _$OutcomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? marketId = null,
    Object? name = null,
    Object? odds = null,
    Object? isActive = null,
    Object? isSuspended = null,
    Object? displayOrder = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      odds: null == odds
          ? _value.odds
          : odds // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutcomeImplCopyWith<$Res> implements $OutcomeCopyWith<$Res> {
  factory _$$OutcomeImplCopyWith(
          _$OutcomeImpl value, $Res Function(_$OutcomeImpl) then) =
      __$$OutcomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String marketId,
      String name,
      double odds,
      bool isActive,
      bool isSuspended,
      int displayOrder,
      DateTime updatedAt});
}

/// @nodoc
class __$$OutcomeImplCopyWithImpl<$Res>
    extends _$OutcomeCopyWithImpl<$Res, _$OutcomeImpl>
    implements _$$OutcomeImplCopyWith<$Res> {
  __$$OutcomeImplCopyWithImpl(
      _$OutcomeImpl _value, $Res Function(_$OutcomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? marketId = null,
    Object? name = null,
    Object? odds = null,
    Object? isActive = null,
    Object? isSuspended = null,
    Object? displayOrder = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OutcomeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      odds: null == odds
          ? _value.odds
          : odds // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutcomeImpl implements _Outcome {
  const _$OutcomeImpl(
      {required this.id,
      required this.marketId,
      required this.name,
      required this.odds,
      required this.isActive,
      required this.isSuspended,
      required this.displayOrder,
      required this.updatedAt});

  factory _$OutcomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutcomeImplFromJson(json);

  @override
  final String id;
  @override
  final String marketId;
  @override
  final String name;
  @override
  final double odds;
  @override
  final bool isActive;
  @override
  final bool isSuspended;
  @override
  final int displayOrder;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Outcome(id: $id, marketId: $marketId, name: $name, odds: $odds, isActive: $isActive, isSuspended: $isSuspended, displayOrder: $displayOrder, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutcomeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.odds, odds) || other.odds == odds) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, marketId, name, odds,
      isActive, isSuspended, displayOrder, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutcomeImplCopyWith<_$OutcomeImpl> get copyWith =>
      __$$OutcomeImplCopyWithImpl<_$OutcomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutcomeImplToJson(
      this,
    );
  }
}

abstract class _Outcome implements Outcome {
  const factory _Outcome(
      {required final String id,
      required final String marketId,
      required final String name,
      required final double odds,
      required final bool isActive,
      required final bool isSuspended,
      required final int displayOrder,
      required final DateTime updatedAt}) = _$OutcomeImpl;

  factory _Outcome.fromJson(Map<String, dynamic> json) = _$OutcomeImpl.fromJson;

  @override
  String get id;
  @override
  String get marketId;
  @override
  String get name;
  @override
  double get odds;
  @override
  bool get isActive;
  @override
  bool get isSuspended;
  @override
  int get displayOrder;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OutcomeImplCopyWith<_$OutcomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Bet _$BetFromJson(Map<String, dynamic> json) {
  return _Bet.fromJson(json);
}

/// @nodoc
mixin _$Bet {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  BetType get type => throw _privateConstructorUsedError;
  BetStatus get status => throw _privateConstructorUsedError;
  double get totalStake => throw _privateConstructorUsedError;
  double get potentialWin => throw _privateConstructorUsedError;
  double? get actualWin => throw _privateConstructorUsedError;
  double? get cashOutValue => throw _privateConstructorUsedError;
  DateTime get placedAt => throw _privateConstructorUsedError;
  DateTime? get settledAt => throw _privateConstructorUsedError;
  List<BetSelection> get selections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BetCopyWith<Bet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetCopyWith<$Res> {
  factory $BetCopyWith(Bet value, $Res Function(Bet) then) =
      _$BetCopyWithImpl<$Res, Bet>;
  @useResult
  $Res call(
      {String id,
      String userId,
      BetType type,
      BetStatus status,
      double totalStake,
      double potentialWin,
      double? actualWin,
      double? cashOutValue,
      DateTime placedAt,
      DateTime? settledAt,
      List<BetSelection> selections});
}

/// @nodoc
class _$BetCopyWithImpl<$Res, $Val extends Bet> implements $BetCopyWith<$Res> {
  _$BetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? status = null,
    Object? totalStake = null,
    Object? potentialWin = null,
    Object? actualWin = freezed,
    Object? cashOutValue = freezed,
    Object? placedAt = null,
    Object? settledAt = freezed,
    Object? selections = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BetType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BetStatus,
      totalStake: null == totalStake
          ? _value.totalStake
          : totalStake // ignore: cast_nullable_to_non_nullable
              as double,
      potentialWin: null == potentialWin
          ? _value.potentialWin
          : potentialWin // ignore: cast_nullable_to_non_nullable
              as double,
      actualWin: freezed == actualWin
          ? _value.actualWin
          : actualWin // ignore: cast_nullable_to_non_nullable
              as double?,
      cashOutValue: freezed == cashOutValue
          ? _value.cashOutValue
          : cashOutValue // ignore: cast_nullable_to_non_nullable
              as double?,
      placedAt: null == placedAt
          ? _value.placedAt
          : placedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settledAt: freezed == settledAt
          ? _value.settledAt
          : settledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selections: null == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<BetSelection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BetImplCopyWith<$Res> implements $BetCopyWith<$Res> {
  factory _$$BetImplCopyWith(_$BetImpl value, $Res Function(_$BetImpl) then) =
      __$$BetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      BetType type,
      BetStatus status,
      double totalStake,
      double potentialWin,
      double? actualWin,
      double? cashOutValue,
      DateTime placedAt,
      DateTime? settledAt,
      List<BetSelection> selections});
}

/// @nodoc
class __$$BetImplCopyWithImpl<$Res> extends _$BetCopyWithImpl<$Res, _$BetImpl>
    implements _$$BetImplCopyWith<$Res> {
  __$$BetImplCopyWithImpl(_$BetImpl _value, $Res Function(_$BetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? status = null,
    Object? totalStake = null,
    Object? potentialWin = null,
    Object? actualWin = freezed,
    Object? cashOutValue = freezed,
    Object? placedAt = null,
    Object? settledAt = freezed,
    Object? selections = null,
  }) {
    return _then(_$BetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BetType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BetStatus,
      totalStake: null == totalStake
          ? _value.totalStake
          : totalStake // ignore: cast_nullable_to_non_nullable
              as double,
      potentialWin: null == potentialWin
          ? _value.potentialWin
          : potentialWin // ignore: cast_nullable_to_non_nullable
              as double,
      actualWin: freezed == actualWin
          ? _value.actualWin
          : actualWin // ignore: cast_nullable_to_non_nullable
              as double?,
      cashOutValue: freezed == cashOutValue
          ? _value.cashOutValue
          : cashOutValue // ignore: cast_nullable_to_non_nullable
              as double?,
      placedAt: null == placedAt
          ? _value.placedAt
          : placedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settledAt: freezed == settledAt
          ? _value.settledAt
          : settledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selections: null == selections
          ? _value._selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<BetSelection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BetImpl implements _Bet {
  const _$BetImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.status,
      required this.totalStake,
      required this.potentialWin,
      this.actualWin,
      this.cashOutValue,
      required this.placedAt,
      this.settledAt,
      final List<BetSelection> selections = const []})
      : _selections = selections;

  factory _$BetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BetImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final BetType type;
  @override
  final BetStatus status;
  @override
  final double totalStake;
  @override
  final double potentialWin;
  @override
  final double? actualWin;
  @override
  final double? cashOutValue;
  @override
  final DateTime placedAt;
  @override
  final DateTime? settledAt;
  final List<BetSelection> _selections;
  @override
  @JsonKey()
  List<BetSelection> get selections {
    if (_selections is EqualUnmodifiableListView) return _selections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selections);
  }

  @override
  String toString() {
    return 'Bet(id: $id, userId: $userId, type: $type, status: $status, totalStake: $totalStake, potentialWin: $potentialWin, actualWin: $actualWin, cashOutValue: $cashOutValue, placedAt: $placedAt, settledAt: $settledAt, selections: $selections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalStake, totalStake) ||
                other.totalStake == totalStake) &&
            (identical(other.potentialWin, potentialWin) ||
                other.potentialWin == potentialWin) &&
            (identical(other.actualWin, actualWin) ||
                other.actualWin == actualWin) &&
            (identical(other.cashOutValue, cashOutValue) ||
                other.cashOutValue == cashOutValue) &&
            (identical(other.placedAt, placedAt) ||
                other.placedAt == placedAt) &&
            (identical(other.settledAt, settledAt) ||
                other.settledAt == settledAt) &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      status,
      totalStake,
      potentialWin,
      actualWin,
      cashOutValue,
      placedAt,
      settledAt,
      const DeepCollectionEquality().hash(_selections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BetImplCopyWith<_$BetImpl> get copyWith =>
      __$$BetImplCopyWithImpl<_$BetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BetImplToJson(
      this,
    );
  }
}

abstract class _Bet implements Bet {
  const factory _Bet(
      {required final String id,
      required final String userId,
      required final BetType type,
      required final BetStatus status,
      required final double totalStake,
      required final double potentialWin,
      final double? actualWin,
      final double? cashOutValue,
      required final DateTime placedAt,
      final DateTime? settledAt,
      final List<BetSelection> selections}) = _$BetImpl;

  factory _Bet.fromJson(Map<String, dynamic> json) = _$BetImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  BetType get type;
  @override
  BetStatus get status;
  @override
  double get totalStake;
  @override
  double get potentialWin;
  @override
  double? get actualWin;
  @override
  double? get cashOutValue;
  @override
  DateTime get placedAt;
  @override
  DateTime? get settledAt;
  @override
  List<BetSelection> get selections;
  @override
  @JsonKey(ignore: true)
  _$$BetImplCopyWith<_$BetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BetSelection _$BetSelectionFromJson(Map<String, dynamic> json) {
  return _BetSelection.fromJson(json);
}

/// @nodoc
mixin _$BetSelection {
  String get id => throw _privateConstructorUsedError;
  String get betId => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  String get marketId => throw _privateConstructorUsedError;
  String get outcomeId => throw _privateConstructorUsedError;
  double get odds => throw _privateConstructorUsedError;
  SelectionStatus get status => throw _privateConstructorUsedError;
  String? get matchName => throw _privateConstructorUsedError;
  String? get marketName => throw _privateConstructorUsedError;
  String? get outcomeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BetSelectionCopyWith<BetSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetSelectionCopyWith<$Res> {
  factory $BetSelectionCopyWith(
          BetSelection value, $Res Function(BetSelection) then) =
      _$BetSelectionCopyWithImpl<$Res, BetSelection>;
  @useResult
  $Res call(
      {String id,
      String betId,
      String matchId,
      String marketId,
      String outcomeId,
      double odds,
      SelectionStatus status,
      String? matchName,
      String? marketName,
      String? outcomeName});
}

/// @nodoc
class _$BetSelectionCopyWithImpl<$Res, $Val extends BetSelection>
    implements $BetSelectionCopyWith<$Res> {
  _$BetSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? betId = null,
    Object? matchId = null,
    Object? marketId = null,
    Object? outcomeId = null,
    Object? odds = null,
    Object? status = null,
    Object? matchName = freezed,
    Object? marketName = freezed,
    Object? outcomeName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      betId: null == betId
          ? _value.betId
          : betId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as String,
      outcomeId: null == outcomeId
          ? _value.outcomeId
          : outcomeId // ignore: cast_nullable_to_non_nullable
              as String,
      odds: null == odds
          ? _value.odds
          : odds // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SelectionStatus,
      matchName: freezed == matchName
          ? _value.matchName
          : matchName // ignore: cast_nullable_to_non_nullable
              as String?,
      marketName: freezed == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String?,
      outcomeName: freezed == outcomeName
          ? _value.outcomeName
          : outcomeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BetSelectionImplCopyWith<$Res>
    implements $BetSelectionCopyWith<$Res> {
  factory _$$BetSelectionImplCopyWith(
          _$BetSelectionImpl value, $Res Function(_$BetSelectionImpl) then) =
      __$$BetSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String betId,
      String matchId,
      String marketId,
      String outcomeId,
      double odds,
      SelectionStatus status,
      String? matchName,
      String? marketName,
      String? outcomeName});
}

/// @nodoc
class __$$BetSelectionImplCopyWithImpl<$Res>
    extends _$BetSelectionCopyWithImpl<$Res, _$BetSelectionImpl>
    implements _$$BetSelectionImplCopyWith<$Res> {
  __$$BetSelectionImplCopyWithImpl(
      _$BetSelectionImpl _value, $Res Function(_$BetSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? betId = null,
    Object? matchId = null,
    Object? marketId = null,
    Object? outcomeId = null,
    Object? odds = null,
    Object? status = null,
    Object? matchName = freezed,
    Object? marketName = freezed,
    Object? outcomeName = freezed,
  }) {
    return _then(_$BetSelectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      betId: null == betId
          ? _value.betId
          : betId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as String,
      outcomeId: null == outcomeId
          ? _value.outcomeId
          : outcomeId // ignore: cast_nullable_to_non_nullable
              as String,
      odds: null == odds
          ? _value.odds
          : odds // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SelectionStatus,
      matchName: freezed == matchName
          ? _value.matchName
          : matchName // ignore: cast_nullable_to_non_nullable
              as String?,
      marketName: freezed == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String?,
      outcomeName: freezed == outcomeName
          ? _value.outcomeName
          : outcomeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BetSelectionImpl implements _BetSelection {
  const _$BetSelectionImpl(
      {required this.id,
      required this.betId,
      required this.matchId,
      required this.marketId,
      required this.outcomeId,
      required this.odds,
      required this.status,
      this.matchName,
      this.marketName,
      this.outcomeName});

  factory _$BetSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BetSelectionImplFromJson(json);

  @override
  final String id;
  @override
  final String betId;
  @override
  final String matchId;
  @override
  final String marketId;
  @override
  final String outcomeId;
  @override
  final double odds;
  @override
  final SelectionStatus status;
  @override
  final String? matchName;
  @override
  final String? marketName;
  @override
  final String? outcomeName;

  @override
  String toString() {
    return 'BetSelection(id: $id, betId: $betId, matchId: $matchId, marketId: $marketId, outcomeId: $outcomeId, odds: $odds, status: $status, matchName: $matchName, marketName: $marketName, outcomeName: $outcomeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BetSelectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.betId, betId) || other.betId == betId) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId) &&
            (identical(other.outcomeId, outcomeId) ||
                other.outcomeId == outcomeId) &&
            (identical(other.odds, odds) || other.odds == odds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.matchName, matchName) ||
                other.matchName == matchName) &&
            (identical(other.marketName, marketName) ||
                other.marketName == marketName) &&
            (identical(other.outcomeName, outcomeName) ||
                other.outcomeName == outcomeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, betId, matchId, marketId,
      outcomeId, odds, status, matchName, marketName, outcomeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BetSelectionImplCopyWith<_$BetSelectionImpl> get copyWith =>
      __$$BetSelectionImplCopyWithImpl<_$BetSelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BetSelectionImplToJson(
      this,
    );
  }
}

abstract class _BetSelection implements BetSelection {
  const factory _BetSelection(
      {required final String id,
      required final String betId,
      required final String matchId,
      required final String marketId,
      required final String outcomeId,
      required final double odds,
      required final SelectionStatus status,
      final String? matchName,
      final String? marketName,
      final String? outcomeName}) = _$BetSelectionImpl;

  factory _BetSelection.fromJson(Map<String, dynamic> json) =
      _$BetSelectionImpl.fromJson;

  @override
  String get id;
  @override
  String get betId;
  @override
  String get matchId;
  @override
  String get marketId;
  @override
  String get outcomeId;
  @override
  double get odds;
  @override
  SelectionStatus get status;
  @override
  String? get matchName;
  @override
  String? get marketName;
  @override
  String? get outcomeName;
  @override
  @JsonKey(ignore: true)
  _$$BetSelectionImplCopyWith<_$BetSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BetSlipItem _$BetSlipItemFromJson(Map<String, dynamic> json) {
  return _BetSlipItem.fromJson(json);
}

/// @nodoc
mixin _$BetSlipItem {
  String get matchId => throw _privateConstructorUsedError;
  String get marketId => throw _privateConstructorUsedError;
  String get outcomeId => throw _privateConstructorUsedError;
  String get matchName => throw _privateConstructorUsedError;
  String get marketName => throw _privateConstructorUsedError;
  String get outcomeName => throw _privateConstructorUsedError;
  double get odds => throw _privateConstructorUsedError;
  double? get stake => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BetSlipItemCopyWith<BetSlipItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetSlipItemCopyWith<$Res> {
  factory $BetSlipItemCopyWith(
          BetSlipItem value, $Res Function(BetSlipItem) then) =
      _$BetSlipItemCopyWithImpl<$Res, BetSlipItem>;
  @useResult
  $Res call(
      {String matchId,
      String marketId,
      String outcomeId,
      String matchName,
      String marketName,
      String outcomeName,
      double odds,
      double? stake});
}

/// @nodoc
class _$BetSlipItemCopyWithImpl<$Res, $Val extends BetSlipItem>
    implements $BetSlipItemCopyWith<$Res> {
  _$BetSlipItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchId = null,
    Object? marketId = null,
    Object? outcomeId = null,
    Object? matchName = null,
    Object? marketName = null,
    Object? outcomeName = null,
    Object? odds = null,
    Object? stake = freezed,
  }) {
    return _then(_value.copyWith(
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as String,
      outcomeId: null == outcomeId
          ? _value.outcomeId
          : outcomeId // ignore: cast_nullable_to_non_nullable
              as String,
      matchName: null == matchName
          ? _value.matchName
          : matchName // ignore: cast_nullable_to_non_nullable
              as String,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      outcomeName: null == outcomeName
          ? _value.outcomeName
          : outcomeName // ignore: cast_nullable_to_non_nullable
              as String,
      odds: null == odds
          ? _value.odds
          : odds // ignore: cast_nullable_to_non_nullable
              as double,
      stake: freezed == stake
          ? _value.stake
          : stake // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BetSlipItemImplCopyWith<$Res>
    implements $BetSlipItemCopyWith<$Res> {
  factory _$$BetSlipItemImplCopyWith(
          _$BetSlipItemImpl value, $Res Function(_$BetSlipItemImpl) then) =
      __$$BetSlipItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String matchId,
      String marketId,
      String outcomeId,
      String matchName,
      String marketName,
      String outcomeName,
      double odds,
      double? stake});
}

/// @nodoc
class __$$BetSlipItemImplCopyWithImpl<$Res>
    extends _$BetSlipItemCopyWithImpl<$Res, _$BetSlipItemImpl>
    implements _$$BetSlipItemImplCopyWith<$Res> {
  __$$BetSlipItemImplCopyWithImpl(
      _$BetSlipItemImpl _value, $Res Function(_$BetSlipItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matchId = null,
    Object? marketId = null,
    Object? outcomeId = null,
    Object? matchName = null,
    Object? marketName = null,
    Object? outcomeName = null,
    Object? odds = null,
    Object? stake = freezed,
  }) {
    return _then(_$BetSlipItemImpl(
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      marketId: null == marketId
          ? _value.marketId
          : marketId // ignore: cast_nullable_to_non_nullable
              as String,
      outcomeId: null == outcomeId
          ? _value.outcomeId
          : outcomeId // ignore: cast_nullable_to_non_nullable
              as String,
      matchName: null == matchName
          ? _value.matchName
          : matchName // ignore: cast_nullable_to_non_nullable
              as String,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      outcomeName: null == outcomeName
          ? _value.outcomeName
          : outcomeName // ignore: cast_nullable_to_non_nullable
              as String,
      odds: null == odds
          ? _value.odds
          : odds // ignore: cast_nullable_to_non_nullable
              as double,
      stake: freezed == stake
          ? _value.stake
          : stake // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BetSlipItemImpl implements _BetSlipItem {
  const _$BetSlipItemImpl(
      {required this.matchId,
      required this.marketId,
      required this.outcomeId,
      required this.matchName,
      required this.marketName,
      required this.outcomeName,
      required this.odds,
      this.stake});

  factory _$BetSlipItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BetSlipItemImplFromJson(json);

  @override
  final String matchId;
  @override
  final String marketId;
  @override
  final String outcomeId;
  @override
  final String matchName;
  @override
  final String marketName;
  @override
  final String outcomeName;
  @override
  final double odds;
  @override
  final double? stake;

  @override
  String toString() {
    return 'BetSlipItem(matchId: $matchId, marketId: $marketId, outcomeId: $outcomeId, matchName: $matchName, marketName: $marketName, outcomeName: $outcomeName, odds: $odds, stake: $stake)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BetSlipItemImpl &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.marketId, marketId) ||
                other.marketId == marketId) &&
            (identical(other.outcomeId, outcomeId) ||
                other.outcomeId == outcomeId) &&
            (identical(other.matchName, matchName) ||
                other.matchName == matchName) &&
            (identical(other.marketName, marketName) ||
                other.marketName == marketName) &&
            (identical(other.outcomeName, outcomeName) ||
                other.outcomeName == outcomeName) &&
            (identical(other.odds, odds) || other.odds == odds) &&
            (identical(other.stake, stake) || other.stake == stake));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, matchId, marketId, outcomeId,
      matchName, marketName, outcomeName, odds, stake);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BetSlipItemImplCopyWith<_$BetSlipItemImpl> get copyWith =>
      __$$BetSlipItemImplCopyWithImpl<_$BetSlipItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BetSlipItemImplToJson(
      this,
    );
  }
}

abstract class _BetSlipItem implements BetSlipItem {
  const factory _BetSlipItem(
      {required final String matchId,
      required final String marketId,
      required final String outcomeId,
      required final String matchName,
      required final String marketName,
      required final String outcomeName,
      required final double odds,
      final double? stake}) = _$BetSlipItemImpl;

  factory _BetSlipItem.fromJson(Map<String, dynamic> json) =
      _$BetSlipItemImpl.fromJson;

  @override
  String get matchId;
  @override
  String get marketId;
  @override
  String get outcomeId;
  @override
  String get matchName;
  @override
  String get marketName;
  @override
  String get outcomeName;
  @override
  double get odds;
  @override
  double? get stake;
  @override
  @JsonKey(ignore: true)
  _$$BetSlipItemImplCopyWith<_$BetSlipItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BetSlip _$BetSlipFromJson(Map<String, dynamic> json) {
  return _BetSlip.fromJson(json);
}

/// @nodoc
mixin _$BetSlip {
  List<BetSlipItem> get selections => throw _privateConstructorUsedError;
  BetType get betType => throw _privateConstructorUsedError;
  double? get totalStake => throw _privateConstructorUsedError;
  double? get potentialWin => throw _privateConstructorUsedError;
  bool get acceptOddsChanges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BetSlipCopyWith<BetSlip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetSlipCopyWith<$Res> {
  factory $BetSlipCopyWith(BetSlip value, $Res Function(BetSlip) then) =
      _$BetSlipCopyWithImpl<$Res, BetSlip>;
  @useResult
  $Res call(
      {List<BetSlipItem> selections,
      BetType betType,
      double? totalStake,
      double? potentialWin,
      bool acceptOddsChanges});
}

/// @nodoc
class _$BetSlipCopyWithImpl<$Res, $Val extends BetSlip>
    implements $BetSlipCopyWith<$Res> {
  _$BetSlipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selections = null,
    Object? betType = null,
    Object? totalStake = freezed,
    Object? potentialWin = freezed,
    Object? acceptOddsChanges = null,
  }) {
    return _then(_value.copyWith(
      selections: null == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<BetSlipItem>,
      betType: null == betType
          ? _value.betType
          : betType // ignore: cast_nullable_to_non_nullable
              as BetType,
      totalStake: freezed == totalStake
          ? _value.totalStake
          : totalStake // ignore: cast_nullable_to_non_nullable
              as double?,
      potentialWin: freezed == potentialWin
          ? _value.potentialWin
          : potentialWin // ignore: cast_nullable_to_non_nullable
              as double?,
      acceptOddsChanges: null == acceptOddsChanges
          ? _value.acceptOddsChanges
          : acceptOddsChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BetSlipImplCopyWith<$Res> implements $BetSlipCopyWith<$Res> {
  factory _$$BetSlipImplCopyWith(
          _$BetSlipImpl value, $Res Function(_$BetSlipImpl) then) =
      __$$BetSlipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BetSlipItem> selections,
      BetType betType,
      double? totalStake,
      double? potentialWin,
      bool acceptOddsChanges});
}

/// @nodoc
class __$$BetSlipImplCopyWithImpl<$Res>
    extends _$BetSlipCopyWithImpl<$Res, _$BetSlipImpl>
    implements _$$BetSlipImplCopyWith<$Res> {
  __$$BetSlipImplCopyWithImpl(
      _$BetSlipImpl _value, $Res Function(_$BetSlipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selections = null,
    Object? betType = null,
    Object? totalStake = freezed,
    Object? potentialWin = freezed,
    Object? acceptOddsChanges = null,
  }) {
    return _then(_$BetSlipImpl(
      selections: null == selections
          ? _value._selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<BetSlipItem>,
      betType: null == betType
          ? _value.betType
          : betType // ignore: cast_nullable_to_non_nullable
              as BetType,
      totalStake: freezed == totalStake
          ? _value.totalStake
          : totalStake // ignore: cast_nullable_to_non_nullable
              as double?,
      potentialWin: freezed == potentialWin
          ? _value.potentialWin
          : potentialWin // ignore: cast_nullable_to_non_nullable
              as double?,
      acceptOddsChanges: null == acceptOddsChanges
          ? _value.acceptOddsChanges
          : acceptOddsChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BetSlipImpl extends _BetSlip {
  const _$BetSlipImpl(
      {final List<BetSlipItem> selections = const [],
      this.betType = BetType.single,
      this.totalStake,
      this.potentialWin,
      this.acceptOddsChanges = false})
      : _selections = selections,
        super._();

  factory _$BetSlipImpl.fromJson(Map<String, dynamic> json) =>
      _$$BetSlipImplFromJson(json);

  final List<BetSlipItem> _selections;
  @override
  @JsonKey()
  List<BetSlipItem> get selections {
    if (_selections is EqualUnmodifiableListView) return _selections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selections);
  }

  @override
  @JsonKey()
  final BetType betType;
  @override
  final double? totalStake;
  @override
  final double? potentialWin;
  @override
  @JsonKey()
  final bool acceptOddsChanges;

  @override
  String toString() {
    return 'BetSlip(selections: $selections, betType: $betType, totalStake: $totalStake, potentialWin: $potentialWin, acceptOddsChanges: $acceptOddsChanges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BetSlipImpl &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections) &&
            (identical(other.betType, betType) || other.betType == betType) &&
            (identical(other.totalStake, totalStake) ||
                other.totalStake == totalStake) &&
            (identical(other.potentialWin, potentialWin) ||
                other.potentialWin == potentialWin) &&
            (identical(other.acceptOddsChanges, acceptOddsChanges) ||
                other.acceptOddsChanges == acceptOddsChanges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selections),
      betType,
      totalStake,
      potentialWin,
      acceptOddsChanges);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BetSlipImplCopyWith<_$BetSlipImpl> get copyWith =>
      __$$BetSlipImplCopyWithImpl<_$BetSlipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BetSlipImplToJson(
      this,
    );
  }
}

abstract class _BetSlip extends BetSlip {
  const factory _BetSlip(
      {final List<BetSlipItem> selections,
      final BetType betType,
      final double? totalStake,
      final double? potentialWin,
      final bool acceptOddsChanges}) = _$BetSlipImpl;
  const _BetSlip._() : super._();

  factory _BetSlip.fromJson(Map<String, dynamic> json) = _$BetSlipImpl.fromJson;

  @override
  List<BetSlipItem> get selections;
  @override
  BetType get betType;
  @override
  double? get totalStake;
  @override
  double? get potentialWin;
  @override
  bool get acceptOddsChanges;
  @override
  @JsonKey(ignore: true)
  _$$BetSlipImplCopyWith<_$BetSlipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
