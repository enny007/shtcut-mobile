import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CollapsibleDropdown extends StatefulWidget {
  final String title;
  final int count;
  final String subtitle;
  final List<Widget> children;
  final bool initiallyExpanded;

  const CollapsibleDropdown({
    Key? key,
    required this.title,
    required this.count,
    required this.subtitle,
    required this.children,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<CollapsibleDropdown> createState() => _CollapsibleDropdownState();
}

class _CollapsibleDropdownState extends State<CollapsibleDropdown>
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _toggleExpanded,
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.title,
                              style: context.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff101828),
                              ),
                            ),
                            Gap(4.w),
                            Container(
                              height: 20.h,
                              width: 20.w,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 8.w, vertical: 2.h,),
                              decoration: BoxDecoration(
                                color: const Color(0xffDCE5FB),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                widget.count.toString(),
                                style: context.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: kcPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(4.h),
                        Text(
                          widget.subtitle,
                          style: context.bodySmall!.copyWith(
                            color: const Color(0xff475467),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotationTransition(
                    turns: _iconTurns,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 24.sp,
                    ),
                  ),
                ],
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
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.children,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
