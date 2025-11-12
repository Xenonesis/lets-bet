// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get id => throw _privateConstructorUsedError;
  String get sportId => throw _privateConstructorUsedError;
  String get leagueId => throw _privateConstructorUsedError;
  String get homeTeam => throw _privateConstructorUsedError;
  String get awayTeam => throw _privateConstructorUsedError;
  String? get homeTeamLogo => throw _privateConstructorUsedError;
  String? get awayTeamLogo => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  MatchStatus get status => throw _privateConstructorUsedError;
  MatchScore? get score => throw _privateConstructorUsedError;
  LiveStats? get liveStats => throw _privateConstructorUsedError;
  bool get isPreMatchEnabled => throw _privateConstructorUsedError;
  bool get isLiveEnabled => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
  @useResult
  $Res call(
      {String id,
      String sportId,
      String leagueId,
      String homeTeam,
      String awayTeam,
      String? homeTeamLogo,
      String? awayTeamLogo,
      DateTime startTime,
      MatchStatus status,
      MatchScore? score,
      LiveStats? liveStats,
      bool isPreMatchEnabled,
      bool isLiveEnabled,
      bool isFeatured,
      String createdBy,
      DateTime createdAt});

  $MatchScoreCopyWith<$Res>? get score;
  $LiveStatsCopyWith<$Res>? get liveStats;
}

/// @nodoc
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sportId = null,
    Object? leagueId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? homeTeamLogo = freezed,
    Object? awayTeamLogo = freezed,
    Object? startTime = null,
    Object? status = null,
    Object? score = freezed,
    Object? liveStats = freezed,
    Object? isPreMatchEnabled = null,
    Object? isLiveEnabled = null,
    Object? isFeatured = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sportId: null == sportId
          ? _value.sportId
          : sportId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: null == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeamLogo: freezed == homeTeamLogo
          ? _value.homeTeamLogo
          : homeTeamLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamLogo: freezed == awayTeamLogo
          ? _value.awayTeamLogo
          : awayTeamLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as MatchScore?,
      liveStats: freezed == liveStats
          ? _value.liveStats
          : liveStats // ignore: cast_nullable_to_non_nullable
              as LiveStats?,
      isPreMatchEnabled: null == isPreMatchEnabled
          ? _value.isPreMatchEnabled
          : isPreMatchEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiveEnabled: null == isLiveEnabled
          ? _value.isLiveEnabled
          : isLiveEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  @pragma('vm:prefer-inline')
  $MatchScoreCopyWith<$Res>? get score {
    if (_value.score == null) {
      return null;
    }

    return $MatchScoreCopyWith<$Res>(_value.score!, (value) {
      return _then(_value.copyWith(score: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LiveStatsCopyWith<$Res>? get liveStats {
    if (_value.liveStats == null) {
      return null;
    }

    return $LiveStatsCopyWith<$Res>(_value.liveStats!, (value) {
      return _then(_value.copyWith(liveStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchImplCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$MatchImplCopyWith(
          _$MatchImpl value, $Res Function(_$MatchImpl) then) =
      __$$MatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sportId,
      String leagueId,
      String homeTeam,
      String awayTeam,
      String? homeTeamLogo,
      String? awayTeamLogo,
      DateTime startTime,
      MatchStatus status,
      MatchScore? score,
      LiveStats? liveStats,
      bool isPreMatchEnabled,
      bool isLiveEnabled,
      bool isFeatured,
      String createdBy,
      DateTime createdAt});

  @override
  $MatchScoreCopyWith<$Res>? get score;
  @override
  $LiveStatsCopyWith<$Res>? get liveStats;
}

/// @nodoc
class __$$MatchImplCopyWithImpl<$Res>
    extends _$MatchCopyWithImpl<$Res, _$MatchImpl>
    implements _$$MatchImplCopyWith<$Res> {
  __$$MatchImplCopyWithImpl(
      _$MatchImpl _value, $Res Function(_$MatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sportId = null,
    Object? leagueId = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? homeTeamLogo = freezed,
    Object? awayTeamLogo = freezed,
    Object? startTime = null,
    Object? status = null,
    Object? score = freezed,
    Object? liveStats = freezed,
    Object? isPreMatchEnabled = null,
    Object? isLiveEnabled = null,
    Object? isFeatured = null,
    Object? createdBy = null,
    Object? createdAt = null,
  }) {
    return _then(_$MatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sportId: null == sportId
          ? _value.sportId
          : sportId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: null == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeamLogo: freezed == homeTeamLogo
          ? _value.homeTeamLogo
          : homeTeamLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamLogo: freezed == awayTeamLogo
          ? _value.awayTeamLogo
          : awayTeamLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MatchStatus,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as MatchScore?,
      liveStats: freezed == liveStats
          ? _value.liveStats
          : liveStats // ignore: cast_nullable_to_non_nullable
              as LiveStats?,
      isPreMatchEnabled: null == isPreMatchEnabled
          ? _value.isPreMatchEnabled
          : isPreMatchEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiveEnabled: null == isLiveEnabled
          ? _value.isLiveEnabled
          : isLiveEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$MatchImpl implements _Match {
  const _$MatchImpl(
      {required this.id,
      required this.sportId,
      required this.leagueId,
      required this.homeTeam,
      required this.awayTeam,
      this.homeTeamLogo,
      this.awayTeamLogo,
      required this.startTime,
      required this.status,
      this.score,
      this.liveStats,
      required this.isPreMatchEnabled,
      required this.isLiveEnabled,
      required this.isFeatured,
      required this.createdBy,
      required this.createdAt});

  factory _$MatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImplFromJson(json);

  @override
  final String id;
  @override
  final String sportId;
  @override
  final String leagueId;
  @override
  final String homeTeam;
  @override
  final String awayTeam;
  @override
  final String? homeTeamLogo;
  @override
  final String? awayTeamLogo;
  @override
  final DateTime startTime;
  @override
  final MatchStatus status;
  @override
  final MatchScore? score;
  @override
  final LiveStats? liveStats;
  @override
  final bool isPreMatchEnabled;
  @override
  final bool isLiveEnabled;
  @override
  final bool isFeatured;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Match(id: $id, sportId: $sportId, leagueId: $leagueId, homeTeam: $homeTeam, awayTeam: $awayTeam, homeTeamLogo: $homeTeamLogo, awayTeamLogo: $awayTeamLogo, startTime: $startTime, status: $status, score: $score, liveStats: $liveStats, isPreMatchEnabled: $isPreMatchEnabled, isLiveEnabled: $isLiveEnabled, isFeatured: $isFeatured, createdBy: $createdBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sportId, sportId) || other.sportId == sportId) &&
            (identical(other.leagueId, leagueId) ||
                other.leagueId == leagueId) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.homeTeamLogo, homeTeamLogo) ||
                other.homeTeamLogo == homeTeamLogo) &&
            (identical(other.awayTeamLogo, awayTeamLogo) ||
                other.awayTeamLogo == awayTeamLogo) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.liveStats, liveStats) ||
                other.liveStats == liveStats) &&
            (identical(other.isPreMatchEnabled, isPreMatchEnabled) ||
                other.isPreMatchEnabled == isPreMatchEnabled) &&
            (identical(other.isLiveEnabled, isLiveEnabled) ||
                other.isLiveEnabled == isLiveEnabled) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
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
      sportId,
      leagueId,
      homeTeam,
      awayTeam,
      homeTeamLogo,
      awayTeamLogo,
      startTime,
      status,
      score,
      liveStats,
      isPreMatchEnabled,
      isLiveEnabled,
      isFeatured,
      createdBy,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      __$$MatchImplCopyWithImpl<_$MatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchImplToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  const factory _Match(
      {required final String id,
      required final String sportId,
      required final String leagueId,
      required final String homeTeam,
      required final String awayTeam,
      final String? homeTeamLogo,
      final String? awayTeamLogo,
      required final DateTime startTime,
      required final MatchStatus status,
      final MatchScore? score,
      final LiveStats? liveStats,
      required final bool isPreMatchEnabled,
      required final bool isLiveEnabled,
      required final bool isFeatured,
      required final String createdBy,
      required final DateTime createdAt}) = _$MatchImpl;

  factory _Match.fromJson(Map<String, dynamic> json) = _$MatchImpl.fromJson;

  @override
  String get id;
  @override
  String get sportId;
  @override
  String get leagueId;
  @override
  String get homeTeam;
  @override
  String get awayTeam;
  @override
  String? get homeTeamLogo;
  @override
  String? get awayTeamLogo;
  @override
  DateTime get startTime;
  @override
  MatchStatus get status;
  @override
  MatchScore? get score;
  @override
  LiveStats? get liveStats;
  @override
  bool get isPreMatchEnabled;
  @override
  bool get isLiveEnabled;
  @override
  bool get isFeatured;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchScore _$MatchScoreFromJson(Map<String, dynamic> json) {
  return _MatchScore.fromJson(json);
}

/// @nodoc
mixin _$MatchScore {
  int get home => throw _privateConstructorUsedError;
  int get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchScoreCopyWith<MatchScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchScoreCopyWith<$Res> {
  factory $MatchScoreCopyWith(
          MatchScore value, $Res Function(MatchScore) then) =
      _$MatchScoreCopyWithImpl<$Res, MatchScore>;
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class _$MatchScoreCopyWithImpl<$Res, $Val extends MatchScore>
    implements $MatchScoreCopyWith<$Res> {
  _$MatchScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchScoreImplCopyWith<$Res>
    implements $MatchScoreCopyWith<$Res> {
  factory _$$MatchScoreImplCopyWith(
          _$MatchScoreImpl value, $Res Function(_$MatchScoreImpl) then) =
      __$$MatchScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class __$$MatchScoreImplCopyWithImpl<$Res>
    extends _$MatchScoreCopyWithImpl<$Res, _$MatchScoreImpl>
    implements _$$MatchScoreImplCopyWith<$Res> {
  __$$MatchScoreImplCopyWithImpl(
      _$MatchScoreImpl _value, $Res Function(_$MatchScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$MatchScoreImpl(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchScoreImpl implements _MatchScore {
  const _$MatchScoreImpl({required this.home, required this.away});

  factory _$MatchScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchScoreImplFromJson(json);

  @override
  final int home;
  @override
  final int away;

  @override
  String toString() {
    return 'MatchScore(home: $home, away: $away)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchScoreImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.away, away) || other.away == away));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, home, away);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchScoreImplCopyWith<_$MatchScoreImpl> get copyWith =>
      __$$MatchScoreImplCopyWithImpl<_$MatchScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchScoreImplToJson(
      this,
    );
  }
}

abstract class _MatchScore implements MatchScore {
  const factory _MatchScore(
      {required final int home, required final int away}) = _$MatchScoreImpl;

  factory _MatchScore.fromJson(Map<String, dynamic> json) =
      _$MatchScoreImpl.fromJson;

  @override
  int get home;
  @override
  int get away;
  @override
  @JsonKey(ignore: true)
  _$$MatchScoreImplCopyWith<_$MatchScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveStats _$LiveStatsFromJson(Map<String, dynamic> json) {
  return _LiveStats.fromJson(json);
}

/// @nodoc
mixin _$LiveStats {
  int get minute => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  Possession? get possession => throw _privateConstructorUsedError;
  Corners? get corners => throw _privateConstructorUsedError;
  Cards? get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveStatsCopyWith<LiveStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveStatsCopyWith<$Res> {
  factory $LiveStatsCopyWith(LiveStats value, $Res Function(LiveStats) then) =
      _$LiveStatsCopyWithImpl<$Res, LiveStats>;
  @useResult
  $Res call(
      {int minute,
      String period,
      Possession? possession,
      Corners? corners,
      Cards? cards});

  $PossessionCopyWith<$Res>? get possession;
  $CornersCopyWith<$Res>? get corners;
  $CardsCopyWith<$Res>? get cards;
}

/// @nodoc
class _$LiveStatsCopyWithImpl<$Res, $Val extends LiveStats>
    implements $LiveStatsCopyWith<$Res> {
  _$LiveStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minute = null,
    Object? period = null,
    Object? possession = freezed,
    Object? corners = freezed,
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as Possession?,
      corners: freezed == corners
          ? _value.corners
          : corners // ignore: cast_nullable_to_non_nullable
              as Corners?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Cards?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PossessionCopyWith<$Res>? get possession {
    if (_value.possession == null) {
      return null;
    }

    return $PossessionCopyWith<$Res>(_value.possession!, (value) {
      return _then(_value.copyWith(possession: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CornersCopyWith<$Res>? get corners {
    if (_value.corners == null) {
      return null;
    }

    return $CornersCopyWith<$Res>(_value.corners!, (value) {
      return _then(_value.copyWith(corners: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsCopyWith<$Res>? get cards {
    if (_value.cards == null) {
      return null;
    }

    return $CardsCopyWith<$Res>(_value.cards!, (value) {
      return _then(_value.copyWith(cards: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveStatsImplCopyWith<$Res>
    implements $LiveStatsCopyWith<$Res> {
  factory _$$LiveStatsImplCopyWith(
          _$LiveStatsImpl value, $Res Function(_$LiveStatsImpl) then) =
      __$$LiveStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int minute,
      String period,
      Possession? possession,
      Corners? corners,
      Cards? cards});

  @override
  $PossessionCopyWith<$Res>? get possession;
  @override
  $CornersCopyWith<$Res>? get corners;
  @override
  $CardsCopyWith<$Res>? get cards;
}

/// @nodoc
class __$$LiveStatsImplCopyWithImpl<$Res>
    extends _$LiveStatsCopyWithImpl<$Res, _$LiveStatsImpl>
    implements _$$LiveStatsImplCopyWith<$Res> {
  __$$LiveStatsImplCopyWithImpl(
      _$LiveStatsImpl _value, $Res Function(_$LiveStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minute = null,
    Object? period = null,
    Object? possession = freezed,
    Object? corners = freezed,
    Object? cards = freezed,
  }) {
    return _then(_$LiveStatsImpl(
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      possession: freezed == possession
          ? _value.possession
          : possession // ignore: cast_nullable_to_non_nullable
              as Possession?,
      corners: freezed == corners
          ? _value.corners
          : corners // ignore: cast_nullable_to_non_nullable
              as Corners?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Cards?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveStatsImpl implements _LiveStats {
  const _$LiveStatsImpl(
      {required this.minute,
      required this.period,
      this.possession,
      this.corners,
      this.cards});

  factory _$LiveStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveStatsImplFromJson(json);

  @override
  final int minute;
  @override
  final String period;
  @override
  final Possession? possession;
  @override
  final Corners? corners;
  @override
  final Cards? cards;

  @override
  String toString() {
    return 'LiveStats(minute: $minute, period: $period, possession: $possession, corners: $corners, cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveStatsImpl &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.possession, possession) ||
                other.possession == possession) &&
            (identical(other.corners, corners) || other.corners == corners) &&
            (identical(other.cards, cards) || other.cards == cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, minute, period, possession, corners, cards);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveStatsImplCopyWith<_$LiveStatsImpl> get copyWith =>
      __$$LiveStatsImplCopyWithImpl<_$LiveStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveStatsImplToJson(
      this,
    );
  }
}

abstract class _LiveStats implements LiveStats {
  const factory _LiveStats(
      {required final int minute,
      required final String period,
      final Possession? possession,
      final Corners? corners,
      final Cards? cards}) = _$LiveStatsImpl;

  factory _LiveStats.fromJson(Map<String, dynamic> json) =
      _$LiveStatsImpl.fromJson;

  @override
  int get minute;
  @override
  String get period;
  @override
  Possession? get possession;
  @override
  Corners? get corners;
  @override
  Cards? get cards;
  @override
  @JsonKey(ignore: true)
  _$$LiveStatsImplCopyWith<_$LiveStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Possession _$PossessionFromJson(Map<String, dynamic> json) {
  return _Possession.fromJson(json);
}

/// @nodoc
mixin _$Possession {
  int get home => throw _privateConstructorUsedError;
  int get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PossessionCopyWith<Possession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PossessionCopyWith<$Res> {
  factory $PossessionCopyWith(
          Possession value, $Res Function(Possession) then) =
      _$PossessionCopyWithImpl<$Res, Possession>;
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class _$PossessionCopyWithImpl<$Res, $Val extends Possession>
    implements $PossessionCopyWith<$Res> {
  _$PossessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PossessionImplCopyWith<$Res>
    implements $PossessionCopyWith<$Res> {
  factory _$$PossessionImplCopyWith(
          _$PossessionImpl value, $Res Function(_$PossessionImpl) then) =
      __$$PossessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class __$$PossessionImplCopyWithImpl<$Res>
    extends _$PossessionCopyWithImpl<$Res, _$PossessionImpl>
    implements _$$PossessionImplCopyWith<$Res> {
  __$$PossessionImplCopyWithImpl(
      _$PossessionImpl _value, $Res Function(_$PossessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$PossessionImpl(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PossessionImpl implements _Possession {
  const _$PossessionImpl({required this.home, required this.away});

  factory _$PossessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PossessionImplFromJson(json);

  @override
  final int home;
  @override
  final int away;

  @override
  String toString() {
    return 'Possession(home: $home, away: $away)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PossessionImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.away, away) || other.away == away));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, home, away);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PossessionImplCopyWith<_$PossessionImpl> get copyWith =>
      __$$PossessionImplCopyWithImpl<_$PossessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PossessionImplToJson(
      this,
    );
  }
}

abstract class _Possession implements Possession {
  const factory _Possession(
      {required final int home, required final int away}) = _$PossessionImpl;

  factory _Possession.fromJson(Map<String, dynamic> json) =
      _$PossessionImpl.fromJson;

  @override
  int get home;
  @override
  int get away;
  @override
  @JsonKey(ignore: true)
  _$$PossessionImplCopyWith<_$PossessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Corners _$CornersFromJson(Map<String, dynamic> json) {
  return _Corners.fromJson(json);
}

/// @nodoc
mixin _$Corners {
  int get home => throw _privateConstructorUsedError;
  int get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CornersCopyWith<Corners> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CornersCopyWith<$Res> {
  factory $CornersCopyWith(Corners value, $Res Function(Corners) then) =
      _$CornersCopyWithImpl<$Res, Corners>;
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class _$CornersCopyWithImpl<$Res, $Val extends Corners>
    implements $CornersCopyWith<$Res> {
  _$CornersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CornersImplCopyWith<$Res> implements $CornersCopyWith<$Res> {
  factory _$$CornersImplCopyWith(
          _$CornersImpl value, $Res Function(_$CornersImpl) then) =
      __$$CornersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class __$$CornersImplCopyWithImpl<$Res>
    extends _$CornersCopyWithImpl<$Res, _$CornersImpl>
    implements _$$CornersImplCopyWith<$Res> {
  __$$CornersImplCopyWithImpl(
      _$CornersImpl _value, $Res Function(_$CornersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$CornersImpl(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CornersImpl implements _Corners {
  const _$CornersImpl({required this.home, required this.away});

  factory _$CornersImpl.fromJson(Map<String, dynamic> json) =>
      _$$CornersImplFromJson(json);

  @override
  final int home;
  @override
  final int away;

  @override
  String toString() {
    return 'Corners(home: $home, away: $away)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CornersImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.away, away) || other.away == away));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, home, away);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CornersImplCopyWith<_$CornersImpl> get copyWith =>
      __$$CornersImplCopyWithImpl<_$CornersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CornersImplToJson(
      this,
    );
  }
}

abstract class _Corners implements Corners {
  const factory _Corners({required final int home, required final int away}) =
      _$CornersImpl;

  factory _Corners.fromJson(Map<String, dynamic> json) = _$CornersImpl.fromJson;

  @override
  int get home;
  @override
  int get away;
  @override
  @JsonKey(ignore: true)
  _$$CornersImplCopyWith<_$CornersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cards _$CardsFromJson(Map<String, dynamic> json) {
  return _Cards.fromJson(json);
}

/// @nodoc
mixin _$Cards {
  int get home => throw _privateConstructorUsedError;
  int get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardsCopyWith<Cards> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsCopyWith<$Res> {
  factory $CardsCopyWith(Cards value, $Res Function(Cards) then) =
      _$CardsCopyWithImpl<$Res, Cards>;
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class _$CardsCopyWithImpl<$Res, $Val extends Cards>
    implements $CardsCopyWith<$Res> {
  _$CardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardsImplCopyWith<$Res> implements $CardsCopyWith<$Res> {
  factory _$$CardsImplCopyWith(
          _$CardsImpl value, $Res Function(_$CardsImpl) then) =
      __$$CardsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int home, int away});
}

/// @nodoc
class __$$CardsImplCopyWithImpl<$Res>
    extends _$CardsCopyWithImpl<$Res, _$CardsImpl>
    implements _$$CardsImplCopyWith<$Res> {
  __$$CardsImplCopyWithImpl(
      _$CardsImpl _value, $Res Function(_$CardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$CardsImpl(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardsImpl implements _Cards {
  const _$CardsImpl({required this.home, required this.away});

  factory _$CardsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardsImplFromJson(json);

  @override
  final int home;
  @override
  final int away;

  @override
  String toString() {
    return 'Cards(home: $home, away: $away)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardsImpl &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.away, away) || other.away == away));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, home, away);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardsImplCopyWith<_$CardsImpl> get copyWith =>
      __$$CardsImplCopyWithImpl<_$CardsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardsImplToJson(
      this,
    );
  }
}

abstract class _Cards implements Cards {
  const factory _Cards({required final int home, required final int away}) =
      _$CardsImpl;

  factory _Cards.fromJson(Map<String, dynamic> json) = _$CardsImpl.fromJson;

  @override
  int get home;
  @override
  int get away;
  @override
  @JsonKey(ignore: true)
  _$$CardsImplCopyWith<_$CardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
