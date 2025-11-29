import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/app_providers.dart';
import '../../betting/widgets/bet_slip_fab.dart';

class MainScreen extends ConsumerWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    
    return Scaffold(
      body: child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          BottomNavigationBar(
            currentIndex: selectedTab,
            onTap: (index) {
              ref.read(selectedTabProvider.notifier).state = index;
              switch (index) {
                case 0:
                  context.go('/home');
                  break;
                case 1:
                  context.go('/sports');
                  break;
                case 2:
                  context.go('/live');
                  break;
                case 3:
                  context.go('/profile');
                  break;
              }
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_outlined),
                activeIcon: Icon(Icons.sports),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline),
                activeIcon: Icon(Icons.play_circle),
                label: 'Live',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: const BetSlipFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}