import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/models/leaderboard_model.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';
import 'rank_badge.dart';

class LeaderboardItem extends StatelessWidget {
  final LeaderboardModel user;
  final bool isCurrentUser;
  final VoidCallback? onTap;

  const LeaderboardItem({
    super.key,
    required this.user,
    this.isCurrentUser = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isCurrentUser
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: isCurrentUser
              ? Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3), width: 1)
              : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.onSurface.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Rank Badge
            RankBadge(rank: user.rank),
            const SizedBox(width: 16),

            // Avatar
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.1),
                border: Border.all(
                  color: isCurrentUser
                      ? AppColors.primary
                      : AppColors.onSurface.withValues(alpha: 0.1),
                  width: 2,
                ),
              ),
              child: Icon(
                LucideIcons.user,
                size: 24,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 16),

            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        user.name,
                        style: AppTypography.body1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isCurrentUser
                              ? AppColors.primary
                              : AppColors.onSurface,
                        ),
                      ),
                      if (isCurrentUser) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'You',
                            style: AppTypography.caption.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${user.totalDonations.toStringAsFixed(0)} raised',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            // Trophy for top 3
            if (user.rank <= 3) ...[
              Icon(
                _getTrophyIcon(user.rank),
                color: _getTrophyColor(user.rank),
                size: 24,
              ),
            ] else ...[
              Text(
                '#${user.rank}',
                style: AppTypography.body1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 300)).slideX(
        begin: 0.2, end: 0, duration: const Duration(milliseconds: 300));
  }

  IconData _getTrophyIcon(int rank) {
    switch (rank) {
      case 1:
        return LucideIcons.trophy;
      case 2:
        return LucideIcons.medal;
      case 3:
        return LucideIcons.award;
      default:
        return LucideIcons.trophy;
    }
  }

  Color _getTrophyColor(int rank) {
    switch (rank) {
      case 1:
        return AppColors.gold;
      case 2:
        return AppColors.silver;
      case 3:
        return AppColors.bronze;
      default:
        return AppColors.onSurface.withValues(alpha: 0.5);
    }
  }
}
