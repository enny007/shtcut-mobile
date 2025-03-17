import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_service.dart';
import 'package:shtcut_mobile/core/service/local_storage_service.dart';

class MediaItem {
  final File file;
  final MediaType type;
  final String? thumbnail;
  final String? fileName;

  MediaItem({
    required this.file,
    required this.type,
    this.thumbnail,
    this.fileName,
  });
}

enum MediaType { image, video, file }

class MediaService extends BaseService {
  final _imagePicker = ImagePicker();
  final _prefsService = locator<SharedPreferencesService>();
  List<MediaItem> _selectedMedia = <MediaItem>[];

  List<MediaItem> get selectedMedia => _selectedMedia;

  //Permission handler
  Future<bool> _requestPermission(Permission permission) async {
    var status = await permission.status;

    if (status.isDenied) {
      // Show custom dialog before requesting permission
      // Return the result of the permission request
      status = await permission.request();
    }

    return status.isGranted;
  }

  Future<bool> showPermissionSheet({String resourceType = 'files'}) async {
    final alreadyPrompted =
        await _prefsService.wasPermissionPrompted(resourceType);

    if (alreadyPrompted) {
      // If already prompted, just return true to proceed
      return true;
    }
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.permission,
      isScrollControlled: true,
      data: {
        'resourceType': resourceType,
        'description':
            'To upload photos or videos from your device, apply effects to your photos, and download posts, allow access to your $resourceType.'
      },
    );
    if (response?.confirmed != null) {
      await _prefsService.setPermissionPrompted(resourceType);
    }

    return response?.confirmed ?? false;
  }

  Future<bool> addImage({bool fromCamera = false}) async {
    final permission = fromCamera ? Permission.camera : Permission.photos;

    final hasPermission = await _requestPermission(permission);
    if (!hasPermission) return false;

    try {
      final source = fromCamera ? ImageSource.camera : ImageSource.gallery;
      final pickedFile = await _imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        if (_selectedMedia.length >= 10) {
          _selectedMedia.removeAt(0);
        }

        _selectedMedia = [
          ..._selectedMedia,
          MediaItem(
            file: File(pickedFile.path),
            type: MediaType.image,
          ),
        ];
        return true;
      }
    } catch (e) {
      logger.i('Error picking image: $e');
    }
    return false;
  }

  Future<bool> addVideo({bool fromCamera = false}) async {
    final permission = fromCamera ? Permission.camera : Permission.photos;

    final hasPermission = await _requestPermission(permission);
    if (!hasPermission) return false;

    try {
      final source = fromCamera ? ImageSource.camera : ImageSource.gallery;
      final pickedFile = await _imagePicker.pickVideo(source: source);

      if (pickedFile != null) {
        if (_selectedMedia.length >= 10) {
          _selectedMedia.removeAt(0);
        }

        _selectedMedia = [
          ..._selectedMedia,
          MediaItem(
            file: File(pickedFile.path),
            type: MediaType.video,
          ),
        ];
        return true;
      }
    } catch (e) {
      logger.i('Error picking video: $e');
    }
    return false;
  }

  Future<bool> addFile() async {
    final shouldContinue = await showPermissionSheet(resourceType: 'files');

    if (!shouldContinue) return false;

    try {
      // Use FilePicker to pick files
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (result != null &&
          result.files.isNotEmpty &&
          result.files.first.path != null) {
        if (_selectedMedia.length >= 10) {
          _selectedMedia.removeAt(0);
        }

        final file = File(result.files.first.path!);
        final fileName = result.files.first.name;

        _selectedMedia = [
          ..._selectedMedia,
          MediaItem(
            file: file,
            type: MediaType.file,
            fileName: fileName,
          ),
        ];

        logger.i('File added: $fileName');
        return true;
      }
    } catch (e) {
      logger.i('Error picking file: $e');
    }
    return false;
  }

  void removeMedia(int index) {
    if (index >= 0 && index < _selectedMedia.length) {
      final newList = List<MediaItem>.from(_selectedMedia);
      newList.removeAt(index);
      _selectedMedia = newList;
    }
  }
}
