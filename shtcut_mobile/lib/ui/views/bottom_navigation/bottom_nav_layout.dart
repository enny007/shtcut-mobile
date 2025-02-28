import 'package:flutter/material.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_model.dart';
import 'package:stacked/stacked.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class BottomNavLayout extends StackedView<BottomNavLayoutModel> {
  final Widget child;
  const BottomNavLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget builder(BuildContext context, BottomNavLayoutModel viewModel, Widget? child) {
    return Scaffold(
      body: this.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kcPrimaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  BottomNavLayoutModel viewModelBuilder(BuildContext context) => BottomNavLayoutModel();
}

