import 'package:flutter/material.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class UnsplashViewModel extends MBaseViewModel {
  final _unsplashController = TextEditingController();

  TextEditingController get unsplashController => _unsplashController;

  final List<Map<String, String>> categories = [
    {'name': 'Nature', 'image': 'assets/images/splash_category.jpeg'},
    {'name': 'Black & White', 'image': 'assets/images/splash_category.jpeg'},
    {'name': 'Space', 'image': 'assets/images/splash_category.jpeg'},
    {'name': 'Textures', 'image': 'assets/images/splash_category.jpeg'},
    {'name': 'Abstract', 'image': 'assets/images/splash_category.jpeg'},
    {'name': 'Minimal', 'image': 'assets/images/splash_category.jpeg'},
  ];

  final List<Map<String, dynamic>> discoverImages = [
    {
      'id': '1',
      'image': 'assets/images/stock_image_1.jpeg',
      'isSelected': false,
    },
    {
      'id': '2',
      'image': 'assets/images/stock_image_2.jpeg',
      'isSelected': false,
    },
    {
      'id': '3',
      'image': 'assets/images/stock_image_1.jpeg',
      'isSelected': false,
    },
    {
      'id': '4',
      'image': 'assets/images/stock_image_2.jpeg',
      'isSelected': false,
    },
  ];

  // Method to toggle image selection
  void toggleImageSelection(String id) {
    final index = discoverImages.indexWhere((image) => image['id'] == id);
    if (index != -1) {
      discoverImages[index]['isSelected'] =
          !discoverImages[index]['isSelected'];
      notifyListeners();
    }
  }

  // Get the count of selected images
  int get selectedImagesCount =>
      discoverImages.where((image) => image['isSelected'] == true).length;

  @override
  void dispose() {
    _unsplashController.dispose();
    super.dispose();
  }
}
