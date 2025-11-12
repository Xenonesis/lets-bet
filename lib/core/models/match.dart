import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    required String sportId,
    required String leagueId,
    required String homeTeam,
    required String awayTeam,
    String? homeTeamLogo,
    String? awayTeamLogo,
    required DateTime startTime,
    required MatchStatus status,
    MatchScore? score,
    LiveStats? liveStats,
    required bool isPreMatchEnabled,
    required bool isLiveEnabled,
    required bool isFeatured,
    required String createdBy,
    required DateTime createdAt,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}

@freezed
class MatchScore with _$MatchScore {
  const factory MatchScore({
    required int home,
    required int away,
  }) = _MatchScore;

  factory MatchScore.fromJson(Map<String, dynamic> json) => _$MatchScoreFromJson(json);
}

@freezed
class LiveStats with _$LiveStats {
  const factory LiveStats({
    required int minute,
    required String period,
    Possession? possession,
    Corners? corners,
    Cards? cards,
  }) = _LiveStats;

  factory LiveStats.fromJson(Map<String, dynamic> json) => _$LiveStatsFromJson(json);
}

@freezed
class Possession with _$Possession {
  const factory Possession({
    required int home,
    required int away,
  }) = _Possession;

  factory Possession.fromJson(Map<String, dynamic> json) => _$PossessionFromJson(json);
}

@freezed
class Corners with _$Corners {
  const factory Corners({
    required int home,
    required int away,
  }) = _Corners;

  factory Corners.fromJson(Map<String, dynamic> json) => _$CornersFromJson(json);
}

@freezed
class Cards with _$Cards {
  const factory Cards({
    required int home,
    required int away,
  }) = _Cards;

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);
}

@JsonEnum()
enum MatchStatus {
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('live')
  live,
  @JsonValue('halftime')
  halftime,
  @JsonValue('suspended')
  suspended,
  @JsonValue('finished')
  finished,
  @JsonValue('cancelled')
  cancelled,
}