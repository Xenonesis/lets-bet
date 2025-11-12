import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';
import '../services/convex_service.dart';
import '../services/mock_data_service.dart';
import '../models/user.dart';
import '../models/sport.dart';
import '../models/match.dart';
import '../models/betting.dart';
import '../models/wallet.dart';

// Services
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final convexServiceProvider = Provider<ConvexService>((ref) {
  return ConvexService();
});

// Auth State
final currentUserProvider = StateNotifierProvider<CurrentUserNotifier, User?>((ref) {
  return CurrentUserNotifier(ref.watch(authServiceProvider));
});

class CurrentUserNotifier extends StateNotifier<User?> {
  final AuthService _authService;

  CurrentUserNotifier(this._authService) : super(null) {
    _init();
  }

  Future<void> _init() async {
    await _authService.initialize();
    state = _authService.currentUser;
  }

  Future<void> login(String email, String password) async {
    state = await _authService.login(email, password);
  }

  Future<void> register({
    required String email,
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String country,
    String? phone,
  }) async {
    state = await _authService.register(
      email: email,
      username: username,
      password: password,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      country: country,
      phone: phone,
    );
  }

  Future<void> logout() async {
    await _authService.logout();
    state = null;
  }

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    String? country,
  }) async {
    state = await _authService.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      country: country,
    );
  }
}

// Sports Data - Using Convex database
final sportsProvider = FutureProvider<List<Sport>>((ref) async {
  final convexService = ref.watch(convexServiceProvider);
  final sportsData = await convexService.getSports();
  return sportsData.map((data) => Sport.fromJson(data)).toList();
});

final selectedSportProvider = StateProvider<Sport?>((ref) => null);

final leaguesProvider = FutureProvider.family<List<League>, String>((ref, sportId) async {
  final convexService = ref.watch(convexServiceProvider);
  final leaguesData = await convexService.getLeaguesBySport(sportId);
  return leaguesData.map((data) => League.fromJson(data)).toList();
});

// Matches Data - Using Convex database
final featuredMatchesProvider = FutureProvider<List<Match>>((ref) async {
  final convexService = ref.watch(convexServiceProvider);
  final matchesData = await convexService.query<List<Map<String, dynamic>>>('matches:getFeatured', {});
  return matchesData.map((data) => Match.fromJson(data)).toList();
});

final liveMatchesProvider = FutureProvider<List<Match>>((ref) async {
  final convexService = ref.watch(convexServiceProvider);
  final matchesData = await convexService.query<List<Map<String, dynamic>>>('matches:getLive', {});
  return matchesData.map((data) => Match.fromJson(data)).toList();
});

final upcomingMatchesProvider = FutureProvider.family<List<Match>, String?>((ref, sportId) async {
  final convexService = ref.watch(convexServiceProvider);
  final matchesData = await convexService.query<List<Map<String, dynamic>>>('matches:getUpcoming', sportId != null ? {'sportId': sportId} : {});
  return matchesData.map((data) => Match.fromJson(data)).toList();
});

// Betting Data
final selectedMatchProvider = StateProvider<Match?>((ref) => null);

final marketsProvider = FutureProvider.family<List<Market>, String>((ref, matchId) async {
  final convexService = ref.watch(convexServiceProvider);
  final marketsData = await convexService.getMarketsByMatch(matchId);
  return marketsData.map((data) => Market.fromJson(data)).toList();
});

// Bet Slip
final betSlipProvider = StateNotifierProvider<BetSlipNotifier, BetSlip>((ref) {
  return BetSlipNotifier();
});

class BetSlipNotifier extends StateNotifier<BetSlip> {
  BetSlipNotifier() : super(const BetSlip());

  void addSelection(BetSlipItem item) {
    // Remove existing selection for the same market
    final updatedSelections = state.selections
        .where((s) => s.marketId != item.marketId)
        .toList();
    
    // Add new selection
    updatedSelections.add(item);
    
    state = state.copyWith(selections: updatedSelections);
    _updateCalculations();
  }

  void removeSelection(String marketId) {
    final updatedSelections = state.selections
        .where((s) => s.marketId != marketId)
        .toList();
    
    state = state.copyWith(selections: updatedSelections);
    _updateCalculations();
  }

  void updateStake(String marketId, double stake) {
    final updatedSelections = state.selections.map((s) {
      if (s.marketId == marketId) {
        return s.copyWith(stake: stake);
      }
      return s;
    }).toList();
    
    state = state.copyWith(selections: updatedSelections);
    _updateCalculations();
  }

  void updateTotalStake(double totalStake) {
    state = state.copyWith(totalStake: totalStake);
    _updateCalculations();
  }

  void setBetType(BetType betType) {
    state = state.copyWith(betType: betType);
    _updateCalculations();
  }

  void toggleAcceptOddsChanges() {
    state = state.copyWith(acceptOddsChanges: !state.acceptOddsChanges);
  }

  void clear() {
    state = const BetSlip();
  }

  void _updateCalculations() {
    if (state.selections.isEmpty) return;
    
    double potentialWin = 0.0;
    
    switch (state.betType) {
      case BetType.single:
        if (state.selections.isNotEmpty && state.totalStake != null) {
          potentialWin = state.totalStake! * state.selections.first.odds;
        }
        break;
      case BetType.multiple:
        if (state.totalStake != null) {
          potentialWin = state.totalStake! * state.totalOdds;
        }
        break;
    }
    
    state = state.copyWith(potentialWin: potentialWin);
  }
}

// User Bets - Using Convex database
final userBetsProvider = FutureProvider<List<Bet>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];

  final convexService = ref.watch(convexServiceProvider);
  final betsData = await convexService.getUserBets(user.id);
  return betsData.map((data) => Bet.fromJson(data)).toList();
});

// Wallet - Using Convex database
final walletProvider = FutureProvider<Wallet?>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;

  final convexService = ref.watch(convexServiceProvider);
  final walletData = await convexService.getUserWallet(user.id);
  return walletData != null ? Wallet.fromJson(walletData) : null;
});

// UI State
final selectedTabProvider = StateProvider<int>((ref) => 0);
final themeProvider = StateProvider<bool>((ref) => false); // false = light, true = dark
