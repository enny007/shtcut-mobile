import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupProfilePictureModel extends MBaseViewModel {
  final ImagePicker _picker = ImagePicker();

  // Take a photo using the camera
  Future<void> takePhoto(Function(SheetResponse) completer) async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (photo != null) {
        completer(SheetResponse(
          confirmed: true,
          data: File(photo.path),
        ));
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  // Choose a photo from the gallery
  Future<void> chooseFromGallery(Function(SheetResponse) completer) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        completer(SheetResponse(
          confirmed: true,
          data: File(image.path),
        ));
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  // Close the sheet without selecting an image
  void closeSheet(Function(SheetResponse) completer) {
    completer(SheetResponse(confirmed: false));
  }
}
