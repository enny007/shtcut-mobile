import 'package:shtcut_mobile/core/base/base_view_model.dart';

class NotificationViewModel extends MBaseViewModel {
  // Map to store notification states - key is notification ID/title, value is enabled state
  final Map<String, bool> _notificationStates = {};

  // Sample notification data
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': 'push_notifications',
      'title': 'General Notifications',
      'subtitle': 'Turn on all notifications',
      'enabled': true,
    },
    {
      'id': 'email_notifications',
      'title': 'Post Notifications',
      'subtitle': 'Get notified when someone likes your posts or comments',
      'enabled': false,
    },
    {
      'id': 'sms_notifications',
      'title': 'Task Notifications',
      'subtitle': 'Get notified when a task is assigned to you or updated',
      'enabled': true,
    },
    {
      'id': 'marketing_emails',
      'title': 'Message Notifications',
      'subtitle': 'Get notified when a messages and chats are sent to you',
      'enabled': false,
    },
    {
      'id': 'social_notifications',
      'title': 'Group Chat Notifications',
      'subtitle':
          'Get notified when a messages are sent to any group you are a member of.',
      'enabled': true,
    },
  ];

  // Getters
  List<Map<String, dynamic>> get notifications => _notifications;

  NotificationViewModel() {
    for (var notification in _notifications) {
      _notificationStates[notification['id']] = notification['enabled'];
    }
  }
  // Get the current state of a notification
  bool getNotificationState(String notificationId) {
    return _notificationStates[notificationId] ?? false;
  }

  // Toggle notification state
  void toggleNotification(String notificationId) {
    _notificationStates[notificationId] =
        !(_notificationStates[notificationId] ?? false);

    // Update the notification in the list as well
    final index = _notifications
        .indexWhere((notification) => notification['id'] == notificationId);
    if (index != -1) {
      _notifications[index]['enabled'] = _notificationStates[notificationId];
    }

    notifyListeners();

    // Here you can add API call to save the preference
    _saveNotificationPreference(
        notificationId, _notificationStates[notificationId]!);
  }

  // Simulate saving notification preference (replace with actual API call)
  void _saveNotificationPreference(String notificationId, bool enabled) {
    // TODO: Implement API call to save notification preference
    print('Saving notification preference: $notificationId = $enabled');
  }

  // Enable all notifications
  void enableAllNotifications() {
    for (var notification in _notifications) {
      _notificationStates[notification['id']] = true;
      notification['enabled'] = true;
    }
    notifyListeners();
  }

  // Disable all notifications
  void disableAllNotifications() {
    for (var notification in _notifications) {
      _notificationStates[notification['id']] = false;
      notification['enabled'] = false;
    }
    notifyListeners();
  }
}
