class DonationModel {
  final String id;
  final double amount;
  final DateTime date;
  final String donorName;
  final String status;

  const DonationModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.donorName,
    required this.status,
  });

  factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
    id: json['id'],
    amount: json['amount'].toDouble(),
    date: DateTime.parse(json['date']),
    donorName: json['donorName'],
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'date': date.toIso8601String(),
    'donorName': donorName,
    'status': status,
  };
}
