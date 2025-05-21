import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class CreateTopicViewModel extends MBaseViewModel {
  final brandNameController = TextEditingController();
  final topicDescriptionController = TextEditingController();

  // Topic Type dropdown
  bool isTopicTypeDropdownOpen = false;
  String? selectedTopicType;
  final List<String> topicTypes = [
    'Brand Health',
    'Industry Insights',
    'Competitive Analysis'
  ];

  void toggleTopicTypeDropdown() {
    isTopicTypeDropdownOpen = !isTopicTypeDropdownOpen;
    notifyListeners();
  }

  void selectTopicType(String type) {
    selectedTopicType = type;
    isTopicTypeDropdownOpen = false;
    notifyListeners();
  }

  // Social Media Sources
  bool isSocialMediaDropdownOpen = false;
  final List<String> socialMediaSources = [
    'Instagram',
    'Twitter',
    'Facebook',
    'Threads',
  ];

  final List<String> svgs = [
    'instagram_logo',
    'x_logo',
    'facebook_logo',
    'threads_logo',
  ];

  final Map<String, bool> selectedSocialMedia = {
    'Instagram': false,
    'Twitter': false,
    'Facebook': false,
    'LinkedIn': false,
    'TikTok': false
  };

  void toggleSocialMediaDropdown() {
    isSocialMediaDropdownOpen = !isSocialMediaDropdownOpen;
    notifyListeners();
  }

  void toggleSocialMediaSelection(String source) {
    selectedSocialMedia[source] = !(selectedSocialMedia[source] ?? false);
    notifyListeners();
  }

  String get selectedSocialMediaText {
    final selected = selectedSocialMedia.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) return 'Select Social Media Sources';
    if (selected.length == 1) return selected.first;
    return '${selected.length} sources selected';
  }
}
