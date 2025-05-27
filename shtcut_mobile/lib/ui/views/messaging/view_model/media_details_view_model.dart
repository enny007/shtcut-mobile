import 'package:shtcut_mobile/core/base/base_view_model.dart';

enum MediaViewType { media, docs, links }

class MediaDetailsViewModel extends MBaseViewModel {
  MediaViewType _mediaViewType = MediaViewType.media;

  MediaViewType get mediaViewType => _mediaViewType;

  void setMediaViewType(MediaViewType value) {
    _mediaViewType = value;
    notifyListeners();
  }
}
