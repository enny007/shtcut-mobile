import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class TasksViewModel extends MBaseViewModel {
  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  // Task counts
  int allTasksCount = 8;
  int inProgressCount = 3;
  int doneCount = 2;

  // Sample task data
  List<Map<String, dynamic>> allTasks = [
    {
      'title': 'Create a video recording for live stream',
      'status': 'In Progress',
      'priority': 'High',
      'progress': 0.6,
      'dueDate': '27 Sept',
      'comments': 5,
      'statusColor': const Color(0xFFEAECF0),
      'priorityColor': const Color(0xFFC03744),
    },
    {
      'title': 'Design social media graphics for campaign',
      'status': 'To Do',
      'priority': 'Medium',
      'progress': 0.0,
      'dueDate': '30 Sept',
      'comments': 2,
      'statusColor': const Color(0xFFE5E7EB),
      'priorityColor': const Color(0xFFF59E0B),
    },
    {
      'title': 'Prepare content calendar for October',
      'status': 'Done',
      'priority': 'Low',
      'progress': 1.0,
      'dueDate': '25 Sept',
      'comments': 8,
      'statusColor': const Color(0xFFDCFCE7),
      'priorityColor': const Color(0xFF22C55E),
    },
    {
      'title': 'Review analytics from last campaign',
      'status': 'In Progress',
      'priority': 'Medium',
      'progress': 0.4,
      'dueDate': '28 Sept',
      'comments': 3,
      'statusColor': const Color(0xFFEAECF0),
      'priorityColor': const Color(0xFFF59E0B),
    },
    {
      'title': 'Brainstorm ideas for new product launch',
      'status': 'To Do',
      'priority': 'High',
      'progress': 0.0,
      'dueDate': '2 Oct',
      'comments': 0,
      'statusColor': const Color(0xFFE5E7EB),
      'priorityColor': const Color(0xFFC03744),
    },
    {
      'title': 'Update website copy for new features',
      'status': 'Done',
      'priority': 'Medium',
      'progress': 1.0,
      'dueDate': '22 Sept',
      'comments': 4,
      'statusColor': const Color(0xFFDCFCE7),
      'priorityColor': const Color(0xFFF59E0B),
    },
    {
      'title': 'Create email newsletter template',
      'status': 'In Progress',
      'priority': 'Low',
      'progress': 0.8,
      'dueDate': '29 Sept',
      'comments': 1,
      'statusColor': const Color(0xFFEAECF0),
      'priorityColor': const Color(0xFF22C55E),
    },
    {
      'title': 'Schedule social media posts for week',
      'status': 'To Do',
      'priority': 'Medium',
      'progress': 0.0,
      'dueDate': '1 Oct',
      'comments': 0,
      'statusColor': const Color(0xFFE5E7EB),
      'priorityColor': const Color(0xFFF59E0B),
    },
  ];

  // Filtered tasks based on status
  List<Map<String, dynamic>> get filteredTasks {
    if (_selectedTabIndex == 0) {
      return allTasks;
    } else if (_selectedTabIndex == 1) {
      return allTasks.where((task) => task['status'] == 'In Progress').toList();
    } else {
      return allTasks.where((task) => task['status'] == 'Done').toList();
    }
  }

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void navigateToTaskDetailView() {
    navRouter.navigateToTaskDetailsView();
  }
}
