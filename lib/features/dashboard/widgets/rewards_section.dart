import 'package:flutter/material.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/dimensions.dart';

class RewardsSection extends StatelessWidget {
  final List<dynamic> achievements;

  const RewardsSection({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Achievements',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
        ),
        const SizedBox(height: AppDimensions.md),

        // Show message if no achievements
        if (achievements.isEmpty)
          Container(
            padding: const EdgeInsets.all(AppDimensions.lg),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
              border: Border.all(
                color: AppColors.onSurface.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.emoji_events_outlined,
                  size: 48,
                  color: AppColors.onSurface.withValues(alpha: 0.3),
                ),
                const SizedBox(height: AppDimensions.md),
                Text(
                  'No achievements yet',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.onSurface.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: AppDimensions.sm),
                Text(
                  'Start donating to unlock achievements!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.onSurface.withValues(alpha: 0.5),
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];

              // Add type checking and safe access
              if (achievement is! Map<String, dynamic>) {
                return const SizedBox.shrink(); // Skip invalid items
              }

              final title =
                  achievement['title']?.toString() ?? 'Unknown Achievement';
              final description = achievement['description']?.toString() ??
                  'No description available';
              final icon = achievement['icon']?.toString() ?? '🏆';
              final isUnlocked = achievement['unlocked'] == true;

              return Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.sm),
                child: AchievementCard(
                  title: title,
                  description: description,
                  icon: icon,
                  isUnlocked: isUnlocked,
                ),
              );
            },
          ),
      ],
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final bool isUnlocked;

  const AchievementCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isUnlocked
              ? [
                  AppColors.success.withValues(alpha: 0.1),
                  AppColors.success.withValues(alpha: 0.05),
                ]
              : [
                  AppColors.onSurface.withValues(alpha: 0.05),
                  AppColors.onSurface.withValues(alpha: 0.02),
                ],
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(
          color: isUnlocked
              ? AppColors.success.withValues(alpha: 0.3)
              : AppColors.onSurface.withValues(alpha: 0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? AppColors.success.withValues(alpha: 0.2)
                  : AppColors.onSurface.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(
                  fontSize: 24,
                  color: isUnlocked
                      ? AppColors.success
                      : AppColors.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.md),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isUnlocked
                            ? AppColors.onSurface
                            : AppColors.onSurface.withValues(alpha: 0.5),
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppDimensions.xs),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isUnlocked
                            ? AppColors.onSurface.withValues(alpha: 0.7)
                            : AppColors.onSurface.withValues(alpha: 0.3),
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Unlocked badge
          if (isUnlocked)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.sm,
                vertical: AppDimensions.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
              child: Text(
                'Unlocked',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
