class UserModel {
  final String id;
  final String name;
  final String email;
  final String referralCode;
  final double totalDonations;
  final String avatarUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.referralCode,
    required this.totalDonations,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    referralCode: json['referralCode'],
    totalDonations: json['totalDonations'].toDouble(),
    avatarUrl: json['avatarUrl'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'referralCode': referralCode,
    'totalDonations': totalDonations,
    'avatarUrl': avatarUrl,
  };
}
