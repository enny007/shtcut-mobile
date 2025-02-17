import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {
  int currentPage = 0;
  final pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/onboard_1.png',
      'title': 'Social Media Manager',
      'description':
          'Take charge of your social media with ease. Simply connect your accounts and experience more.'
    },
    {
      'image': 'assets/images/onboard_1.png',
      'title': 'Live Streams',
      'description':
          'Take charge of your social media with ease. Simply connect your accounts and experience more.'
    },
    {
      'image': 'assets/images/onboard_1.png',
      'title': 'AD Management',
      'description':
          'Take charge of your social media with ease. Simply connect your accounts and experience more.'
    },
    {
      'image': 'assets/images/onboard_1.png',
      'title': 'Welcome to Shtcut!',
      'description':
          'Take charge of your social media with ease. Simply connect your accounts and experience more.'
    },
  ];

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    pageController.jumpToPage(3);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
