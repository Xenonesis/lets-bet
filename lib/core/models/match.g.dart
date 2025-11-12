// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      sportId: json['sportId'] as String,
      leagueId: json['leagueId'] as String,
      homeTeam: json['homeTeam'] as String,
      awayTeam: json['awayTeam'] as String,
      homeTeamLogo: json['homeTeamLogo'] as String?,
      awayTeamLogo: json['awayTeamLogo'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      status: $enumDecode(_$MatchStatusEnumMap, json['status']),
      score: json['score'] == null
          ? null
          : MatchScore.fromJson(json['score'] as Map<String, dynamic>),
      liveStats: json['liveStats'] == null
          ? null
          : LiveStats.fromJson(json['liveStats'] as Map<String, dynamic>),
      isPreMatchEnabled: json['isPreMatchEnabled'] as bool,
      isLiveEnabled: json['isLiveEnabled'] as bool,
      isFeatured: json['isFeatured'] as bool,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sportId': instance.sportId,
      'leagueId': instance.leagueId,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'homeTeamLogo': instance.homeTeamLogo,
      'awayTeamLogo': instance.awayTeamLogo,
      'startTime': instance.startTime.toIso8601String(),
      'status': _$MatchStatusEnumMap[instance.status]!,
      'score': instance.score,
      'liveStats': instance.liveStats,
      'isPreMatchEnabled': instance.isPreMatchEnabled,
      'isLiveEnabled': instance.isLiveEnabled,
      'isFeatured': instance.isFeatured,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$MatchStatusEnumMap = {
  MatchStatus.scheduled: 'scheduled',
  MatchStatus.live: 'live',
  MatchStatus.halftime: 'halftime',
  MatchStatus.suspended: 'suspended',
  MatchStatus.finished: 'finished',
  MatchStatus.cancelled: 'cancelled',
};

_$MatchScoreImpl _$$MatchScoreImplFromJson(Map<String, dynamic> json) =>
    _$MatchScoreImpl(
      home: (json['home'] as num).toInt(),
      away: (json['away'] as num).toInt(),
    );

Map<String, dynamic> _$$MatchScoreImplToJson(_$MatchScoreImpl instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

_$LiveStatsImpl _$$LiveStatsImplFromJson(Map<String, dynamic> json) =>
    _$LiveStatsImpl(
      minute: (json['minute'] as num).toInt(),
      period: json['period'] as String,
      possession: json['possession'] == null
          ? null
          : Possession.fromJson(json['possession'] as Map<String, dynamic>),
      corners: json['corners'] == null
          ? null
          : Corners.fromJson(json['corners'] as Map<String, dynamic>),
      cards: json['cards'] == null
          ? null
          : Cards.fromJson(json['cards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LiveStatsImplToJson(_$LiveStatsImpl instance) =>
    <String, dynamic>{
      'minute': instance.minute,
      'period': instance.period,
      'possession': instance.possession,
      'corners': instance.corners,
      'cards': instance.cards,
    };

_$PossessionImpl _$$PossessionImplFromJson(Map<String, dynamic> json) =>
    _$PossessionImpl(
      home: (json['home'] as num).toInt(),
      away: (json['away'] as num).toInt(),
    );

Map<String, dynamic> _$$PossessionImplToJson(_$PossessionImpl instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

_$CornersImpl _$$CornersImplFromJson(Map<String, dynamic> json) =>
    _$CornersImpl(
      home: (json['home'] as num).toInt(),
      away: (json['away'] as num).toInt(),
    );

Map<String, dynamic> _$$CornersImplToJson(_$CornersImpl instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

_$CardsImpl _$$CardsImplFromJson(Map<String, dynamic> json) => _$CardsImpl(
      home: (json['home'] as num).toInt(),
      away: (json['away'] as num).toInt(),
    );

Map<String, dynamic> _$$CardsImplToJson(_$CardsImpl instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };
