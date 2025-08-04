import '../models/user_model.dart';
import '../models/donation_model.dart';
import '../models/leaderboard_model.dart';
import '../models/announcement_model.dart';

class MockData {
  // Dashboard Mock Data
  static final Map<String, dynamic> dashboardData = {
    'totalDonations': 5000.0,
    'monthlyTarget': 10000.0,
    'referralsCount': 12,
    'referralCode': 'INTERN2025',
    'rewards': [
      {
        'title': 'First Donation',
        'description': 'Complete your first donation',
        'icon': '🎯',
        'unlocked': true,
      },
      {
        'title': 'Week Warrior',
        'description': 'Donate for 7 consecutive days',
        'icon': '🔥',
        'unlocked': true,
      },
      {
        'title': '₹1K Milestone',
        'description': 'Reach ₹1,000 in total donations',
        'icon': '💰',
        'unlocked': true,
      },
      {
        'title': '₹5K Achiever',
        'description': 'Reach ₹5,000 in total donations',
        'icon': '🏆',
        'unlocked': true,
      },
      {
        'title': '₹10K Master',
        'description': 'Reach ₹10,000 in total donations',
        'icon': '👑',
        'unlocked': false,
      },
      {
        'title': 'Referral King',
        'description': 'Get 10 successful referrals',
        'icon': '👥',
        'unlocked': false,
      },
      {
        'title': 'Monthly Champion',
        'description': 'Complete monthly target',
        'icon': '⭐',
        'unlocked': false,
      },
      {
        'title': 'Consistency Hero',
        'description': 'Donate for 30 consecutive days',
        'icon': '💪',
        'unlocked': false,
      },
    ],
    'monthlyProgress': 0.5, // 50% of monthly target
  };

  // Leaderboard Mock Data
  static final List<Map<String, dynamic>> leaderboardData = [
    {'name': 'Priya Sharma', 'donations': 8500, 'rank': 1, 'avatarUrl': ''},
    {'name': 'Rahul Kumar', 'donations': 7200, 'rank': 2, 'avatarUrl': ''},
    {'name': 'Anjali Singh', 'donations': 6800, 'rank': 3, 'avatarUrl': ''},
    {'name': 'You', 'donations': 5000, 'rank': 4, 'avatarUrl': ''},
    {'name': 'Vikram Patel', 'donations': 4500, 'rank': 5, 'avatarUrl': ''},
    {'name': 'Meera Reddy', 'donations': 4200, 'rank': 6, 'avatarUrl': ''},
    {'name': 'Arjun Malhotra', 'donations': 3800, 'rank': 7, 'avatarUrl': ''},
    {'name': 'Zara Khan', 'donations': 3500, 'rank': 8, 'avatarUrl': ''},
    {'name': 'Aditya Verma', 'donations': 3200, 'rank': 9, 'avatarUrl': ''},
    {'name': 'Ishita Gupta', 'donations': 2800, 'rank': 10, 'avatarUrl': ''},
  ];

  // Announcements Mock Data
  static final List<Map<String, dynamic>> announcementsData = [
    {
      'id': '1',
      'title': 'New Reward Unlocked! 🎉',
      'content':
          'Congratulations on reaching ₹5K milestone! You\'ve earned the "₹5K Achiever" badge.',
      'type': 'success',
      'date': '2024-01-15T10:30:00Z',
      'isRead': false,
    },
    {
      'id': '2',
      'title': 'Weekly Target Reminder',
      'content':
          'You\'re 50% towards your weekly goal. Keep up the great work!',
      'type': 'info',
      'date': '2024-01-14T15:45:00Z',
      'isRead': true,
    },
    {
      'id': '3',
      'title': 'New Campaign Launch',
      'content':
          'We\'re launching a new fundraising campaign next week. Stay tuned for details!',
      'type': 'info',
      'date': '2024-01-13T09:15:00Z',
      'isRead': true,
    },
    {
      'id': '4',
      'title': 'Referral Bonus Extended',
      'content':
          'Referral bonuses have been extended until the end of the month. Share your code!',
      'type': 'warning',
      'date': '2024-01-12T14:20:00Z',
      'isRead': false,
    },
    {
      'id': '5',
      'title': 'Monthly Leaderboard Update',
      'content':
          'Monthly leaderboard has been updated. Check your new ranking!',
      'type': 'info',
      'date': '2024-01-11T11:00:00Z',
      'isRead': true,
    },
  ];

  // User Mock Data
  static final Map<String, dynamic> currentUserData = {
    'id': 'current_user_123',
    'name': 'Priya Sharma',
    'email': 'priya.sharma@example.com',
    'referralCode': 'INTERN2025',
    'totalDonations': 5000.0,
    'avatarUrl': 'https://i.pravatar.cc/150?img=4',
  };

  // Donations Mock Data
  static final List<Map<String, dynamic>> donationsData = [
    {
      'id': 'donation_1',
      'amount': 1000.0,
      'date': '2024-01-15T10:30:00Z',
      'donorName': 'Rahul Kumar',
      'status': 'completed',
    },
    {
      'id': 'donation_2',
      'amount': 500.0,
      'date': '2024-01-14T15:45:00Z',
      'donorName': 'Anjali Singh',
      'status': 'completed',
    },
    {
      'id': 'donation_3',
      'amount': 750.0,
      'date': '2024-01-13T09:15:00Z',
      'donorName': 'Vikram Patel',
      'status': 'pending',
    },
    {
      'id': 'donation_4',
      'amount': 1200.0,
      'date': '2024-01-12T14:20:00Z',
      'donorName': 'Meera Reddy',
      'status': 'completed',
    },
    {
      'id': 'donation_5',
      'amount': 800.0,
      'date': '2024-01-11T11:00:00Z',
      'donorName': 'Arjun Malhotra',
      'status': 'completed',
    },
  ];

  // Helper methods to convert to model objects
  static List<LeaderboardModel> getLeaderboardModels() {
    return leaderboardData
        .map((data) => LeaderboardModel.fromJson(data))
        .toList();
  }

  static List<AnnouncementModel> getAnnouncementModels() {
    return announcementsData
        .map((data) => AnnouncementModel.fromJson(data))
        .toList();
  }

  static UserModel getCurrentUser() {
    return UserModel.fromJson(currentUserData);
  }

  static List<DonationModel> getDonationModels() {
    return donationsData.map((data) => DonationModel.fromJson(data)).toList();
  }
}
