import 'package:flutter/material.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  //SpaceXCard...
  final spaceItem = [
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
  ];

  final liveStream = [
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_1.png')),
  ];
  final giveAway = [
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_2.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_2.png')),
    const CircleAvatar(backgroundImage: AssetImage('assets/images/pic_2.png')),
  ];

  void navigateToUserProfile() {
    navRouter.navigateToUserProfileView();
  }
}
