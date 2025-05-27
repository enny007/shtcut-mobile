import 'package:flutter/material.dart';
import 'package:shtcut_mobile/ui/views/ad_management/ad_management_view_model.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:stacked/stacked.dart';

class AdManagementView extends StackedView<AdManagementViewModel> {
  const AdManagementView({super.key});

  @override
  Widget builder(
      BuildContext context, AdManagementViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(),
    );
  }

  @override
  AdManagementViewModel viewModelBuilder(BuildContext context) {
    return AdManagementViewModel();
  }
}
