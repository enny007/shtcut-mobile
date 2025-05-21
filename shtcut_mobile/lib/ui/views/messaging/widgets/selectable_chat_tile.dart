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
      onTap: onSelect,
      leading: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
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
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xff726C6C),
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
