import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class ContentPreviewViewModel extends MBaseViewModel {
  List<String> _selectedSocialTypes = [];

  List<String> get selectedSocialTypes => _selectedSocialTypes;

  void updateSelectedSocialTypes(List<String> types) {
    _selectedSocialTypes = types;
    notifyListeners();
  }

  final List<Map<String, dynamic>> posts = [
    {
      'profileImageUrl': 'https://randomuser.me/api/portraits/women/43.jpg',
      'username': 'sarah_design',
      'postImages': [
        'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
        'https://images.unsplash.com/photo-1542744173-8e7e53415bb0',
      ],
      'caption':
          'Working on some exciting new designs for our upcoming project! #design #creativity',
      'likesCount': 243,
      'commentsCount': 42,
      'isLiked': true,
      'isBookmarked': false,
    },
    {
      'profileImageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
      'username': 'tech_mike',
      'postImages': [
        'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d',
      ],
      'caption':
          'Just got my hands on the latest tech gadget. Review coming soon!',
      'likesCount': 187,
      'commentsCount': 23,
      'isLiked': false,
      'isBookmarked': true,
    },
  ];

  Future<void> showCalendar() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.schedulePost,
      isScrollControlled: true,
    );
  }

  Future<void> showSuccessfulPosting() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.publishPost,
      isScrollControlled: true,
    );
  }
}
