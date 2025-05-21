import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:shtcut_mobile/ui/views/messaging/view/new_group_view.dart';

class AddGroupMembersViewModel extends MBaseViewModel {
  TextEditingController nameController = TextEditingController();

  final List<Map<String, dynamic>> contacts = [
    {
      'id': '1',
      'name': 'John Doe',
      'subtitle': 'Software Developer',
      'imageUrl': 'assets/images/pic_1.png',
    },
    {
      'id': '2',
      'name': 'Sarah Johnson',
      'subtitle': 'UI/UX Designer',
      'imageUrl': 'assets/images/pic_1.png',
    },
    {
      'id': '3',
      'name': 'Michael Brown',
      'subtitle': 'Project Manager',
      'imageUrl': 'assets/images/pic_1.png',
    },
    {
      'id': '4',
      'name': 'Emily Davis',
      'subtitle': 'Marketing Specialist',
      'imageUrl': 'assets/images/pic_1.png',
    },
    {
      'id': '5',
      'name': 'David Wilson',
      'subtitle': 'Data Analyst',
      'imageUrl': 'assets/images/pic_1.png',
    },
    {
      'id': '6',
      'name': 'Jessica Taylor',
      'subtitle': 'Content Writer',
      'imageUrl': 'assets/images/pic_1.png',
    },
    {
      'id': '7',
      'name': 'Robert Martinez',
      'subtitle': 'Mobile Developer',
      'imageUrl': 'assets/images/pic_1.png',
    },
  ];

  final Set<String> selectedContacts = {};

  // Toggle selection of a contact
  void toggleContactSelection(String contactId) {
    if (selectedContacts.contains(contactId)) {
      selectedContacts.remove(contactId);
    } else {
      selectedContacts.add(contactId);
    }
    notifyListeners();
  }

  // Check if a contact is selected
  bool isContactSelected(String contactId) {
    return selectedContacts.contains(contactId);
  }

  // Filter contacts based on search query
  List<Map<String, dynamic>> getFilteredContacts() {
    final query = nameController.text.toLowerCase();
    if (query.isEmpty) {
      return contacts;
    }

    return contacts
        .where((contact) =>
            contact['name'].toString().toLowerCase().contains(query))
        .toList();
  }

  List<Map<String, dynamic>> getSelectedMembersData() {
    return contacts
        .where((contact) => selectedContacts.contains(contact['id']))
        .toList();
  }

  void createGroup() {
    if (selectedContacts.isEmpty) return;

    final selectedMembersData = getSelectedMembersData();
    navRouter.navigateToNewGroupView(
      selectedMembers: selectedMembersData,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
