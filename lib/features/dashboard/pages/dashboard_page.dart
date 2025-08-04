import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';
import '../../../core/widgets/stats_card.dart';
import '../../../core/widgets/referral_code_card.dart';
import '../providers/dashboard_provider.dart';
import '../../auth/providers/auth_provider.dart';
import '../widgets/rewards_section.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // Load dashboard data when page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProvider.notifier).loadDashboardData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.read(dashboardProvider.notifier).refreshData();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          user != null ? NetworkImage(user.avatarUrl) : null,
                      child: user == null
                          ? const Icon(LucideIcons.user, size: 30)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back,',
                            style: AppTypography.body1.copyWith(
                              color: AppColors.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                          Text(
                            user?.name ?? 'Intern',
                            style: AppTypography.h2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement notifications
                      },
                      icon: const Icon(LucideIcons.bell),
                      color: AppColors.onSurface,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Stats Cards
                Text(
                  'Your Progress',
                  style: AppTypography.h2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                ),

                const SizedBox(height: 16),

                if (dashboardState.isLoading)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                    children: [
                      StatsCard(
                        title: 'Total Raised',
                        value: '₹0',
                        icon: LucideIcons.trendingUp,
                        color: AppColors.primary,
                        isLoading: true,
                      ),
                      StatsCard(
                        title: 'Monthly Target',
                        value: '0%',
                        icon: LucideIcons.flag,
                        color: AppColors.secondary,
                        isLoading: true,
                      ),
                      StatsCard(
                        title: 'Referrals',
                        value: '0',
                        icon: LucideIcons.users,
                        color: AppColors.accent,
                        isLoading: true,
                      ),
                      StatsCard(
                        title: 'Achievements',
                        value: '0',
                        icon: LucideIcons.trophy,
                        color: AppColors.warning,
                        isLoading: true,
                      ),
                    ],
                  )
                else
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                    children: [
                      StatsCard(
                        title: 'Total Raised',
                        value:
                            '₹${dashboardState.totalDonations.toStringAsFixed(0)}',
                        icon: LucideIcons.trendingUp,
                        color: AppColors.primary,
                      ),
                      StatsCard(
                        title: 'Monthly Target',
                        value:
                            '${(dashboardState.monthlyProgress * 100).toStringAsFixed(0)}%',
                        icon: LucideIcons.flag,
                        color: AppColors.secondary,
                      ),
                      StatsCard(
                        title: 'Referrals',
                        value: dashboardState.referralsCount.toString(),
                        icon: LucideIcons.users,
                        color: AppColors.accent,
                      ),
                      StatsCard(
                        title: 'Achievements',
                        value: dashboardState.achievements.length.toString(),
                        icon: LucideIcons.trophy,
                        color: AppColors.warning,
                      ),
                    ],
                  ),

                const SizedBox(height: 32),

                // Referral Code Card
                ReferralCodeCard(
                  referralCode: user?.referralCode ?? 'INTERN2025',
                  onShare: () {
                    // Implement share functionality
                  },
                ),

                const SizedBox(height: 32),

                // Rewards Section
                if (!dashboardState.isLoading &&
                    dashboardState.achievements.isNotEmpty)
                  RewardsSection(
                    achievements: dashboardState.achievements,
                  ),

                const SizedBox(height: 32),

                // Quick Actions
                Text(
                  'Quick Actions',
                  style: AppTypography.h2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Implement share functionality
                        },
                        icon: const Icon(LucideIcons.share2, size: 18),
                        label: const Text('Share Referral'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Navigate to history page
                        },
                        icon: const Icon(LucideIcons.history, size: 18),
                        label: const Text('View History'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
