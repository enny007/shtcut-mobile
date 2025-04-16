import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:shtcut_mobile/ui/views/media_library/widgets/media_card.dart';

class MediaLibraryViewModel extends MBaseViewModel {
  final mediaContentController = TextEditingController();

  int _currentTabIndex = 0;
  final List<bool> _selectedItems = [];

  // Dummy data for each category
  final List<Map<String, dynamic>> _allMedia = [];
  final List<Map<String, dynamic>> _images = [];
  final List<Map<String, dynamic>> _videos = [];
  final List<Map<String, dynamic>> _files = [];
  final List<Map<String, dynamic>> _folders = [];

  int get currentTabIndex => _currentTabIndex;

  List<Map<String, dynamic>> get currentTabItems {
    switch (_currentTabIndex) {
      case 0:
        return _allMedia;
      case 1:
        return _images;
      case 2:
        return _videos;
      case 3:
        return _files;
      case 4:
        return _folders;
      default:
        return _allMedia;
    }
  }

  bool isItemSelected(int index) {
    if (index >= _selectedItems.length) return false;
    return _selectedItems[index];
  }

  void toggleItemSelection(int index) {
    if (index >= _selectedItems.length) {
      _selectedItems.addAll(
          List.generate(index + 1 - _selectedItems.length, (_) => false));
    }
    _selectedItems[index] = !_selectedItems[index];
    notifyListeners();
  }

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  MediaLibraryViewModel() {
    initializeDummyData();
  }

  void initializeDummyData() {
    // Images
    _images.addAll([
      {
        'name': 'Beach Vacation.jpg',
        'date': DateTime.now().subtract(const Duration(days: 5)),
        'type': MediaType.image,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      },
      {
        'name': 'Family Photo.jpg',
        'date': DateTime.now().subtract(const Duration(days: 10)),
        'type': MediaType.image,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1609220136736-443140cffec6',
      },
      {
        'name': 'Mountain Trip.jpg',
        'date': DateTime.now().subtract(const Duration(days: 15)),
        'type': MediaType.image,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      },
      {
        'name': 'City Skyline.jpg',
        'date': DateTime.now().subtract(const Duration(days: 20)),
        'type': MediaType.image,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df',
      },
    ]);

    // Videos
    _videos.addAll([
      {
        'name': 'Project Presentation.mp4',
        'date': DateTime.now().subtract(const Duration(days: 3)),
        'type': MediaType.video,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1536240478700-b869070f9279',
      },
      {
        'name': 'Birthday Party.mp4',
        'date': DateTime.now().subtract(const Duration(days: 8)),
        'type': MediaType.video,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1516992654410-9309d4587e94',
      },
      {
        'name': 'Product Demo.mp4',
        'date': DateTime.now().subtract(const Duration(days: 12)),
        'type': MediaType.video,
        'thumbnailUrl':
            'https://images.unsplash.com/photo-1492619375914-88005aa9e8fb',
      },
    ]);

    // Files
    _files.addAll([
      {
        'name': 'Financial Report.pdf',
        'date': DateTime.now().subtract(const Duration(days: 2)),
        'type': MediaType.file,
        'fileFormat': 'pdf',
      },
      {
        'name': 'Project Proposal.docx',
        'date': DateTime.now().subtract(const Duration(days: 7)),
        'type': MediaType.file,
        'fileFormat': 'docx',
      },
      {
        'name': 'Budget Spreadsheet.xlsx',
        'date': DateTime.now().subtract(const Duration(days: 14)),
        'type': MediaType.file,
        'fileFormat': 'xlsx',
      },
      {
        'name': 'Meeting Notes.txt',
        'date': DateTime.now().subtract(const Duration(days: 18)),
        'type': MediaType.file,
        'fileFormat': 'txt',
      },
      {
        'name': 'Presentation Slides.pptx',
        'date': DateTime.now().subtract(const Duration(days: 22)),
        'type': MediaType.file,
        'fileFormat': 'pptx',
      },
    ]);

    // Folders
    _folders.addAll([
      {
        'name': 'Project Documents',
        'date': DateTime.now().subtract(const Duration(days: 1)),
        'type': MediaType.folder,
      },
      {
        'name': 'Vacation Photos',
        'date': DateTime.now().subtract(const Duration(days: 6)),
        'type': MediaType.folder,
      },
      {
        'name': 'Client Presentations',
        'date': DateTime.now().subtract(const Duration(days: 11)),
        'type': MediaType.folder,
      },
    ]);

    // All Media (combine all categories)
    _allMedia.addAll([..._folders, ..._images, ..._videos, ..._files]);

    // Initialize selection state
    _selectedItems.addAll(List.generate(_allMedia.length, (_) => false));
  }

  Future<void> showManageLibrarySheet() async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.manageLibrary,
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    mediaContentController.dispose();
    super.dispose();
  }
}
