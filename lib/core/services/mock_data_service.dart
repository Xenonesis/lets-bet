import '../models/user.dart';
import '../models/sport.dart';
import '../models/match.dart';
import '../models/betting.dart';
import '../models/wallet.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  // Mock Users
  static final User mockUser = User(
    id: 'user_1',
    email: 'test@user.com',
    username: 'testuser',
    firstName: 'Test',
    lastName: 'User',
    dateOfBirth: '1995-01-01',
    country: 'India',
    isVerified: true,
    kycStatus: KycStatus.approved,
    isActive: true,
    role: UserRole.user,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    lastLogin: DateTime.now().subtract(const Duration(hours: 2)),
  );

  // Mock Sports
  static final List<Sport> mockSports = [
    Sport(
      id: 'sport_1',
      name: 'Football',
      code: 'football',
      icon: '⚽',
      themeColor: '#4CAF50',
      displayOrder: 1,
      isActive: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
    ),
    Sport(
      id: 'sport_2',
      name: 'Cricket',
      code: 'cricket',
      icon: '🏏',
      themeColor: '#FF9800',
      displayOrder: 2,
      isActive: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
    ),
    Sport(
      id: 'sport_3',
      name: 'Basketball',
      code: 'basketball',
      icon: '🏀',
      themeColor: '#F44336',
      displayOrder: 3,
      isActive: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
    ),
    Sport(
      id: 'sport_4',
      name: 'Tennis',
      code: 'tennis',
      icon: '🎾',
      themeColor: '#2196F3',
      displayOrder: 4,
      isActive: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
    ),
  ];

  // Mock Matches
  static final List<Match> mockMatches = [
    // Live Match
    Match(
      id: 'match_1',
      sportId: 'sport_1',
      leagueId: 'league_1',
      homeTeam: 'Manchester United',
      awayTeam: 'Liverpool',
      startTime: DateTime.now().subtract(const Duration(hours: 1)),
      status: MatchStatus.live,
      score: const MatchScore(home: 1, away: 2),
      liveStats: const LiveStats(
        minute: 67,
        period: '2nd Half',
        possession: Possession(home: 45, away: 55),
        corners: Corners(home: 3, away: 5),
        cards: Cards(home: 2, away: 1),
      ),
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Upcoming Match 1
    Match(
      id: 'match_2',
      sportId: 'sport_1',
      leagueId: 'league_1',
      homeTeam: 'Arsenal',
      awayTeam: 'Chelsea',
      startTime: DateTime.now().add(const Duration(hours: 2)),
      status: MatchStatus.scheduled,
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Upcoming Match 2
    Match(
      id: 'match_3',
      sportId: 'sport_2',
      leagueId: 'league_2',
      homeTeam: 'Mumbai Indians',
      awayTeam: 'Chennai Super Kings',
      startTime: DateTime.now().add(const Duration(hours: 4)),
      status: MatchStatus.scheduled,
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: true,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Upcoming Match 3
    Match(
      id: 'match_4',
      sportId: 'sport_1',
      leagueId: 'league_1',
      homeTeam: 'Real Madrid',
      awayTeam: 'Barcelona',
      startTime: DateTime.now().add(const Duration(hours: 6)),
      status: MatchStatus.scheduled,
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: false,
      createdBy: 'admin_1',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  // Mock Wallet
  static final Wallet mockWallet = Wallet(
    id: 'wallet_1',
    userId: 'user_1',
    balance: 1000.0,
    bonusBalance: 100.0,
    currency: 'INR',
    isActive: true,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
  );

  // Mock Bets
  static final List<Bet> mockBets = [
    Bet(
      id: 'bet_1',
      userId: 'user_1',
      type: BetType.single,
      status: BetStatus.won,
      totalStake: 100.0,
      potentialWin: 210.0,
      actualWin: 210.0,
      placedAt: DateTime.now().subtract(const Duration(days: 3)),
      settledAt: DateTime.now().subtract(const Duration(days: 2)),
      selections: [
        BetSelection(
          id: 'selection_1',
          betId: 'bet_1',
          matchId: 'match_1',
          marketId: 'market_1',
          outcomeId: 'outcome_1',
          odds: 2.10,
          status: SelectionStatus.won,
          matchName: 'Liverpool vs Arsenal',
          marketName: 'Match Winner',
          outcomeName: 'Liverpool',
        ),
      ],
    ),
    Bet(
      id: 'bet_2',
      userId: 'user_1',
      type: BetType.multiple,
      status: BetStatus.lost,
      totalStake: 50.0,
      potentialWin: 320.0,
      placedAt: DateTime.now().subtract(const Duration(days: 5)),
      settledAt: DateTime.now().subtract(const Duration(days: 4)),
      selections: [
        BetSelection(
          id: 'selection_2',
          betId: 'bet_2',
          matchId: 'match_2',
          marketId: 'market_1',
          outcomeId: 'outcome_2',
          odds: 2.40,
          status: SelectionStatus.won,
          matchName: 'Chelsea vs Arsenal',
          marketName: 'Match Winner',
          outcomeName: 'Chelsea',
        ),
        BetSelection(
          id: 'selection_3',
          betId: 'bet_2',
          matchId: 'match_3',
          marketId: 'market_1',
          outcomeId: 'outcome_3',
          odds: 1.80,
          status: SelectionStatus.lost,
          matchName: 'Mumbai Indians vs CSK',
          marketName: 'Match Winner',
          outcomeName: 'Mumbai Indians',
        ),
      ],
    ),
  ];

  // Get Methods
  Future<List<Sport>> getSports() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return mockSports;
  }

  Future<List<Match>> getFeaturedMatches() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return mockMatches.where((m) => m.isFeatured).toList();
  }

  Future<List<Match>> getLiveMatches() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return mockMatches.where((m) => m.status == MatchStatus.live).toList();
  }

  Future<List<Match>> getUpcomingMatches(String? sportId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    var matches = mockMatches.where((m) => m.status == MatchStatus.scheduled);
    if (sportId != null) {
      matches = matches.where((m) => m.sportId == sportId);
    }
    return matches.toList();
  }

  Future<Wallet> getUserWallet(String userId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return mockWallet;
  }

  Future<List<Bet>> getUserBets(String userId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return mockBets;
  }

  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (email == 'test@user.com' && password == 'test123') {
      return mockUser;
    } else if (email == 'admin@sportsbet.com' && password == 'admin123') {
      return mockUser.copyWith(
        email: 'admin@sportsbet.com',
        role: UserRole.admin,
        firstName: 'Admin',
        lastName: 'User',
      );
    }
    
    throw Exception('Invalid email or password');
  }

  Future<User> register({
    required String email,
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String country,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    
    return User(
      id: 'user_new_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      country: country,
      isVerified: false,
      kycStatus: KycStatus.pending,
      isActive: true,
      role: UserRole.user,
      createdAt: DateTime.now(),
    );
  }
}