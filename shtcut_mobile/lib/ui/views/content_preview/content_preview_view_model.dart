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

  void toggleSocialPlatform(String platformId) {
    if (_selectedSocialTypes.contains(platformId)) {
      _selectedSocialTypes.remove(platformId);
    } else {
      // For simplicity, we'll just select one platform at a time
      // You can modify this to allow multiple selections if needed
      _selectedSocialTypes = [platformId];
    }
    notifyListeners();
  }

  String get currentPreviewType {
    if (_selectedSocialTypes.isEmpty) {
      return ''; // Default to Instagram if nothing selected
    }
    return _selectedSocialTypes.first
        .toLowerCase(); // Use the first selected type
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

  final Map<String, dynamic> twitterPost = {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
    'username': 'Tech Mike',
    'handle': 'tech_mike',
    'tweetText':
        'Just got my hands on the latest tech gadget. Review coming soon! #tech #gadgets #review',
    'tweetImages': [
      'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d',
      'https://images.unsplash.com/photo-1542744173-8e7e53415bb0',
    ],
    'retweetCount': 42,
    'likesCount': 187,
    'viewsCount': 1243,
    'isLiked': false,
    'isRetweeted': false,
    'isBookmarked': false,
    'tweetTime': DateTime.now().subtract(const Duration(hours: 2)),
  };

  final Map<String, dynamic> facebookPost = {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
    'username': 'Tech Mike',
    'postText':
        'Just got my hands on the latest tech gadget. Review coming soon! This is going to be a game changer for the industry. Stay tuned for more updates!',
    'postImages': [
      'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d',
      'https://images.unsplash.com/photo-1542744173-8e7e53415bb0',
      'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
    ],
  };

  final Map<String, dynamic> tiktokPost = {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
    'username': 'tech_mike',
    'caption':
        'Check out this amazing new tech gadget! #tech #gadgets #review #trending',
    'mediaUrls': [
      'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d',
      'https://images.unsplash.com/photo-1542744173-8e7e53415bb0',
      'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
    ],
    'isVideo': false,
    'soundName': 'Original Sound - Tech Mike',
  };

  // Video version of TikTok post
  final Map<String, dynamic> tiktokVideoPost = {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
    'username': 'tech_mike',
    'caption':
        'Unboxing the latest tech gadget! #tech #gadgets #unboxing #viral',
    'mediaUrls': [
      'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d', // This would be a video thumbnail in a real app
    ],
    'isVideo': true,
    'soundName': 'Original Sound - Tech Mike',
  };

  final Map<String, dynamic> linkedinPost = {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
    'username': 'Mike Johnson',
    'userTitle': 'Senior Product Manager at Tech Innovations',
    'postText':
        'Excited to share that we\'ve just launched our latest product! After months of hard work from our amazing team, we\'re proud to introduce a revolutionary tech gadget that will change how you interact with your devices. #ProductLaunch #Innovation #Technology',
    'postImages': [
      'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d',
      'https://images.unsplash.com/photo-1542744173-8e7e53415bb0',
    ],
  };

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
