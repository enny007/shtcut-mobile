import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class NewGroupViewModel extends MBaseViewModel {
  final TextEditingController groupNameController = TextEditingController();

  // Store the selected members data
  List<Map<String, dynamic>> selectedMembers = [];

  // Initialize with selected members data
  void initializeWithSelectedMembers(List<Map<String, dynamic>> members) {
    selectedMembers = members;
    notifyListeners();
  }

  // Create the group with the selected members
  void createGroup() {
    // Implementation for creating a group with the name and selected members
    final groupName = groupNameController.text.trim();
    final name = groupName.isEmpty ? "New Group" : groupName;

    print('Creating group "$name" with ${selectedMembers.length} members');
    // Navigate to the group chat or perform other actions
  }

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }
}
