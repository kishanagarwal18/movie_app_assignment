import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _notifications.initialize(settings);
  }

  static Future show(String message) async {
    const androidDetails = AndroidNotificationDetails(
      'movie_channel',
      'Movies',
      importance: Importance.max,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(
      0,
      "Now Playing",
      message,
      notificationDetails,
    );
  }
}
