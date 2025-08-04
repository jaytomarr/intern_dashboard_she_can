import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/models/announcement_model.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';

class AnnouncementCard extends StatelessWidget {
  final AnnouncementModel announcement;
  final VoidCallback? onTap;
  final bool isLast;

  const AnnouncementCard({
    super.key,
    required this.announcement,
    this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getTypeColor(announcement.type),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _getTypeColor(announcement.type)
                            .withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 80,
                    color: AppColors.onSurface.withValues(alpha: 0.1),
                  ),
              ],
            ),
            const SizedBox(width: 16),

            // Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        _getTypeColor(announcement.type).withValues(alpha: 0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.onSurface.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _getTypeIcon(announcement.type),
                          color: _getTypeColor(announcement.type),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            announcement.title,
                            style: AppTypography.body1.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ),
                        if (!announcement.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      announcement.content,
                      style: AppTypography.body1.copyWith(
                        color: AppColors.onSurface.withValues(alpha: 0.7),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          LucideIcons.clock,
                          size: 14,
                          color: AppColors.onSurface.withValues(alpha: 0.5),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(announcement.date),
                          style: AppTypography.caption.copyWith(
                            color: AppColors.onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getTypeColor(announcement.type)
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            announcement.type.toUpperCase(),
                            style: AppTypography.caption.copyWith(
                              color: _getTypeColor(announcement.type),
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 400)).slideX(
        begin: 0.3, end: 0, duration: const Duration(milliseconds: 400));
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'success':
        return AppColors.success;
      case 'warning':
        return AppColors.warning;
      case 'error':
        return AppColors.error;
      case 'info':
      default:
        return AppColors.primary;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'success':
        return LucideIcons.checkCircle;
      case 'warning':
        return LucideIcons.alertTriangle;
      case 'error':
        return LucideIcons.xCircle;
      case 'info':
      default:
        return LucideIcons.info;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
