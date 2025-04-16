import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class CalendarViewModel extends BaseViewModel {
  // Calendar state
  DateTime _selectedDate = DateTime.now();
  late DateTime _displayedMonth;
  bool _isCalendarExpanded = true;

  // Events/posts data
  Map<DateTime, List<dynamic>> _posts = {};

  // Getters
  DateTime get selectedDate => _selectedDate;
  DateTime get displayedMonth => _displayedMonth;
  Map<DateTime, List<dynamic>> get posts => _posts;
  bool get isCalendarExpanded => _isCalendarExpanded;

  // Constructor to initialize the calendar
  CalendarViewModel() {
    final now = DateTime.now();
    _selectedDate = now;
    _displayedMonth = DateTime(now.year, now.month, 1);

    // Initialize with some sample events (replace with actual data)
    _initializeEvents();
  }

  // Method to initialize events (sample data)
  void _initializeEvents() {
    // Sample events - replace with your actual data source
    final now = DateTime.now();

    // Add some sample events - we'll use integers to represent different posts
    // In a real app, these would be actual post objects
    _posts = {
      DateTime(now.year, now.month, 5): [1, 2], // Two posts on the 5th
      DateTime(now.year, now.month, 12): [3], // One post on the 12th
      DateTime(now.year, now.month, 15): [
        4,
        5,
        6,
        7,
        8,
        9
      ], // Three posts on the 15th
      DateTime(now.year, now.month, 22): [10], // One post on the 22nd
      DateTime(now.year, now.month, now.day): [11, 12], // Two posts today
    };
  }

  // Method to select a date
  void selectDate(DateTime date) {
    _selectedDate = DateTime(date.year, date.month, date.day);
    print('Date selected in ViewModel: $_selectedDate'); // Debug print
    notifyListeners();
  }

  void toggleCalendarView() {
    _isCalendarExpanded = !_isCalendarExpanded;
    notifyListeners();
  }

  List<DateTime> getCurrentWeekDays() {
    // Get the current week containing the selected date
    final DateTime selectedDate = this.selectedDate;

    // Find the start of the week (Sunday)
    final int weekday =
        selectedDate.weekday % 7; // 0 = Sunday, 1 = Monday, etc.
    final DateTime startOfWeek = selectedDate.subtract(Duration(days: weekday));

    // Generate 7 days for the week
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  // Method to change the displayed month
  void changeMonth(int month) {
    _displayedMonth = DateTime(_displayedMonth.year, month, 1);
    notifyListeners();
  }

  // Method to go to next month
  void nextMonth() {
    if (_displayedMonth.month == 12) {
      _displayedMonth = DateTime(_displayedMonth.year + 1, 1, 1);
    } else {
      _displayedMonth =
          DateTime(_displayedMonth.year, _displayedMonth.month + 1, 1);
    }
    notifyListeners();
  }

  // Method to go to previous month
  void previousMonth() {
    if (_displayedMonth.month == 1) {
      _displayedMonth = DateTime(_displayedMonth.year - 1, 12, 1);
    } else {
      _displayedMonth =
          DateTime(_displayedMonth.year, _displayedMonth.month - 1, 1);
    }
    notifyListeners();
  }

  // Method to get all dates to display in the calendar
  List<DateTime> getDaysInMonth() {
    final List<DateTime> days = [];

    // First day of the month
    final firstDayOfMonth =
        DateTime(_displayedMonth.year, _displayedMonth.month, 1);

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

  // Check if a date has events
  bool hasPosts(DateTime date) {
    // Normalize the date to compare only year, month, and day
    final normalizedDate = DateTime(date.year, date.month, date.day);

    // Check if there are events for this date
    return _posts.containsKey(normalizedDate) &&
        _posts[normalizedDate]!.isNotEmpty;
  }

  // Get events for a specific date
  List<dynamic> getPostsForDate(DateTime date) {
    // Normalize the date to compare only year, month, and day
    final normalizedDate = DateTime(date.year, date.month, date.day);

    // Return events for this date or empty list if none
    return _posts[normalizedDate] ?? [];
  }

  void navigateToPostReview() {
    navRouter.navigateToContentPreviewView();
  }
}
