import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/permission_sheet/permission_sheet_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PermissionSheet extends StackedView<PermissionSheetModel> {
  const PermissionSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, PermissionSheetModel viewModel, Widget? child) {
    final resourceType = request.data?['resourceType'] ?? 'photo library';
    final description = request.data?['description'] ??
        'To upload photos or videos from your device, apply effects to your photos, and download posts, allow access to your photos.';
    return SheetWidget(
      height: 350.h,
      icon: SvgPicture.asset('assets/svgs/permission_image.svg'),
      children: [
        Text(
          'SHTCUT would like to access your $resourceType',
          style: context.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff101828),
          ),
          textAlign: TextAlign.center,
        ),
        Gap(10.h),
        Text(
          description,
          style: context.bodySmall!.copyWith(
            color: kcSubHeadingColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(34.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          text: 'Allow Access',
          color: kcPrimaryColor,
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: false));
          },
          text: 'Don\'t Allow',
          border: Border.all(
            color: kcPrimaryColor,
            width: 2.w,
          ),
          color: Colors.transparent,
          textColor: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  PermissionSheetModel viewModelBuilder(BuildContext context) {
    return PermissionSheetModel();
  }
}
