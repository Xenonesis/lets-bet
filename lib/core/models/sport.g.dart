// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SportImpl _$$SportImplFromJson(Map<String, dynamic> json) => _$SportImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      icon: json['icon'] as String,
      themeColor: json['themeColor'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
      isActive: json['isActive'] as bool,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SportImplToJson(_$SportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'icon': instance.icon,
      'themeColor': instance.themeColor,
      'displayOrder': instance.displayOrder,
      'isActive': instance.isActive,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$LeagueImpl _$$LeagueImplFromJson(Map<String, dynamic> json) => _$LeagueImpl(
      id: json['id'] as String,
      sportId: json['sportId'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      logo: json['logo'] as String,
      country: json['country'] as String,
      isActive: json['isActive'] as bool,
      displayOrder: (json['displayOrder'] as num).toInt(),
      seasonStart: json['seasonStart'] as String?,
      seasonEnd: json['seasonEnd'] as String?,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$LeagueImplToJson(_$LeagueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sportId': instance.sportId,
      'name': instance.name,
      'code': instance.code,
      'logo': instance.logo,
      'country': instance.country,
      'isActive': instance.isActive,
      'displayOrder': instance.displayOrder,
      'seasonStart': instance.seasonStart,
      'seasonEnd': instance.seasonEnd,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };
