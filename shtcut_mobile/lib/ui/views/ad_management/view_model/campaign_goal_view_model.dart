import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class CampaignGoalViewModel extends MBaseViewModel {
  final campaignController = TextEditingController();
  final interestController = TextEditingController();

  List<String> _selectedSocialTypes = [];
  String _selectedLocationOption = 'all'; // 'all', 'nigeria', 'custom'
  final List<String> _selectedCustomLocations = [];

  // Social Media Dropdown
  bool _isSocialMediaDropdownOpen = false;
  final Map<String, bool> _selectedSocialMedia = {
    'Facebook': false,
    'Instagram': false,
    'Twitter': false,
    'LinkedIn': false,
    'TikTok': false,
  };

  // Age Range Dropdown
  bool _isAgeRangeDropdownOpen = false;
  final Map<String, bool> _selectedAgeRanges = {
    '18-24': false,
    '25-34': false,
    '35-44': false,
    '45-54': false,
    '55-64': false,
    '65+': false,
  };

  // Gender Dropdown
  bool _isGenderDropdownOpen = false;
  final Map<String, bool> _selectedGenders = {
    'Male': false,
    'Female': false,
    'All': false,
  };

  // Getters
  List<String> get selectedSocialTypes => _selectedSocialTypes;
  String get selectedLocationOption => _selectedLocationOption;
  List<String> get selectedCustomLocations => _selectedCustomLocations;

  bool get isSocialMediaDropdownOpen => _isSocialMediaDropdownOpen;
  Map<String, bool> get selectedSocialMedia => _selectedSocialMedia;

  bool get isAgeRangeDropdownOpen => _isAgeRangeDropdownOpen;
  Map<String, bool> get selectedAgeRanges => _selectedAgeRanges;

  bool get isGenderDropdownOpen => _isGenderDropdownOpen;
  Map<String, bool> get selectedGenders => _selectedGenders;

  // Text getters for dropdowns
  String get selectedSocialMediaText {
    final selected = _selectedSocialMedia.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) return 'Select social media platforms';
    if (selected.length == 1) return selected.first;
    return '${selected.length} platforms selected';
  }

  String get selectedAgeRangeText {
    final selected = _selectedAgeRanges.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) return 'Select age range';
    if (selected.length == 1) return selected.first;
    return '${selected.length} age ranges selected';
  }

  String get selectedGenderText {
    final selected = _selectedGenders.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selected.isEmpty) return 'Select gender';
    if (selected.length == 1) return selected.first;
    return '${selected.length} genders selected';
  }

  // Toggle methods
  void toggleSocialMediaDropdown() {
    _isSocialMediaDropdownOpen = !_isSocialMediaDropdownOpen;
    // Close other dropdowns
    _isAgeRangeDropdownOpen = false;
    _isGenderDropdownOpen = false;
    notifyListeners();
  }

  void toggleAgeRangeDropdown() {
    _isAgeRangeDropdownOpen = !_isAgeRangeDropdownOpen;
    // Close other dropdowns
    _isSocialMediaDropdownOpen = false;
    _isGenderDropdownOpen = false;
    notifyListeners();
  }

  void toggleGenderDropdown() {
    _isGenderDropdownOpen = !_isGenderDropdownOpen;
    // Close other dropdowns
    _isSocialMediaDropdownOpen = false;
    _isAgeRangeDropdownOpen = false;
    notifyListeners();
  }

  void toggleSocialMediaSelection(String platform) {
    _selectedSocialMedia[platform] = !(_selectedSocialMedia[platform] ?? false);
    notifyListeners();
  }

  void toggleAgeRangeSelection(String ageRange) {
    _selectedAgeRanges[ageRange] = !(_selectedAgeRanges[ageRange] ?? false);
    notifyListeners();
  }

  void toggleGenderSelection(String gender) {
    // If "All" is selected, deselect others
    if (gender == 'All' && !(_selectedGenders['All'] ?? false)) {
      _selectedGenders.updateAll((key, value) => key == 'All');
    } else if (gender != 'All') {
      _selectedGenders['All'] = false;
      _selectedGenders[gender] = !(_selectedGenders[gender] ?? false);
    } else {
      _selectedGenders[gender] = !(_selectedGenders[gender] ?? false);
    }
    notifyListeners();
  }

  void toggleSocialPlatform(String platformId) {
    if (_selectedSocialTypes.contains(platformId)) {
      _selectedSocialTypes.remove(platformId);
    } else {
      _selectedSocialTypes = [platformId];
    }
    notifyListeners();
  }

  void setLocationOption(String option) {
    _selectedLocationOption = option;
    if (option != 'custom') {
      _selectedCustomLocations.clear();
    }
    notifyListeners();
  }

  Future<void> showCustomLocationBottomSheet() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.customLocation,
      isScrollControlled: true,
      data: {
        'onSelectionChanged': (List<String> selectedCountries) {
          _selectedCustomLocations.clear();
          _selectedCustomLocations.addAll(selectedCountries);
          notifyListeners();
        },
      },
    );
    if (response?.confirmed == true && response?.data != null) {
      _selectedCustomLocations.clear();
      _selectedCustomLocations.addAll(response!.data as List<String>);
      notifyListeners();
    }
  }

  void addCustomLocation(String location) {
    if (!_selectedCustomLocations.contains(location)) {
      _selectedCustomLocations.add(location);
      notifyListeners();
    }
  }

  void removeCustomLocation(String location) {
    _selectedCustomLocations.remove(location);
    notifyListeners();
  }

  final List<Map<String, dynamic>> campaignContent = [
    {
      'leadingIconPath': 'assets/svgs/speaker.svg',
      'title': 'Brand Awareness & Reach',
      'subtitle':
          'Maximize your brand\'s visibility and leave a lasting impression across platforms',
    },
    {
      'leadingIconPath': 'assets/svgs/handpoint.svg',
      'title': 'Website Traffic',
      'subtitle':
          'Drive traffic to your site or store with targeted ads that boost clicks and engagement.',
    },
    {
      'leadingIconPath': 'assets/svgs/heart.svg',
      'title': 'Engagements',
      'subtitle':
          'Encourage likes, comments, shares, and meaningful interactions to build  connections ',
    },
    {
      'leadingIconPath': 'assets/svgs/lead_generation.svg',
      'title': 'Lead Generation',
      'subtitle':
          'Encourage likes, comments, shares, and meaningful interactions to build  connections ',
    },
    {
      'leadingIconPath': 'assets/svgs/conversion.svg',
      'title': 'Conversions',
      'subtitle':
          'Drive sales, sign-ups, and other actions to achieve measurable results and maximize investment.',
    }
  ];

  final List<String> availableCountries = [
    'Nigeria',
    'Ghana',
    'Kenya',
    'South Africa',
    'Egypt',
    'Morocco',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Brazil',
    'India',
    'China',
    'Japan',
  ];

  // void navigateToBudgetView() {
  //   navRouter.navigateToAdCampaignBudgetView();
  // }

  void navigateToCreatePost() {
    navRouter.navigateToCreatePostContentView(isAdCampaign: true);
  }

  @override
  void dispose() {
    campaignController.dispose();
    interestController.dispose();
    super.dispose();
  }
}
