import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport.freezed.dart';
part 'sport.g.dart';

@freezed
class Sport with _$Sport {
  const factory Sport({
    required String id,
    required String name,
    required String code,
    required String icon,
    required String themeColor,
    required int displayOrder,
    required bool isActive,
    required String createdBy,
    required DateTime createdAt,
  }) = _Sport;

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);
}

@freezed
class League with _$League {
  const factory League({
    required String id,
    required String sportId,
    required String name,
    required String code,
    required String logo,
    required String country,
    required bool isActive,
    required int displayOrder,
    String? seasonStart,
    String? seasonEnd,
    required String createdBy,
    required DateTime createdAt,
  }) = _League;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}