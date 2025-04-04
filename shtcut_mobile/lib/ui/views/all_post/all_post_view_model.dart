import 'package:shtcut_mobile/core/base/base_view_model.dart';

class AllPostViewModel extends MBaseViewModel{
   int _currentTabIndex = 0;
  
  int get currentTabIndex => _currentTabIndex;
  
  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
  
  // Add methods to fetch scheduled and live posts
  List<Map<String, dynamic>> getScheduledPosts() {
    // This would fetch from your data source
    return [
      // Sample data for scheduled posts
      {
        'title': 'Marketing Campaign',
        'date': 'Tomorrow, 10:00 AM',
        'platforms': ['Instagram', 'Twitter', 'Facebook'],
        'imageUrl': 'assets/images/post_sample.png',
      },
      {
        'title': 'Product Launch',
        'date': 'Aug 15, 2:30 PM',
        'platforms': ['Instagram', 'LinkedIn'],
        'imageUrl': 'assets/images/post_sample.png',
      },
    ];
  }
  
  List<Map<String, dynamic>> getLivePosts() {
    // This would fetch from your data source
    return [
      // Sample data for live posts
      {
        'title': 'Weekly Update',
        'date': 'Posted 2 hours ago',
        'platforms': ['Instagram', 'Twitter'],
        'imageUrl': 'assets/images/post_sample.png',
      },
      {
        'title': 'Customer Testimonial',
        'date': 'Posted yesterday',
        'platforms': ['Facebook', 'LinkedIn'],
        'imageUrl': 'assets/images/post_sample.png',
      },
    ];
  }
}