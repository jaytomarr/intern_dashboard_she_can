import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/typography.dart';
import '../providers/announcements_provider.dart';
import '../widgets/announcement_card.dart';

class AnnouncementsPage extends ConsumerStatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  ConsumerState<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends ConsumerState<AnnouncementsPage> {
  @override
  Widget build(BuildContext context) {
    final announcementsAsync = ref.watch(announcementsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: announcementsAsync.when(
          data: (announcements) => Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      'Announcements',
                      style: AppTypography.h1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ref.invalidate(announcementsProvider);
                      },
                      icon: const Icon(LucideIcons.refreshCw),
                      color: AppColors.onSurface,
                    ),
                  ],
                ),
              ),
              
              // Announcements List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(announcementsProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: announcements.length,
                    itemBuilder: (context, index) {
                      final announcement = announcements[index];
                      return AnnouncementCard(
                        announcement: announcement,
                        isLast: index == announcements.length - 1,
                        onTap: () {
                          // Mark as read and show details
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Marked "${announcement.title}" as read'),
                              backgroundColor: AppColors.success,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          );
                        },
                      );
                    },
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
                  'Failed to load announcements',
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