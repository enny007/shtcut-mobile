import 'package:shared_preferences/shared_preferences.dart';
import 'package:shtcut_mobile/core/base/base_service.dart';

class SharedPreferencesService extends BaseService {
  late SharedPreferences _prefs;
  bool _isInitialized = false;

  // Keys for storing permission prompt status
  static const String _keyPermissionCameraPrompted =
      'permission_camera_prompted';
  static const String _keyPermissionPhotosPrompted =
      'permission_photos_prompted';
  static const String _keyPermissionFilesPrompted = 'permission_files_prompted';

  Future<void> init() async {
    if (!_isInitialized) {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
    }
  }

  // Permission prompt status getters and setters
  Future<bool> wasPermissionPrompted(String permissionType) async {
    await init();
    return _prefs.getBool(_getKeyForPermissionType(permissionType)) ?? false;
  }

  Future<void> setPermissionPrompted(String permissionType) async {
    await init();
    await _prefs.setBool(_getKeyForPermissionType(permissionType), true);
  }

  String _getKeyForPermissionType(String permissionType) {
    switch (permissionType) {
      case 'camera':
        return _keyPermissionCameraPrompted;
      case 'photos':
      case 'photo library':
        return _keyPermissionPhotosPrompted;
      case 'files':
      default:
        return _keyPermissionFilesPrompted;
    }
  }

  // Clear all stored preferences (useful for testing)
  Future<void> clearAll() async {
    await init();
    await _prefs.clear();
  }
}
