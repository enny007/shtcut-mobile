import 'package:flutter/cupertino.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/service/media_service.dart';
import 'package:stacked/stacked.dart';

class CreatePostViewModel extends ReactiveViewModel {
  final _mediaService = locator<MediaService>();

  List<MediaItem> get selectedMedia => _mediaService.selectedMedia;
  bool get hasMedia => selectedMedia.isNotEmpty;
  int get mediaCount => selectedMedia.length;
  bool get canAddMoreMedia => selectedMedia.length < 10;

  CreatePostViewModel() {
    initContentOptions();
  }
  final List<Map<String, String>> accounts = [
    {
      'svgPath': 'assets/svgs/x_logo.svg',
      'title': 'Twitter',
    },
    {
      'svgPath': 'assets/svgs/facebook_logo.svg',
      'title': 'Facebook',
    },
    {
      'svgPath': 'assets/svgs/tiktok_logo.svg',
      'title': 'Tiktok',
    },
    {
      'svgPath': 'assets/svgs/youtube_logo.svg',
      'title': 'Youtube',
    },
    {
      'svgPath': 'assets/svgs/linkedin_logo.svg',
      'title': 'LinkedIn',
    },
    {
      'svgPath': 'assets/svgs/pinterest_logo.svg',
      'title': 'Pinterest',
    },
    {
      'svgPath': 'assets/svgs/threads_logo.svg',
      'title': 'Thread',
    },
  ];

  void navigateToContentView() {
    navRouter.navigateToCreatePostContentView();
  }

  ///content view
  TextEditingController contentController = TextEditingController();
  String? contentValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  final List<Map<String, dynamic>> contentOptions = [
    {
      'svgPath': 'assets/svgs/content_gallery.svg',
      'title': 'Add Image',
      'onTap': () => {},
    },
    {
      'svgPath': 'assets/svgs/content_video.svg',
      'title': 'Video',
      'onTap': () => {},
    },
    {
      'svgPath': 'assets/svgs/folder.svg',
      'title': 'Add File',
      'onTap': () => {},
    },
    {
      'svgPath': 'assets/svgs/unsplash.svg',
      'title': 'Unsplash',
      'onTap': () => {},
    },
    {
      'svgPath': 'assets/svgs/hashtag.svg',
      'title': 'Hashtag',
      'onTap': () => {},
    },
    {
      'svgPath': 'assets/svgs/tag.svg',
      'title': 'Labels',
      'onTap': () => {},
    },
  ];

  void initContentOptions() {
    contentOptions[0]['onTap'] = () async {
      final added = await addImage();
      if (added) notifyListeners();
    };

    contentOptions[1]['onTap'] = () async {
      final added = await addVideo();
      if (added) notifyListeners();
    };

    contentOptions[2]['onTap'] = () async {
      final added = await addFile();
      if (added) notifyListeners();
    };

    contentOptions[4]['onTap'] = () async {
      showHashTagSheet();
    };

    contentOptions[5]['onTap'] = () async {
      showLabelSheet();
    };

    // Initialize other options...
  }

  Future<bool> addImage({bool fromCamera = false}) async {
    return await _mediaService.addImage(fromCamera: fromCamera);
  }

  Future<bool> addVideo({bool fromCamera = false}) async {
    return await _mediaService.addVideo(fromCamera: fromCamera);
  }

  Future<bool> addFile() async {
    return await _mediaService.addFile();
  }

  Future<void> showHashTagSheet() async {
    // navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.hashtag,
      isScrollControlled: true,
    );
  }

  Future<void> showLabelSheet() async {
    // navRouter.back();
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.labelManager,
      isScrollControlled: true,
    );
  }

  void removeMedia(int index) {
    _mediaService.removeMedia(index);
    notifyListeners();
  }
}
