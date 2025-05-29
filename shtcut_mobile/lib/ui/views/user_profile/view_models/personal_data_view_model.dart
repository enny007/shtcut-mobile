import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class PersonalDataViewModel extends MBaseViewModel {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();
  final positionController = TextEditingController();

  DateTime? _selectedDate;
  bool _isPositionDropdownOpen = false;
  String _selectedPosition = '';

  // Position options
  final List<String> _positionOptions = [
    'Frontend Engineer',
    'Backend Engineer',
    'Full Stack Developer',
    'Mobile Developer',
    'DevOps Engineer',
    'UI/UX Designer',
    'Product Manager',
    'Data Scientist',
    'QA Engineer',
    'Software Architect',
  ];

  // Getters
  DateTime? get selectedDate => _selectedDate;
  bool get isPositionDropdownOpen => _isPositionDropdownOpen;
  List<String> get positionOptions => _positionOptions;
  String get selectedPosition => _selectedPosition;

  String get selectedPositionText {
    return _selectedPosition.isEmpty ? 'Select position' : _selectedPosition;
  }

  // Methods
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ??
          DateTime.now().subtract(
              const Duration(days: 365 * 25)), // Default to 25 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: kcPrimaryColor,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      // Format the date and set it to the controller
      dobController.text = _formatDate(picked);
      notifyListeners();
    }
  }

  String _formatDate(DateTime date) {
    // Format: DD/MM/YYYY or you can use any format you prefer
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void togglePositionDropdown() {
    _isPositionDropdownOpen = !_isPositionDropdownOpen;
    notifyListeners();
  }

  void selectPosition(String position) {
    _selectedPosition = position;
    positionController.text = position;
    _isPositionDropdownOpen = false;
    notifyListeners();
  }

  Future<void> showUpdateProfile() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.updateProfile,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    positionController.dispose();
    super.dispose();
  }
}
