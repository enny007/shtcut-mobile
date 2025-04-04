import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class SchedulePostModel extends MBaseViewModel {
  // Calendar state
  DateTime _selectedDate = DateTime.now();
  late DateTime _displayedMonth;
  TimeOfDay _selectedTime = TimeOfDay.now();

  // Year and month selection
  List<int> _availableYears = [];
  late int _selectedYear;
  late int _selectedMonth;

  // Getters
  DateTime get selectedDate => _selectedDate;
  DateTime get displayedMonth => _displayedMonth;
  List<int> get availableYears => _availableYears;
  int get selectedYear => _selectedYear;
  int get selectedMonth => _selectedMonth;
  TimeOfDay get selectedTime => _selectedTime;

  // Constructor to initialize the calendar
  SchedulePostModel() {
    final now = DateTime.now();
    _selectedDate = now;
    _displayedMonth = DateTime(now.year, now.month, 1);
    _selectedYear = now.year;
    _selectedMonth = now.month;
    _selectedTime = TimeOfDay.now();

    // Generate list of years (current year and 5 years ahead)
    _availableYears = List.generate(6, (index) => now.year + index);
  }

  // Method to select a date
  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  // Method to change the displayed month
  void changeMonth(int month) {
    _selectedMonth = month;
    _displayedMonth = DateTime(_selectedYear, month, 1);
    notifyListeners();
  }

  // Method to change the displayed year
  void changeYear(int year) {
    _selectedYear = year;
    _displayedMonth = DateTime(year, _selectedMonth, 1);
    notifyListeners();
  }

  // Method to set the selected time
  void setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  // Method to get all dates to display in the calendar
  List<DateTime> getDaysInMonth() {
    final List<DateTime> days = [];

    // First day of the month
    final firstDayOfMonth =
        DateTime(_displayedMonth.year, _displayedMonth.month, 1);

    // // Last day of the month
    // final lastDayOfMonth =
    //     DateTime(_displayedMonth.year, _displayedMonth.month + 1, 0);

    // Find the first day to display (might be from previous month)
    int firstWeekday =
        firstDayOfMonth.weekday % 7; // 0 = Sunday, 1 = Monday, etc.
    final firstDisplayedDay =
        firstDayOfMonth.subtract(Duration(days: firstWeekday));

    // Generate 42 days (6 weeks) to ensure we cover the entire month plus padding
    for (int i = 0; i < 42; i++) {
      days.add(firstDisplayedDay.add(Duration(days: i)));
    }

    return days;
  }

  // Check if a date is from the current displayed month
  bool isCurrentMonth(DateTime date) {
    return date.month == _displayedMonth.month &&
        date.year == _displayedMonth.year;
  }

  // Check if a date is the selected date
  bool isSelectedDate(DateTime date) {
    return date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;
  }

  // Check if a date is today
  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
