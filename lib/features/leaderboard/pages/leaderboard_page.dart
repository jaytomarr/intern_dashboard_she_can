import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';
import '../../../core/models/leaderboard_model.dart';
import '../providers/leaderboard_provider.dart';
import '../widgets/leaderboard_item.dart';
import '../widgets/rank_badge.dart';

class LeaderboardPage extends ConsumerStatefulWidget {
  const LeaderboardPage({super.key});

  @override
  ConsumerState<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends ConsumerState<LeaderboardPage> {
  String _selectedFilter = 'All-time';

  @override
  Widget build(BuildContext context) {
    final leaderboardAsync = ref.watch(leaderboardProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: leaderboardAsync.when(
          data: (leaderboard) => Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Leaderboard',
                          style: AppTypography.h1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.onSurface,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ref.invalidate(leaderboardProvider);
                          },
                          icon: const Icon(LucideIcons.refreshCw),
                          color: AppColors.onSurface,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Filter Buttons
                    Row(
                      children: [
                        _FilterButton(
                          text: 'Weekly',
                          isSelected: _selectedFilter == 'Weekly',
                          onTap: () =>
                              setState(() => _selectedFilter = 'Weekly'),
                        ),
                        const SizedBox(width: 12),
                        _FilterButton(
                          text: 'Monthly',
                          isSelected: _selectedFilter == 'Monthly',
                          onTap: () =>
                              setState(() => _selectedFilter = 'Monthly'),
                        ),
                        const SizedBox(width: 12),
                        _FilterButton(
                          text: 'All-time',
                          isSelected: _selectedFilter == 'All-time',
                          onTap: () =>
                              setState(() => _selectedFilter = 'All-time'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Podium Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 2nd Place
                    if (leaderboard.length > 1)
                      Expanded(
                        child: _PodiumItem(
                          user: leaderboard[1],
                          height: 120,
                        ),
                      ),

                    const SizedBox(width: 12),

                    // 1st Place
                    if (leaderboard.isNotEmpty)
                      Expanded(
                        child: _PodiumItem(
                          user: leaderboard[0],
                          height: 150,
                          isWinner: true,
                        ),
                      ),

                    const SizedBox(width: 12),

                    // 3rd Place
                    if (leaderboard.length > 2)
                      Expanded(
                        child: _PodiumItem(
                          user: leaderboard[2],
                          height: 90,
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Leaderboard List
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Other Rankings',
                        style: AppTypography.h2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: leaderboard.length > 3
                              ? leaderboard.length - 3
                              : 0,
                          itemBuilder: (context, index) {
                            final user = leaderboard[index + 3];
                            return LeaderboardItem(
                              user: user,
                              isCurrentUser: user.name == 'You',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.alertCircle,
                  size: 48,
                  color: AppColors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load leaderboard',
                  style: AppTypography.h2.copyWith(
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: AppTypography.body1.copyWith(
                    color: AppColors.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.onSurface.withValues(alpha: 0.2),
          ),
        ),
        child: Text(
          text,
          style: AppTypography.body1.copyWith(
            color: isSelected ? Colors.white : AppColors.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _PodiumItem extends StatelessWidget {
  final LeaderboardModel user;
  final double height;
  final bool isWinner;

  const _PodiumItem({
    required this.user,
    required this.height,
    this.isWinner = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar and Rank Badge
        Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              child: Icon(
                LucideIcons.user,
                size: 30,
                color: AppColors.primary,
              ),
            ),
            Positioned(
              top: -5,
              right: -5,
              child: RankBadge(rank: user.rank),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Name
        Text(
          user.name,
          style: AppTypography.body1.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.onSurface,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 4),

        // Amount
        Text(
          '₹${user.totalDonations.toStringAsFixed(0)}',
          style: AppTypography.caption.copyWith(
            color: AppColors.onSurface.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 16),

        // Podium Base
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isWinner
                  ? [AppColors.accent, AppColors.accent.withValues(alpha: 0.8)]
                  : [
                      AppColors.onSurface.withValues(alpha: 0.1),
                      AppColors.onSurface.withValues(alpha: 0.05),
                    ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '#${user.rank}',
              style: AppTypography.h2.copyWith(
                color: isWinner
                    ? Colors.white
                    : AppColors.onSurface.withValues(alpha: 0.5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
