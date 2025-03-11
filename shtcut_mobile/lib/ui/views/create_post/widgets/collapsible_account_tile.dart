import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CollapsibleAccountTile extends StatefulWidget {
  const CollapsibleAccountTile({
    Key? key,
    required this.svgPath,
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
  }) : super(key: key);

  final String svgPath;
  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;

  @override
  State<CollapsibleAccountTile> createState() => _CollapsibleAccountTileState();
}

class _CollapsibleAccountTileState extends State<CollapsibleAccountTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffFEFEFE),
        border: Border.all(
          color: const Color(0xffE3E3E3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _toggleExpanded,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(
                  widget.svgPath,
                  fit: BoxFit.scaleDown,
                ),
                title: Text(
                  widget.title,
                  style: context.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: kcTextHeadingColor,
                  ),
                ),
                subtitle: Text(
                  'Select Profile',
                  style: context.bodySmall!.copyWith(
                    color: kcTextColor,
                  ),
                ),
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
          ClipRect(
            child: AnimatedBuilder(
              animation: _controller.view,
              builder: (context, child) {
                return Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
