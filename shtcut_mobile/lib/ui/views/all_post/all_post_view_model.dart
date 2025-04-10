import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class AllPostViewModel extends MBaseViewModel {
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  // Add methods to fetch scheduled and live posts
  final giveAway = [
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_2.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_2.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_2.png')),
  ];

  List<Map<String, dynamic>> getScheduledPosts() {
    return [
      {
        'title': 'Marketing Campaign for New Product Launch',
        'scheduledTime': '20/01/24 08:00am',
        'socialIcons': giveAway,
        'imageUrl': 'assets/images/pic_2.png',
        'additionalImagesCount': 10,
      },
      {
        'title': 'Weekly Team Update',
        'scheduledTime': '20/01/24 08:00am',
        'socialIcons': giveAway.take(2).toList(),
        'imageUrl': null,
        'additionalImagesCount': 0,
      },
      {
        'title': 'Customer Testimonial Series',
        'scheduledTime': '20/01/24 08:00am',
        'socialIcons': giveAway,
        'imageUrl': 'assets/images/pic_2.png',
        'additionalImagesCount': 5,
      },
    ];
  }

  // Sample data for live posts
  List<Map<String, dynamic>> getLivePosts() {
    return [
      // {
      //   'title': 'Product Demo Livestream',
      //   'scheduledTime': 'Posted 2 hours ago',
      //   'socialIcons': giveAway,
      //   'imageUrl': 'assets/images/pic_2.png',
      //   'additionalImagesCount': 3,
      // },
      // {
      //   'title': 'Company Update Announcement',
      //   'scheduledTime': 'Posted yesterday',
      //   'socialIcons': giveAway.take(2).toList(),
      //   'imageUrl': null,
      //   'additionalImagesCount': 0,
      // },
    ];
  }

  void showPublishPost() {
    bottomSheetService.showCustomSheet(
      variant: BottomSheetType.postPublish,
      isScrollControlled: true,
    );
  }

  void navigateToEditPost(){
    navRouter.navigateToCreatePostContentView(
      isEditView: true,
    );
  }
}
