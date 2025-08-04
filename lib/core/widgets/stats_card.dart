import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../app/theme/colors.dart';
import '../../app/theme/typography.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final bool isLoading;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ),
                const Spacer(),
                if (onTap != null)
                  Icon(
                    LucideIcons.chevronRight,
                    color: AppColors.onSurface.withValues(alpha: 0.5),
                    size: 16,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (isLoading)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.onSurface.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 24,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColors.onSurface.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ).animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: const Duration(seconds: 2))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: AppTypography.h2.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ).animate().fadeIn(duration: const Duration(milliseconds: 300))
                .slideY(begin: 0.2, end: 0, duration: const Duration(milliseconds: 300)),
          ],
        ),
      ),
    ).animate().scale(
      begin: const Offset(0.95, 0.95),
      end: const Offset(1, 1),
      duration: const Duration(milliseconds: 200),
    );
  }
} 