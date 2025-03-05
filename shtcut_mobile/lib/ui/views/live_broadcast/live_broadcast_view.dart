import 'package:flutter/material.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';

class LiveBroadcastView extends StatelessWidget {
  const LiveBroadcastView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavLayout(
      child: Scaffold(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
