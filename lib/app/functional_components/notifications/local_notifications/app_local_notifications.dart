import 'package:awesome_notifications/awesome_notifications.dart';

import '../app_notifications_enums.dart';
import '../app_notifications_repository.dart';
import 'app_local_notifications_repository.dart';

class AppLocalNotifications extends AppNotificationsRepository {
  @override
  Future<bool> init() async => await AppLocalNotificationsRepository().init();

  @override
  Future<bool> simple({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
    );
    return result;
  }

  @override
  Future<bool> scheduled({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
    required DateTime dateTime,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
      calendar: NotificationCalendar.fromDate(date: dateTime),
    );
    return result;
  }

  @override
  Future<bool> intervalBased({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
    required int interval,
    bool? repeat,
    bool? preciseAlarm,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
      interval: NotificationInterval(
        interval: interval,
        repeats: repeat ?? false,
        preciseAlarm: preciseAlarm ?? true,
      ),
    );
    return result;
  }
}
