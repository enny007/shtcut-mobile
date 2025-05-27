import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableChatTile extends StatelessWidget {
  const SelectableChatTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onSelect,
    this.imageUrl,
  });

  final String title;
  final String subtitle;
  final VoidCallback onSelect;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onSelect,
      leading: Container(
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10.r),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageUrl ?? 'assets/images/pic_1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xff151314),
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xff726C6C),
              fontWeight: FontWeight.w400,
            ),
      ),
      // trailing: Radio<bool>(
      //   value: true,
      //   groupValue: isSelected ? true : null,
      //   onChanged: (_) => onSelect(),
      //   activeColor: Theme.of(context).primaryColor,
      // ),
    );
  }
}
