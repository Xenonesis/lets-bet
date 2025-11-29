import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/router/app_router.dart';
import '../widgets/profile_menu_item.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final themeMode = ref.watch(themeModeProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Text(
                      user?.firstName.substring(0, 1).toUpperCase() ?? 'U',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user?.email ?? '',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: user?.isVerified == true ? Colors.green : Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      user?.isVerified == true ? 'Verified' : 'Unverified',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Menu Items
            Card(
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.account_balance_wallet,
                    title: 'Wallet',
                    subtitle: 'Manage your funds',
                    onTap: () => AppNavigation.toWallet(context),
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.history,
                    title: 'Bet History',
                    subtitle: 'View your betting history',
                    onTap: () => AppNavigation.toBetHistory(context),
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: 'Account Settings',
                    subtitle: 'Manage your account',
                    onTap: () {
                      // TODO: Navigate to account settings
                    },
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.security,
                    title: 'Security',
                    subtitle: 'Password & security settings',
                    onTap: () {
                      // TODO: Navigate to security settings
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // App Settings
            Card(
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.palette_outlined,
                    title: 'Theme',
                    subtitle: 'Light, Dark, or System',
                    trailing: DropdownButton<String>(
                      value: themeMode,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 'light', child: Text('Light')),
                        DropdownMenuItem(value: 'dark', child: Text('Dark')),
                        DropdownMenuItem(value: 'system', child: Text('System')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          ref.read(themeModeProvider.notifier).state = value;
                        }
                      },
                    ),
                    onTap: null,
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Manage notifications',
                    onTap: () {
                      // TODO: Navigate to notification settings
                    },
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'Change app language',
                    onTap: () {
                      // TODO: Navigate to language settings
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Support & Legal
            Card(
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.help_outlined,
                    title: 'Help & Support',
                    subtitle: 'Get help and support',
                    onTap: () {
                      // TODO: Navigate to help
                    },
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    subtitle: 'Read our privacy policy',
                    onTap: () {
                      // TODO: Navigate to privacy policy
                    },
                  ),
                  
                  const Divider(height: 1),
                  
                  ProfileMenuItem(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    subtitle: 'Read terms and conditions',
                    onTap: () {
                      // TODO: Navigate to terms
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                  
                  if (shouldLogout == true) {
                    await ref.read(currentUserProvider.notifier).logout();
                    if (context.mounted) {
                      AppNavigation.toLogin(context);
                    }
                  }
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}