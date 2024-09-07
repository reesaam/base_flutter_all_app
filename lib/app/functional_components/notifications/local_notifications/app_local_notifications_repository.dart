import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_functions.dart';
import '../../../../data/info/app_core_flags.dart';
import '../../../../data/resources/app_logos.dart';
import '../../../../data/resources/app_theme/app_themes.dart';
import '../app_notifications_enums.dart';
import 'app_local_notification_controller.dart';

class AppLocalNotificationsRepository {
  List<NotificationChannel> _channels() {
    List<NotificationChannel> channels = [
      NotificationChannel(channelKey: AppNotificationChannelKey.simple.name, channelName: 'channelName', channelDescription: 'channelDescription')
    ];
    return channels;
  }

  List<NotificationChannelGroup>? _groups() {
    List<NotificationChannelGroup> groups = [
      NotificationChannelGroup(channelGroupKey: 'channelGroupKey', channelGroupName: 'channelGroupName'),
    ];
    return groups;
  }

  Future<bool> init() async {
    bool initializationResult = await AwesomeNotifications().initialize(null, _channels(), channelGroups: _groups(), debug: !isRelease);
    bool permissionResult = await _permissionCheck();
    bool listenersInitResult = await _setListeners();
    bool channelSetResult = await _setChannel();

    var receivedAction = await AwesomeNotifications().getInitialNotificationAction(removeFromActionEvents: false);
    appDebugPrint(receivedAction);

    bool initResult = initializationResult && permissionResult && listenersInitResult && channelSetResult;
    initResult ? appLogPrint('AppNotifications Initialization was Successful.') : appLogPrint('AppNotifications Initialization Failed.');

    return initResult;
  }

  Future<bool> _setListeners() async {
    bool listenersInitResult = await AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) => AppLocalNotificationController.onActionReceivedMethod(receivedAction),
      onDismissActionReceivedMethod: (receivedAction) => AppLocalNotificationController.onDismissActionReceivedMethod(receivedAction),
      onNotificationCreatedMethod: (receivedNotification) => AppLocalNotificationController.onNotificationCreatedMethod(receivedNotification),
      onNotificationDisplayedMethod: (receivedNotification) => AppLocalNotificationController.onNotificationDisplayedMethod(receivedNotification),
    );

    listenersInitResult
        ? appDebugPrint('AppNotifications Listeners Initialization was Successful.')
        : appDebugPrint('AppNotifications Listeners Initialization Failed.');

    return listenersInitResult;
  }

  Future<bool> _permissionCheck() async {
    bool permissionResult = await AwesomeNotifications().isNotificationAllowed();
    bool requestResult = await AwesomeNotifications().requestPermissionToSendNotifications();

    permissionResult && requestResult
        ? appDebugPrint('AppNotifications Permissions Initialization was Successful.')
        : appDebugPrint('AppNotifications Permissions Initialization Failed.');

    return permissionResult && requestResult;
  }

  Future<bool> _setChannel() async {
    if (_channels().isNotEmpty) {
      await AwesomeNotifications().setChannel(_channels().first);
      appDebugPrint('Channel Set');
      return true;
    } else {
      appDebugPrint('Channels List is Empty');
      return false;
    }
  }

  Future<bool> createNotification({
    int? id,
    required AppNotificationChannelKey channelKey,
    //Main
    List<NotificationActionButton>? actionButtons,
    Map<String, NotificationLocalization>? localizations,
    // NotificationSchedule? schedule,
    NotificationInterval? interval,
    NotificationCalendar? calendar,
    //Content
    NotificationLayout? layout,
    Color? color,
    Color? backgroundColor,
    String? title,
    ActionType? actionType,
    bool? autoDismissible,
    int? badge,
    String? bigPicture,
    String? body,
    NotificationCategory? category,
    int? chronometerLongSeconds,
    bool? criticalAlert,
    String? customSound,
    bool? displayOnBackground,
    bool? displayOnForeground,
    bool? fullScreenIntent,
    String? groupKey,
    bool? hideLargeIconOnExpand,
    String? icon,
    String? largeIcon,
    bool? locked,
    Map<String, String?>? payload,
    int? progress,
    bool? roundedBigPicture,
    bool? roundedLargeIcon,
    bool? showWhen,
    String? summary,
    String? ticker,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async =>
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id ?? 1,
          channelKey: channelKey.name,
          notificationLayout: layout ?? NotificationLayout.Default,
          color: color,
          backgroundColor: backgroundColor,
          title: title,
          actionType: actionType ?? ActionType.Default,
          autoDismissible: autoDismissible ?? true,
          badge: badge ?? 0,
          bigPicture: bigPicture,
          body: body,
          category: category ?? NotificationCategory.Status,
          chronometer: Duration(seconds: chronometerLongSeconds ?? 0),
          criticalAlert: criticalAlert ?? false,
          customSound: customSound,
          displayOnBackground: displayOnBackground ?? true,
          displayOnForeground: displayOnForeground ?? true,
          fullScreenIntent: fullScreenIntent ?? false,
          groupKey: groupKey,
          hideLargeIconOnExpand: hideLargeIconOnExpand ?? true,
          icon: icon,
          largeIcon: largeIcon,
          locked: locked ?? false,
          payload: payload,
          progress: progress,
          roundedBigPicture: roundedBigPicture ?? false,
          roundedLargeIcon: roundedLargeIcon ?? false,
          showWhen: showWhen ?? false,
          summary: summary,
          ticker: ticker,
          timeoutAfter: Duration(seconds: timeoutAfterLongSeconds ?? 0),
          wakeUpScreen: wakeUpScreen ?? true,
        ),
        actionButtons: actionButtons,
        localizations: localizations,
        schedule: interval ?? calendar,
      );

  NotificationInterval createInterval({int? interval, bool? repeats, bool? preciseAlarm, bool? allowWhileIdle, String? timeZone}) =>
      NotificationInterval(
          interval: interval ?? 1,
          repeats: repeats ?? false,
          preciseAlarm: preciseAlarm ?? true,
          allowWhileIdle: allowWhileIdle ?? true,
          timeZone: timeZone);

  NotificationCalendar createCalendar(
          {DateTime? dateTime,
          String? timeZone,
          bool? allowWhileIdle,
          bool? preciseAlarm,
          bool? repeats,
          int? era,
          int? weekday,
          int? weekOfMonth,
          int? weekOfYear}) =>
      NotificationCalendar(
          timeZone: timeZone,
          allowWhileIdle: allowWhileIdle ?? true,
          preciseAlarm: preciseAlarm ?? true,
          repeats: repeats ?? false,
          hour: dateTime?.hour,
          second: dateTime?.second,
          minute: dateTime?.minute,
          day: dateTime?.day,
          month: dateTime?.month,
          year: dateTime?.year,
          era: era,
          millisecond: dateTime?.millisecond,
          weekday: dateTime?.weekday,
          weekOfMonth: weekOfMonth,
          weekOfYear: weekOfYear);

  NotificationActionButton createButton(
          {String? key,
          String? label,
          String? icon,
          bool? autoDismissible,
          ActionType? actionType,
          Color? color,
          bool? enabled,
          bool? isDangerousOption,
          bool? requireInputText,
          bool? showInCompactView}) =>
      NotificationActionButton(
          key: key ?? '',
          label: label ?? '',
          icon: icon,
          autoDismissible: autoDismissible ?? true,
          actionType: actionType ?? ActionType.Default,
          color: color ?? AppThemes.to.primaryColor,
          enabled: enabled ?? true,
          isDangerousOption: isDangerousOption ?? false,
          requireInputText: requireInputText ?? false,
          showInCompactView: showInCompactView ?? false);
}
