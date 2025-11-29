import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import '../constants/app_constants.dart';

class ConvexService {
  static final ConvexService _instance = ConvexService._internal();
  factory ConvexService() => _instance;
  ConvexService._internal();

  late final String _baseUrl;
  late final String _apiKey;
  WebSocketChannel? _wsChannel;
  
  void initialize({required String convexUrl, required String apiKey}) {
    _baseUrl = convexUrl;
    _apiKey = apiKey;
  }

  // Query function (read data)
  Future<T> query<T>(String functionName, Map<String, dynamic> args) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/query'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'path': functionName,
          'args': args,
          'format': 'json',
        }),
      ).timeout(AppConstants.apiTimeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data['value'] as T;
        } else {
          throw ConvexException('Query failed: ${data['errorMessage']}');
        }
      } else {
        throw ConvexException('Query failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw ConvexException('Query error: $e');
    }
  }

  // Mutation function (write data)
  Future<T> mutation<T>(String functionName, Map<String, dynamic> args) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/mutation'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'path': functionName,
          'args': args,
          'format': 'json',
        }),
      ).timeout(AppConstants.apiTimeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data['value'] as T;
        } else {
          throw ConvexException('Mutation failed: ${data['errorMessage']}');
        }
      } else {
        throw ConvexException('Mutation failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw ConvexException('Mutation error: $e');
    }
  }

  // Action function (server-side logic)
  Future<T> action<T>(String functionName, Map<String, dynamic> args) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/action'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'path': functionName,
          'args': args,
          'format': 'json',
        }),
      ).timeout(AppConstants.apiTimeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data['value'] as T;
        } else {
          throw ConvexException('Action failed: ${data['errorMessage']}');
        }
      } else {
        throw ConvexException('Action failed: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw ConvexException('Action error: $e');
    }
  }

  // Subscribe to real-time updates
  Stream<T> subscribe<T>(String functionName, Map<String, dynamic> args) async* {
    try {
      _wsChannel = WebSocketChannel.connect(
        Uri.parse('$_baseUrl/ws'),
      );

      _wsChannel!.sink.add(jsonEncode({
        'type': 'subscribe',
        'function': functionName,
        'args': args,
        'auth': _apiKey,
      }));

      await for (final message in _wsChannel!.stream) {
        final data = jsonDecode(message);
        if (data['type'] == 'update') {
          yield data['result'] as T;
        }
      }
    } catch (e) {
      throw ConvexException('Subscription error: $e');
    }
  }

  void closeSubscription() {
    _wsChannel?.sink.close();
    _wsChannel = null;
  }

  // Specific query methods
  Future<List<Map<String, dynamic>>> getSports() {
    return query<List<Map<String, dynamic>>>('sports:list', {});
  }

  Future<List<Map<String, dynamic>>> getLeaguesBySport(String sportId) {
    return query<List<Map<String, dynamic>>>('leagues:listBySport', {'sportId': sportId});
  }

  Future<List<Map<String, dynamic>>> getMatchesByLeague(String leagueId) {
    return query<List<Map<String, dynamic>>>('matches:listByLeague', {'leagueId': leagueId});
  }

  Future<List<Map<String, dynamic>>> getMarketsByMatch(String matchId) {
    return query<List<Map<String, dynamic>>>('markets:listByMatch', {'matchId': matchId});
  }

  Future<List<Map<String, dynamic>>> getOutcomesByMarket(String marketId) {
    return query<List<Map<String, dynamic>>>('outcomes:listByMarket', {'marketId': marketId});
  }

  Future<Map<String, dynamic>> getUserWallet(String userId) {
    return query<Map<String, dynamic>>('wallets:getByUser', {'userId': userId});
  }

  Future<List<Map<String, dynamic>>> getUserBets(String userId, {int? limit}) {
    return query<List<Map<String, dynamic>>>('bets:listByUser', {
      'userId': userId,
      if (limit != null) 'limit': limit,
    });
  }

  Future<Map<String, dynamic>> placeBet(Map<String, dynamic> betData) {
    return mutation<Map<String, dynamic>>('bets:place', betData);
  }

  Future<Map<String, dynamic>> updateOdds(String outcomeId, double newOdds) {
    return mutation<Map<String, dynamic>>('outcomes:updateOdds', {
      'outcomeId': outcomeId,
      'odds': newOdds,
    });
  }

  Future<Map<String, dynamic>> createMatch(Map<String, dynamic> matchData) {
    return mutation<Map<String, dynamic>>('matches:create', matchData);
  }

  Future<Map<String, dynamic>> updateMatchStatus(String matchId, String status) {
    return mutation<Map<String, dynamic>>('matches:updateStatus', {
      'matchId': matchId,
      'status': status,
    });
  }

  // Real-time subscriptions
  Stream<List<Map<String, dynamic>>> subscribeToLiveOdds(String matchId) {
    return subscribe<List<Map<String, dynamic>>>('odds:subscribeLive', {'matchId': matchId});
  }

  Stream<Map<String, dynamic>> subscribeToMatchEvents(String matchId) {
    return subscribe<Map<String, dynamic>>('matches:subscribeEvents', {'matchId': matchId});
  }
}

class ConvexException implements Exception {
  final String message;
  ConvexException(this.message);

  @override
  String toString() => 'ConvexException: $message';
}