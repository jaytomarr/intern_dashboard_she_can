import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';

class RankBadge extends StatelessWidget {
  final int rank;

  const RankBadge({
    super.key,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    if (rank <= 3) {
      return _buildTopThreeBadge();
    } else {
      return _buildRegularBadge();
    }
  }

  Widget _buildTopThreeBadge() {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (rank) {
      case 1:
        backgroundColor = AppColors.gold;
        textColor = AppColors.white;
        icon = LucideIcons.crown;
        break;
      case 2:
        backgroundColor = AppColors.silver;
        textColor = AppColors.white;
        icon = LucideIcons.star;
        break;
      case 3:
        backgroundColor = AppColors.bronze;
        textColor = AppColors.white;
        icon = LucideIcons.award;
        break;
      default:
        backgroundColor = AppColors.primary;
        textColor = AppColors.white;
        icon = LucideIcons.star;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: textColor,
        size: 16,
      ),
    );
  }

  Widget _buildRegularBadge() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.onSurface.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.onSurface.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          rank.toString(),
          style: AppTypography.caption.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
      ),
    );
  }
}
