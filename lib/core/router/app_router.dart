import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/forgot_password_screen.dart';
import '../../features/home/screens/main_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/sports/screens/sports_screen.dart';
import '../../features/sports/screens/sport_detail_screen.dart';
import '../../features/matches/screens/match_detail_screen.dart';
import '../../features/betting/screens/bet_slip_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/bet_history_screen.dart';
import '../../features/profile/screens/wallet_screen.dart';
import '../../features/live/screens/live_screen.dart';
import '../providers/app_providers.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final currentUser = ref.watch(currentUserProvider);
  
  return GoRouter(
    initialLocation: currentUser != null ? '/home' : '/login',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuthenticated = currentUser != null;
      final isAuthRoute = ['/login', '/register', '/forgot-password'].contains(state.matchedLocation);
      
      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }
      
      if (isAuthenticated && isAuthRoute) {
        return '/home';
      }
      
      return null;
    },
    routes: [
      // Auth Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      
      // Main App Routes
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/sports',
            name: 'sports',
            builder: (context, state) => const SportsScreen(),
            routes: [
              GoRoute(
                path: ':sportId',
                name: 'sport-detail',
                builder: (context, state) {
                  final sportId = state.pathParameters['sportId']!;
                  return SportDetailScreen(sportId: sportId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/live',
            name: 'live',
            builder: (context, state) => const LiveScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'bet-history',
                name: 'bet-history',
                builder: (context, state) => const BetHistoryScreen(),
              ),
              GoRoute(
                path: 'wallet',
                name: 'wallet',
                builder: (context, state) => const WalletScreen(),
              ),
            ],
          ),
        ],
      ),
      
      // Match Detail (can be accessed from anywhere)
      GoRoute(
        path: '/match/:matchId',
        name: 'match-detail',
        builder: (context, state) {
          final matchId = state.pathParameters['matchId']!;
          return MatchDetailScreen(matchId: matchId);
        },
      ),
      
      // Bet Slip
      GoRoute(
        path: '/bet-slip',
        name: 'bet-slip',
        builder: (context, state) => const BetSlipScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

// Navigation helper
class AppNavigation {
  static void toLogin(BuildContext context) => context.go('/login');
  static void toRegister(BuildContext context) => context.go('/register');
  static void toForgotPassword(BuildContext context) => context.go('/forgot-password');
  static void toHome(BuildContext context) => context.go('/home');
  static void toSports(BuildContext context) => context.go('/sports');
  static void toSportDetail(BuildContext context, String sportId) => 
      context.go('/sports/$sportId');
  static void toLive(BuildContext context) => context.go('/live');
  static void toProfile(BuildContext context) => context.go('/profile');
  static void toBetHistory(BuildContext context) => context.go('/profile/bet-history');
  static void toWallet(BuildContext context) => context.go('/profile/wallet');
  static void toMatchDetail(BuildContext context, String matchId) => 
      context.go('/match/$matchId');
  static void toBetSlip(BuildContext context) => context.go('/bet-slip');
  
  static void pop(BuildContext context) => context.pop();
}