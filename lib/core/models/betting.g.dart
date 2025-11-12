// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'betting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketImpl _$$MarketImplFromJson(Map<String, dynamic> json) => _$MarketImpl(
      id: json['id'] as String,
      matchId: json['matchId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
      isActive: json['isActive'] as bool,
      isSuspended: json['isSuspended'] as bool,
      maxStake: (json['maxStake'] as num).toDouble(),
      minStake: (json['minStake'] as num).toDouble(),
      margin: (json['margin'] as num).toDouble(),
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      outcomes: (json['outcomes'] as List<dynamic>?)
              ?.map((e) => Outcome.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MarketImplToJson(_$MarketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchId': instance.matchId,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'category': instance.category,
      'displayOrder': instance.displayOrder,
      'isActive': instance.isActive,
      'isSuspended': instance.isSuspended,
      'maxStake': instance.maxStake,
      'minStake': instance.minStake,
      'margin': instance.margin,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'outcomes': instance.outcomes,
    };

_$OutcomeImpl _$$OutcomeImplFromJson(Map<String, dynamic> json) =>
    _$OutcomeImpl(
      id: json['id'] as String,
      marketId: json['marketId'] as String,
      name: json['name'] as String,
      odds: (json['odds'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      isSuspended: json['isSuspended'] as bool,
      displayOrder: (json['displayOrder'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OutcomeImplToJson(_$OutcomeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'marketId': instance.marketId,
      'name': instance.name,
      'odds': instance.odds,
      'isActive': instance.isActive,
      'isSuspended': instance.isSuspended,
      'displayOrder': instance.displayOrder,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$BetImpl _$$BetImplFromJson(Map<String, dynamic> json) => _$BetImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$BetTypeEnumMap, json['type']),
      status: $enumDecode(_$BetStatusEnumMap, json['status']),
      totalStake: (json['totalStake'] as num).toDouble(),
      potentialWin: (json['potentialWin'] as num).toDouble(),
      actualWin: (json['actualWin'] as num?)?.toDouble(),
      cashOutValue: (json['cashOutValue'] as num?)?.toDouble(),
      placedAt: DateTime.parse(json['placedAt'] as String),
      settledAt: json['settledAt'] == null
          ? null
          : DateTime.parse(json['settledAt'] as String),
      selections: (json['selections'] as List<dynamic>?)
              ?.map((e) => BetSelection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BetImplToJson(_$BetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$BetTypeEnumMap[instance.type]!,
      'status': _$BetStatusEnumMap[instance.status]!,
      'totalStake': instance.totalStake,
      'potentialWin': instance.potentialWin,
      'actualWin': instance.actualWin,
      'cashOutValue': instance.cashOutValue,
      'placedAt': instance.placedAt.toIso8601String(),
      'settledAt': instance.settledAt?.toIso8601String(),
      'selections': instance.selections,
    };

const _$BetTypeEnumMap = {
  BetType.single: 'single',
  BetType.multiple: 'multiple',
};

const _$BetStatusEnumMap = {
  BetStatus.pending: 'pending',
  BetStatus.placed: 'placed',
  BetStatus.won: 'won',
  BetStatus.lost: 'lost',
  BetStatus.voided: 'voided',
  BetStatus.cashedOut: 'cashed_out',
};

_$BetSelectionImpl _$$BetSelectionImplFromJson(Map<String, dynamic> json) =>
    _$BetSelectionImpl(
      id: json['id'] as String,
      betId: json['betId'] as String,
      matchId: json['matchId'] as String,
      marketId: json['marketId'] as String,
      outcomeId: json['outcomeId'] as String,
      odds: (json['odds'] as num).toDouble(),
      status: $enumDecode(_$SelectionStatusEnumMap, json['status']),
      matchName: json['matchName'] as String?,
      marketName: json['marketName'] as String?,
      outcomeName: json['outcomeName'] as String?,
    );

Map<String, dynamic> _$$BetSelectionImplToJson(_$BetSelectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'betId': instance.betId,
      'matchId': instance.matchId,
      'marketId': instance.marketId,
      'outcomeId': instance.outcomeId,
      'odds': instance.odds,
      'status': _$SelectionStatusEnumMap[instance.status]!,
      'matchName': instance.matchName,
      'marketName': instance.marketName,
      'outcomeName': instance.outcomeName,
    };

const _$SelectionStatusEnumMap = {
  SelectionStatus.pending: 'pending',
  SelectionStatus.won: 'won',
  SelectionStatus.lost: 'lost',
  SelectionStatus.voided: 'voided',
};

_$BetSlipItemImpl _$$BetSlipItemImplFromJson(Map<String, dynamic> json) =>
    _$BetSlipItemImpl(
      matchId: json['matchId'] as String,
      marketId: json['marketId'] as String,
      outcomeId: json['outcomeId'] as String,
      matchName: json['matchName'] as String,
      marketName: json['marketName'] as String,
      outcomeName: json['outcomeName'] as String,
      odds: (json['odds'] as num).toDouble(),
      stake: (json['stake'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BetSlipItemImplToJson(_$BetSlipItemImpl instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'marketId': instance.marketId,
      'outcomeId': instance.outcomeId,
      'matchName': instance.matchName,
      'marketName': instance.marketName,
      'outcomeName': instance.outcomeName,
      'odds': instance.odds,
      'stake': instance.stake,
    };

_$BetSlipImpl _$$BetSlipImplFromJson(Map<String, dynamic> json) =>
    _$BetSlipImpl(
      selections: (json['selections'] as List<dynamic>?)
              ?.map((e) => BetSlipItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      betType: $enumDecodeNullable(_$BetTypeEnumMap, json['betType']) ??
          BetType.single,
      totalStake: (json['totalStake'] as num?)?.toDouble(),
      potentialWin: (json['potentialWin'] as num?)?.toDouble(),
      acceptOddsChanges: json['acceptOddsChanges'] as bool? ?? false,
    );

Map<String, dynamic> _$$BetSlipImplToJson(_$BetSlipImpl instance) =>
    <String, dynamic>{
      'selections': instance.selections,
      'betType': _$BetTypeEnumMap[instance.betType]!,
      'totalStake': instance.totalStake,
      'potentialWin': instance.potentialWin,
      'acceptOddsChanges': instance.acceptOddsChanges,
    };
