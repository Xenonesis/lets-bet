// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      bonusBalance: (json['bonusBalance'] as num).toDouble(),
      currency: json['currency'] as String,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'balance': instance.balance,
      'bonusBalance': instance.bonusBalance,
      'currency': instance.currency,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      walletId: json['walletId'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      balanceBefore: (json['balanceBefore'] as num).toDouble(),
      balanceAfter: (json['balanceAfter'] as num).toDouble(),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      reference: json['reference'] as String?,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'walletId': instance.walletId,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'balanceBefore': instance.balanceBefore,
      'balanceAfter': instance.balanceAfter,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'reference': instance.reference,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.deposit: 'deposit',
  TransactionType.withdrawal: 'withdrawal',
  TransactionType.betPlaced: 'bet_placed',
  TransactionType.betWon: 'bet_won',
  TransactionType.bonus: 'bonus',
  TransactionType.cashout: 'cashout',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.completed: 'completed',
  TransactionStatus.failed: 'failed',
};

_$PromotionImpl _$$PromotionImplFromJson(Map<String, dynamic> json) =>
    _$PromotionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$PromotionTypeEnumMap, json['type']),
      description: json['description'] as String,
      value: (json['value'] as num).toDouble(),
      valueType: $enumDecode(_$ValueTypeEnumMap, json['valueType']),
      minDeposit: (json['minDeposit'] as num?)?.toDouble(),
      maxBonus: (json['maxBonus'] as num?)?.toDouble(),
      wageringRequirement: (json['wageringRequirement'] as num).toDouble(),
      validDays: (json['validDays'] as num).toInt(),
      applicableSports: (json['applicableSports'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PromotionImplToJson(_$PromotionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PromotionTypeEnumMap[instance.type]!,
      'description': instance.description,
      'value': instance.value,
      'valueType': _$ValueTypeEnumMap[instance.valueType]!,
      'minDeposit': instance.minDeposit,
      'maxBonus': instance.maxBonus,
      'wageringRequirement': instance.wageringRequirement,
      'validDays': instance.validDays,
      'applicableSports': instance.applicableSports,
      'isActive': instance.isActive,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$PromotionTypeEnumMap = {
  PromotionType.deposit: 'deposit',
  PromotionType.freeBet: 'free_bet',
  PromotionType.cashback: 'cashback',
};

const _$ValueTypeEnumMap = {
  ValueType.percentage: 'percentage',
  ValueType.fixed: 'fixed',
};

_$UserBonusImpl _$$UserBonusImplFromJson(Map<String, dynamic> json) =>
    _$UserBonusImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      promotionId: json['promotionId'] as String,
      amount: (json['amount'] as num).toDouble(),
      wageringRemaining: (json['wageringRemaining'] as num).toDouble(),
      status: $enumDecode(_$BonusStatusEnumMap, json['status']),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserBonusImplToJson(_$UserBonusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'promotionId': instance.promotionId,
      'amount': instance.amount,
      'wageringRemaining': instance.wageringRemaining,
      'status': _$BonusStatusEnumMap[instance.status]!,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$BonusStatusEnumMap = {
  BonusStatus.active: 'active',
  BonusStatus.completed: 'completed',
  BonusStatus.expired: 'expired',
};
