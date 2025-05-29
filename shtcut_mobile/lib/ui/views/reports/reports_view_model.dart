import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class ReportsViewModel extends MBaseViewModel {
  final searchController = TextEditingController();

  List<Map<String, dynamic>> get reports => [
        {
          'profileImage': 'assets/images/pic_1.png',
          'socialMediaIcon': 'assets/svgs/facebook_logo.svg',
          'userName': 'John Doe',
          'actionText': 'Commented on',
          'postContent':
              'This is an amazing wellness program that has helped me improve my daily routine and overall health. Highly recommend it to everyone!',
          'timeAgo': '8 mins',
        },
        {
          'profileImage': 'assets/images/pic_2.png',
          'socialMediaIcon': 'assets/svgs/instagram_logo.svg',
          'userName': 'Jane Smith',
          'actionText': 'Posted on',
          'postContent':
              'Starting my wellness journey today! Excited to see the positive changes this will bring to my life.',
          'timeAgo': '15 mins',
        },
        {
          'profileImage': 'assets/images/pic_1.png',
          'socialMediaIcon': 'assets/svgs/tiktok_logo.svg',
          'userName': 'John Doe',
          'actionText': 'Commented on',
          'postContent':
              'This is an amazing wellness program that has helped me improve my daily routine and overall health. Highly recommend it to everyone!',
          'timeAgo': '8 mins',
        },
        {
          'profileImage': 'assets/images/pic_2.png',
          'socialMediaIcon': 'assets/svgs/x_logo.svg',
          'userName': 'Jane Smith',
          'actionText': 'Posted on',
          'postContent':
              'Starting my wellness journey today! Excited to see the positive changes this will bring to my life.',
          'timeAgo': '15 mins',
        },
        {
          'profileImage': 'assets/images/pic_1.png',
          'socialMediaIcon': 'assets/svgs/x_logo.svg',
          'userName': 'John Doe',
          'actionText': 'Commented on',
          'postContent':
              'This is an amazing wellness program that has helped me improve my daily routine and overall health. Highly recommend it to everyone!',
          'timeAgo': '8 mins',
        },
        {
          'profileImage': 'assets/images/pic_2.png',
          'socialMediaIcon': 'assets/svgs/youtube_logo.svg',
          'userName': 'Jane Smith',
          'actionText': 'Posted on',
          'postContent':
              'Starting my wellness journey today! Excited to see the positive changes this will bring to my life.',
          'timeAgo': '15 mins',
        },
        // Add more sample data as needed
      ];

  void submitReply(int postIndex, String reply) {
    // Handle reply submission logic here
    print('Reply to post $postIndex: $reply');
    // You can add logic to save the reply, send to API, etc.
  }

  Future<void> showFilterSheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.reportFilter,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
