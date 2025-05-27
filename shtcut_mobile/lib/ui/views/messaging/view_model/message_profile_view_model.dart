import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class MessageProfileViewModel extends MBaseViewModel {
  final List<Map<String, dynamic>> profileList = [
    {
      'assetName': 'assets/svgs/call.svg',
      'actionName': 'Audio',
    },
    {
      'assetName': 'assets/svgs/video_profile.svg',
      'actionName': 'Video',
    },
    {
      'assetName': 'assets/svgs/notification_profile.svg',
      'actionName': 'Mute',
    },
    {
      'assetName': 'assets/svgs/search-normal.svg',
      'actionName': 'Search',
    },
  ];

  final members = <Map<String, dynamic>>[
    {
      'title': 'John Doe',
      'isAdmin': true,
    },
    {
      'title': 'Jane Doe',
      'isAdmin': true,
    },
    {
      'title': 'John Smith',
      'isAdmin': false,
    },
    {
      'title': 'Jane Smith',
      'isAdmin': false,
    },
  ];

  void navigateToMediaDetails() {
    navRouter.navigateToMediaDetailsView();
  }
}
