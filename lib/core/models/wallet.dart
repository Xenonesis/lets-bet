import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    required String id,
    required String userId,
    required double balance,
    required double bonusBalance,
    required String currency,
    required bool isActive,
    required DateTime createdAt,
  }) = _Wallet;
  
  const Wallet._();

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
  
  double get totalBalance => balance + bonusBalance;
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String userId,
    required String walletId,
    required TransactionType type,
    required double amount,
    required double balanceBefore,
    required double balanceAfter,
    required TransactionStatus status,
    String? reference,
    required String description,
    required DateTime createdAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}

@freezed
class Promotion with _$Promotion {
  const factory Promotion({
    required String id,
    required String name,
    required PromotionType type,
    required String description,
    required double value,
    required ValueType valueType,
    double? minDeposit,
    double? maxBonus,
    required double wageringRequirement,
    required int validDays,
    required List<String> applicableSports,
    required bool isActive,
    required DateTime startDate,
    required DateTime endDate,
    required String createdBy,
    required DateTime createdAt,
  }) = _Promotion;

  factory Promotion.fromJson(Map<String, dynamic> json) => _$PromotionFromJson(json);
}

@freezed
class UserBonus with _$UserBonus {
  const factory UserBonus({
    required String id,
    required String userId,
    required String promotionId,
    required double amount,
    required double wageringRemaining,
    required BonusStatus status,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) = _UserBonus;

  factory UserBonus.fromJson(Map<String, dynamic> json) => _$UserBonusFromJson(json);
}

@JsonEnum()
enum TransactionType {
  @JsonValue('deposit')
  deposit,
  @JsonValue('withdrawal')
  withdrawal,
  @JsonValue('bet_placed')
  betPlaced,
  @JsonValue('bet_won')
  betWon,
  @JsonValue('bonus')
  bonus,
  @JsonValue('cashout')
  cashout,
}

@JsonEnum()
enum TransactionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}

@JsonEnum()
enum PromotionType {
  @JsonValue('deposit')
  deposit,
  @JsonValue('free_bet')
  freeBet,
  @JsonValue('cashback')
  cashback,
}

@JsonEnum()
enum ValueType {
  @JsonValue('percentage')
  percentage,
  @JsonValue('fixed')
  fixed,
}

@JsonEnum()
enum BonusStatus {
  @JsonValue('active')
  active,
  @JsonValue('completed')
  completed,
  @JsonValue('expired')
  expired,
}