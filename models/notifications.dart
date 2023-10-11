class Notifications {
  int id;
  String title;
  String body;
  Map<String, dynamic> data;
  int? sender;
  int? recipient;
  bool? unread;
  bool? deleted;
  DateTime date;
  Notifications(
      {required this.id,
        required this.body,
        required this.data,
        this.deleted,
        this.recipient,
        this.sender,
        required this.title,
        this.unread,
        required this.date});
}

class NotificationChannel {
  final String notificationChannelID;
  final String notificationChannelName;
  final String notificationChannelDescription;

  NotificationChannel(this.notificationChannelID, this.notificationChannelName,
      this.notificationChannelDescription);
}
