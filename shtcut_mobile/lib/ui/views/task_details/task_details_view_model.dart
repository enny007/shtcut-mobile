import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class TaskDetailsViewModel extends MBaseViewModel {
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  // Dropdown values
  String? selectedMember;
  String? selectedPriority;
  String? selectedDifficulty;

  // Dropdown options
  final List<String> members = [
    'John Doe',
    'Jane Smith',
    'Robert Johnson',
    'Emily Davis'
  ];
  final List<String> priorities = ['Low', 'Medium', 'High', 'Urgent'];
  final List<String> difficulties = ['Easy', 'Moderate', 'Hard', 'Very Hard'];

  // Image attachment handling
  final List<File> attachedImages = [];
  final ImagePicker _imagePicker = ImagePicker();

  // Dropdown visibility states
  bool isMemberDropdownOpen = false;
  bool isPriorityDropdownOpen = false;
  bool isDifficultyDropdownOpen = false;

  void toggleMemberDropdown() {
    isMemberDropdownOpen = !isMemberDropdownOpen;
    // Close other dropdowns
    // isPriorityDropdownOpen = false;
    // isDifficultyDropdownOpen = false;
    notifyListeners();
  }

  void togglePriorityDropdown() {
    isPriorityDropdownOpen = !isPriorityDropdownOpen;
    // Close other dropdowns
    // isMemberDropdownOpen = false;
    // isDifficultyDropdownOpen = false;
    notifyListeners();
  }

  void toggleDifficultyDropdown() {
    isDifficultyDropdownOpen = !isDifficultyDropdownOpen;
    // Close other dropdowns
    // isMemberDropdownOpen = false;
    // isPriorityDropdownOpen = false;
    notifyListeners();
  }

  void selectMember(String member) {
    selectedMember = member;
    isMemberDropdownOpen = false;
    notifyListeners();
  }

  void selectPriority(String priority) {
    selectedPriority = priority;
    isPriorityDropdownOpen = false;
    notifyListeners();
  }

  void selectDifficulty(String difficulty) {
    selectedDifficulty = difficulty;
    isDifficultyDropdownOpen = false;
    notifyListeners();
  }

  // Image handling methods
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        attachedImages.add(File(pickedFile.path));
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      debugPrint('Error picking image: $e');
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < attachedImages.length) {
      attachedImages.removeAt(index);
      notifyListeners();
    }
  }

  Future<void> showCreateNewTask() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createNewTask,
      isScrollControlled: true,
    );
  }
}
