import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/dimensions.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.md,
            vertical: AppDimensions.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              _NavItem(
                icon: LucideIcons.home,
                label: 'Dashboard',
                isActive: currentLocation == '/dashboard',
                onTap: () => context.go('/dashboard'),
              ),
              _NavItem(
                icon: LucideIcons.trophy,
                label: 'Leaderboard',
                isActive: currentLocation == '/leaderboard',
                onTap: () => context.go('/leaderboard'),
              ),
              _NavItem(
                icon: LucideIcons.bell,
                label: 'Announcements',
                isActive: currentLocation == '/announcements',
                onTap: () => context.go('/announcements'),
              ),
              _NavItem(
                icon: LucideIcons.user,
                label: 'Profile',
                isActive: currentLocation == '/profile',
                onTap: () => context.go('/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
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
          color: isActive
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive
                  ? AppColors.primary
                  : AppColors.onSurface.withValues(alpha: 0.6),
              size: 24,
            ),
            if (isActive) ...[
              const SizedBox(height: AppDimensions.xs),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
