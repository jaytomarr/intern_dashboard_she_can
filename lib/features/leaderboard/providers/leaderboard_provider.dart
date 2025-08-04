import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/leaderboard_model.dart';
import '../../../core/constants/mock_data.dart';

// Leaderboard Provider
final leaderboardProvider = FutureProvider<List<LeaderboardModel>>((ref) async {
  // Simulate API call delay
  await Future.delayed(const Duration(seconds: 1));
  return MockData.getLeaderboardModels();
});

// Filtered Leaderboard Provider
final filteredLeaderboardProvider = FutureProvider.family<List<LeaderboardModel>, String>((ref, filter) async {
  final leaderboard = await ref.watch(leaderboardProvider.future);
  
  // In a real app, you would filter based on the filter parameter
  // For now, we'll return all data
  return leaderboard;
});

// Current User Rank Provider
final currentUserRankProvider = Provider<int>((ref) {
  final leaderboardAsync = ref.watch(leaderboardProvider);
  
  return leaderboardAsync.when(
    data: (leaderboard) {
      final currentUser = leaderboard.firstWhere(
        (user) => user.name == 'You',
        orElse: () => const LeaderboardModel(
          userId: 'current',
          name: 'You',
          totalDonations: 0,
          rank: 0,
          avatarUrl: '',
        ),
      );
      return currentUser.rank;
    },
    loading: () => 0,
    error: (_, __) => 0,
  );
}); 