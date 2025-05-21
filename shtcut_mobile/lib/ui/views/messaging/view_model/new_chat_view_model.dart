import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class NewChatViewModel extends MBaseViewModel {
  final nameController = TextEditingController();

  // List of contacts
  final List<Map<String, dynamic>> contacts = [
    {
      // 'id': '1',
      'name': 'John Doe',
      'career': 'Software engineer',
      'imageUrl': 'assets/images/pic_1.png',
      'onSelect': () {
        // Handle selection
      },
    },
    {
      // 'id': '2',
      'name': 'Sarah Johnson',
      'career': 'Software engineer',
      'imageUrl': 'assets/images/pic_1.png',
      'onSelect': () {
        // Handle selection
      },
    },
    {
      // 'id': '3',
      'name': 'Michael Brown',
      'career': 'Software engineer',
      'imageUrl': 'assets/images/pic_1.png',
      'onSelect': () {
        // Handle selection
      },
    },
    {
      // 'id': '4',
      'name': 'Emily Davis',
      'career': 'Software engineer',
      'imageUrl': 'assets/images/pic_1.png',
      'onSelect': () {
        // Handle selection
      },
    },
    {
      // 'id': '5',
      'name': 'David Wilson',
      'career': 'Software engineer',
      'imageUrl': 'assets/images/pic_1.png',
      'onSelect': () {
        // Handle selection
      },
    },
  ];

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
