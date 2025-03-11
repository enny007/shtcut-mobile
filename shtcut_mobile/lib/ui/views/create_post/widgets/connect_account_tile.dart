import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectAccountTile extends StatelessWidget {
  const ConnectAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: double.infinity,
      // padding: EdgeInsets.symmetric(
      //   horizontal: 16.w,
      //   vertical: 12.h,
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: const Color(0xffFEFEFE),
        border: Border.all(
          color: const Color(0xffE3E3E3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
         
        ],
      ),
    );
  }
}