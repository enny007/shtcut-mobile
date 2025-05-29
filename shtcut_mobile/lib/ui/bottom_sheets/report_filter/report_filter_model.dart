import 'package:shtcut_mobile/core/base/base_view_model.dart';

class ReportFilterModel extends MBaseViewModel {
  // Date Range
  String _selectedDateRange = 'Last 7 days';
  bool _isDateRangeDropdownOpen = false;
  final List<String> _dateRangeOptions = [
    'Last 7 days',
    'Last 30 days',
    'Last 3 months',
    'Last 6 months',
    'Custom range'
  ];

  // Social Media Accounts
  bool _isSocialMediaDropdownOpen = false;
  final Map<String, Map<String, dynamic>> _socialMediaAccounts = {
    'John Doe - Twitter': {
      'selected': false,
      'profileImage': 'assets/images/pic_1.png',
      'socialIcon': 'assets/svgs/twitter.svg',
    },
    'Jane Smith - Instagram': {
      'selected': false,
      'profileImage': 'assets/images/pic_2.png',
      'socialIcon': 'assets/svgs/instagram.svg',
    },
    'Mike Johnson - Facebook': {
      'selected': false,
      'profileImage': 'assets/images/pic_2.png',
      'socialIcon': 'assets/svgs/facebook.svg',
    },
  };

  // Type - Changed to Map with checkboxes
  bool _isTypeDropdownOpen = false;
  final Map<String, bool> _selectedTypes = {
    'All': true,
    'Likes': false,
    'Comments': false,
    'Reposts': false,
    'Messages': false,
  };

  // Assigned To - Changed to Map with checkboxes
  bool _isAssignedToDropdownOpen = false;
  final Map<String, bool> _selectedAssignedTo = {
    'All': true,
    'Assigned to me': false,
  };

  // Tags
  bool _isTagsDropdownOpen = false;
  final Map<String, bool> _selectedTags = {
    'All Tags': false,
    '#Marketing': false,
    '#Cooking': false,
    '#Wellness': false,
    '#Technology': false,
  };

  // Getters
  String get selectedDateRange => _selectedDateRange;
  bool get isDateRangeDropdownOpen => _isDateRangeDropdownOpen;
  List<String> get dateRangeOptions => _dateRangeOptions;

  bool get isSocialMediaDropdownOpen => _isSocialMediaDropdownOpen;
  Map<String, Map<String, dynamic>> get socialMediaAccounts =>
      _socialMediaAccounts;

  bool get isTypeDropdownOpen => _isTypeDropdownOpen;
  Map<String, bool> get selectedTypes => _selectedTypes;

  bool get isAssignedToDropdownOpen => _isAssignedToDropdownOpen;
  Map<String, bool> get selectedAssignedTo => _selectedAssignedTo;

  bool get isTagsDropdownOpen => _isTagsDropdownOpen;
  Map<String, bool> get selectedTags => _selectedTags;

  String get selectedSocialMediaText {
    final selectedAccounts = _socialMediaAccounts.entries
        .where((entry) => entry.value['selected'] == true)
        .map((entry) => entry.key)
        .toList();

    if (selectedAccounts.isEmpty) {
      return 'Select social media accounts';
    } else if (selectedAccounts.length == 1) {
      return selectedAccounts.first;
    } else {
      return '${selectedAccounts.length} accounts selected';
    }
  }

  String get selectedTypesText {
    final selectedTypesList = _selectedTypes.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    if (selectedTypesList.isEmpty) {
      return 'Select types';
    } else if (selectedTypesList.length == 1) {
      return selectedTypesList.first;
    } else {
      return '${selectedTypesList.length} types selected';
    }
  }

  String get selectedAssignedToText {
    final selectedAssignedToList = _selectedAssignedTo.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    if (selectedAssignedToList.isEmpty) {
      return 'Select assignment';
    } else if (selectedAssignedToList.length == 1) {
      return selectedAssignedToList.first;
    } else {
      return '${selectedAssignedToList.length} assignments selected';
    }
  }

  String get selectedTagsText {
    final selectedTagsList = _selectedTags.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    if (selectedTagsList.isEmpty) {
      return 'Select tags';
    } else if (selectedTagsList.length == 1) {
      return selectedTagsList.first;
    } else {
      return '${selectedTagsList.length} tags selected';
    }
  }

  // Get the number of applied filters
  int get appliedFiltersCount {
    int count = 0;

    // Check if date range is not default
    if (_selectedDateRange != 'Last 7 days') {
      count++;
    }

    // Check if any social media accounts are selected
    if (_socialMediaAccounts.values
        .any((account) => account['selected'] == true)) {
      count++;
    }

    // Check if any types other than 'All' are selected
    if (_selectedTypes.entries
        .any((entry) => entry.key != 'All' && entry.value == true)) {
      count++;
    }

    // Check if any assigned to other than 'All' are selected
    if (_selectedAssignedTo.entries
        .any((entry) => entry.key != 'All' && entry.value == true)) {
      count++;
    }

    // Check if any tags are selected
    if (_selectedTags.values.any((selected) => selected == true)) {
      count++;
    }

    return count;
  }

  // Methods
  void toggleDateRangeDropdown() {
    _isDateRangeDropdownOpen = !_isDateRangeDropdownOpen;
    notifyListeners();
  }

  void selectDateRange(String dateRange) {
    _selectedDateRange = dateRange;
    _isDateRangeDropdownOpen = false;
    notifyListeners();
  }

  void toggleSocialMediaDropdown() {
    _isSocialMediaDropdownOpen = !_isSocialMediaDropdownOpen;
    notifyListeners();
  }

  void toggleSocialMediaSelection(String account) {
    _socialMediaAccounts[account]!['selected'] =
        !_socialMediaAccounts[account]!['selected'];
    notifyListeners();
  }

  void toggleTypeDropdown() {
    _isTypeDropdownOpen = !_isTypeDropdownOpen;
    notifyListeners();
  }

  void toggleTypeSelection(String type) {
    _selectedTypes[type] = !_selectedTypes[type]!;
    notifyListeners();
  }

  void toggleAssignedToDropdown() {
    _isAssignedToDropdownOpen = !_isAssignedToDropdownOpen;
    notifyListeners();
  }

  void toggleAssignedToSelection(String assignedTo) {
    _selectedAssignedTo[assignedTo] = !_selectedAssignedTo[assignedTo]!;
    notifyListeners();
  }

  void toggleTagsDropdown() {
    _isTagsDropdownOpen = !_isTagsDropdownOpen;
    notifyListeners();
  }

  void toggleTagSelection(String tag) {
    _selectedTags[tag] = !_selectedTags[tag]!;
    notifyListeners();
  }

  void applyFilters() {
    // Handle filter application logic
    // You can collect all selected values and pass them back
  }

  void resetFilters() {
    _selectedDateRange = 'Last 7 days';

    // Reset social media selections
    _socialMediaAccounts.forEach((key, value) {
      value['selected'] = false;
    });

    // Reset type selections
    _selectedTypes.updateAll((key, value) => key == 'All' ? true : false);

    // Reset assigned to selections
    _selectedAssignedTo.updateAll((key, value) => key == 'All' ? true : false);

    // Reset tag selections
    _selectedTags.updateAll((key, value) => false);

    notifyListeners();
  }
}
