import 'package:freezed_annotation/freezed_annotation.dart';

part 'betting.freezed.dart';
part 'betting.g.dart';

@freezed
class Market with _$Market {
  const factory Market({
    required String id,
    required String matchId,
    required String name,
    required String type,
    required String description,
    required String category,
    required int displayOrder,
    required bool isActive,
    required bool isSuspended,
    required double maxStake,
    required double minStake,
    required double margin,
    required String createdBy,
    required DateTime createdAt,
    @Default([]) List<Outcome> outcomes,
  }) = _Market;

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
}

@freezed
class Outcome with _$Outcome {
  const factory Outcome({
    required String id,
    required String marketId,
    required String name,
    required double odds,
    required bool isActive,
    required bool isSuspended,
    required int displayOrder,
    required DateTime updatedAt,
  }) = _Outcome;

  factory Outcome.fromJson(Map<String, dynamic> json) => _$OutcomeFromJson(json);
}

@freezed
class Bet with _$Bet {
  const factory Bet({
    required String id,
    required String userId,
    required BetType type,
    required BetStatus status,
    required double totalStake,
    required double potentialWin,
    double? actualWin,
    double? cashOutValue,
    required DateTime placedAt,
    DateTime? settledAt,
    @Default([]) List<BetSelection> selections,
  }) = _Bet;

  factory Bet.fromJson(Map<String, dynamic> json) => _$BetFromJson(json);
}

@freezed
class BetSelection with _$BetSelection {
  const factory BetSelection({
    required String id,
    required String betId,
    required String matchId,
    required String marketId,
    required String outcomeId,
    required double odds,
    required SelectionStatus status,
    String? matchName,
    String? marketName,
    String? outcomeName,
  }) = _BetSelection;

  factory BetSelection.fromJson(Map<String, dynamic> json) => _$BetSelectionFromJson(json);
}

@freezed
class BetSlipItem with _$BetSlipItem {
  const factory BetSlipItem({
    required String matchId,
    required String marketId,
    required String outcomeId,
    required String matchName,
    required String marketName,
    required String outcomeName,
    required double odds,
    double? stake,
  }) = _BetSlipItem;

  factory BetSlipItem.fromJson(Map<String, dynamic> json) => _$BetSlipItemFromJson(json);
}

@freezed
class BetSlip with _$BetSlip {
  const factory BetSlip({
    @Default([]) List<BetSlipItem> selections,
    @Default(BetType.single) BetType betType,
    double? totalStake,
    double? potentialWin,
    @Default(false) bool acceptOddsChanges,
  }) = _BetSlip;
  
  const BetSlip._();

  factory BetSlip.fromJson(Map<String, dynamic> json) => _$BetSlipFromJson(json);
  
  double get totalOdds {
    if (selections.isEmpty) return 0.0;
    
    switch (betType) {
      case BetType.single:
        return selections.first.odds;
      case BetType.multiple:
        return selections.fold(1.0, (acc, selection) => acc * selection.odds);
    }
  }
  
  double calculatePotentialWin(double stake) {
    return stake * totalOdds;
  }
  
  bool get isValid {
    return selections.isNotEmpty && 
           selections.every((s) => s.odds > 0) &&
           (totalStake ?? 0) > 0;
  }
}

@JsonEnum()
enum BetType {
  @JsonValue('single')
  single,
  @JsonValue('multiple')
  multiple,
}

@JsonEnum()
enum BetStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('placed')
  placed,
  @JsonValue('won')
  won,
  @JsonValue('lost')
  lost,
  @JsonValue('voided')
  voided,
  @JsonValue('cashed_out')
  cashedOut,
}

@JsonEnum()
enum SelectionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('won')
  won,
  @JsonValue('lost')
  lost,
  @JsonValue('voided')
  voided,
}