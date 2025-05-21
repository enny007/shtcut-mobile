import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class MessagingViewModel extends MBaseViewModel {
  final nameController = TextEditingController();

  final List<Map<String, dynamic>> messageList = [
    {
      'title': 'John Doe',
      'subtitle': 'Hey, how are you doing?',
      'timestamp': '12:30 PM',
      'unreadCount': 3,
    },
    {
      'title': 'Design Team',
      'subtitle': 'The new mockups are ready for review',
      'timestamp': '10:45 AM',
      'unreadCount': 1,
    },
    {
      'title': 'Sarah Johnson',
      'subtitle': 'Can we schedule a meeting tomorrow?',
      'timestamp': '9:15 AM',
      'unreadCount': 0,
    },
    {
      'title': 'Project Shtcut',
      'subtitle': 'New updates available for the app',
      'timestamp': 'Yesterday',
      'unreadCount': 5,
    },
    {
      'title': 'Tech Support',
      'subtitle': 'Your ticket has been resolved',
      'timestamp': 'Yesterday',
      'unreadCount': 0,
    },
  ];

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
