class LeaderboardModel {
  final String userId;
  final String name;
  final double totalDonations;
  final int rank;
  final String avatarUrl;

  const LeaderboardModel({
    required this.userId,
    required this.name,
    required this.totalDonations,
    required this.rank,
    required this.avatarUrl,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) =>
      LeaderboardModel(
        userId: json['userId']?.toString() ?? 'user_${json['rank']}',
        name: json['name']?.toString() ?? 'Unknown User',
        totalDonations:
            (json['donations'] ?? json['totalDonations'] ?? 0).toDouble(),
        rank: json['rank'] ?? 0,
        avatarUrl: json['avatarUrl']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'totalDonations': totalDonations,
        'rank': rank,
        'avatarUrl': avatarUrl,
      };
}
