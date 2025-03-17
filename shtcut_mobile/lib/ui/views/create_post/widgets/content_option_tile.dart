import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class ContentOptionTile extends StatelessWidget {
  const ContentOptionTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.svgPath,
  });
  final VoidCallback onTap;
  final String title;
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(svgPath),
      title: Text(
        title,
        style: context.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 24,
        color: Color(0xff726C6C),
      ),
      onTap: onTap,
    );
  }
}
