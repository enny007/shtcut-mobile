import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CheckableAccountTile extends StatefulWidget {
  final String imagePath;
  final String title;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CheckableAccountTile({
    Key? key,
    required this.imagePath,
    required this.title,
    this.initialValue = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CheckableAccountTile> createState() => _CheckableAccountTileState();
}

class _CheckableAccountTileState extends State<CheckableAccountTile> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
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
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(isChecked);
              }
            },
            activeColor: Theme.of(context).primaryColor,
          ),
          Gap(10.w),
          CircleAvatar(
            radius: 16.r,
            child: Image.asset(
              widget.imagePath,
              height: 32.h,
              width: 32.w,
            ),
          ),
          Gap(12.w),
          Expanded(
            child: Text(
              widget.title,
              style: context.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
