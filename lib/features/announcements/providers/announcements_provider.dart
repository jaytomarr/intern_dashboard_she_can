import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/announcement_model.dart';
import '../../../core/constants/mock_data.dart';

// Announcements Provider
final announcementsProvider = FutureProvider<List<AnnouncementModel>>((ref) async {
  // Simulate API call delay
  await Future.delayed(const Duration(seconds: 1));
  return MockData.getAnnouncementModels();
});

// Unread Announcements Count Provider
final unreadAnnouncementsCountProvider = Provider<int>((ref) {
  final announcementsAsync = ref.watch(announcementsProvider);
  
  return announcementsAsync.when(
    data: (announcements) {
      return announcements.where((announcement) => !announcement.isRead).length;
    },
    loading: () => 0,
    error: (_, __) => 0,
  );
});

// Filtered Announcements Provider
final filteredAnnouncementsProvider = FutureProvider.family<List<AnnouncementModel>, String>((ref, filter) async {
  final announcements = await ref.watch(announcementsProvider.future);
  
  switch (filter) {
    case 'all':
      return announcements;
    case 'unread':
      return announcements.where((announcement) => !announcement.isRead).toList();
    case 'success':
      return announcements.where((announcement) => announcement.type == 'success').toList();
    case 'warning':
      return announcements.where((announcement) => announcement.type == 'warning').toList();
    case 'info':
      return announcements.where((announcement) => announcement.type == 'info').toList();
    default:
      return announcements;
  }
}); 