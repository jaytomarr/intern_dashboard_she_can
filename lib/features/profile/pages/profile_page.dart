import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/dimensions.dart';
import '../../../core/widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _logout() {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          ),
          title: Text(
            'Logout',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement logout logic
                context.go('/login');
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusLg),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: const Icon(
                          LucideIcons.user,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.lg),
                      Text(
                        'John Doe',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: AppDimensions.xs),
                      Text(
                        'john.doe@example.com',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppDimensions.xl),

                // Settings Section
                Container(
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.onSurface.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppDimensions.lg),

                      // Notifications
                      _SettingsItem(
                        icon: LucideIcons.bell,
                        title: 'Notifications',
                        subtitle: 'Manage notification preferences',
                        onTap: () {
                          // Navigate to notifications settings
                        },
                      ),

                      const SizedBox(height: AppDimensions.md),

                      // Privacy
                      _SettingsItem(
                        icon: LucideIcons.shield,
                        title: 'Privacy',
                        subtitle: 'Manage your privacy settings',
                        onTap: () {
                          // Navigate to privacy settings
                        },
                      ),

                      const SizedBox(height: AppDimensions.md),

                      // Help & Support
                      _SettingsItem(
                        icon: LucideIcons.helpCircle,
                        title: 'Help & Support',
                        subtitle: 'Get help and contact support',
                        onTap: () {
                          // Navigate to help page
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppDimensions.xl),

                // Account Section
                Container(
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.onSurface.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: AppDimensions.lg),

                      // Edit Profile
                      _SettingsItem(
                        icon: LucideIcons.edit,
                        title: 'Edit Profile',
                        subtitle: 'Update your personal information',
                        onTap: () {
                          // Navigate to edit profile page
                        },
                      ),

                      const SizedBox(height: AppDimensions.md),

                      // Change Password
                      _SettingsItem(
                        icon: LucideIcons.lock,
                        title: 'Change Password',
                        subtitle: 'Update your password',
                        onTap: () {
                          // Navigate to change password page
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppDimensions.xl),

                // Logout Button
                CustomButton(
                  text: 'Logout',
                  onPressed: _logout,
                  icon: LucideIcons.logOut,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                ),

                const SizedBox(height: AppDimensions.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.md,
          vertical: AppDimensions.sm,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.sm),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: AppDimensions.xs),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurface.withValues(alpha: 0.6),
                        ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                LucideIcons.chevronRight,
                color: AppColors.onSurface.withValues(alpha: 0.4),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
