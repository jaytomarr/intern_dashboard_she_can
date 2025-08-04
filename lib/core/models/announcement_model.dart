class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final String type; // info, success, warning
  final bool isRead;

  const AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.type,
    required this.isRead,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        date: DateTime.parse(json['date']),
        type: json['type'],
        isRead: json['isRead'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'date': date.toIso8601String(),
    'type': type,
    'isRead': isRead,
  };
}
