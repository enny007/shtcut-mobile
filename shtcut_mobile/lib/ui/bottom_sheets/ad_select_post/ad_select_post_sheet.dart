import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/ad_select_post/ad_select_post_model.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/ad_select_post/widgets/select_post_tile.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdSelectPostSheet extends StackedView<AdSelectPostModel> {
  const AdSelectPostSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, AdSelectPostModel viewModel, Widget? child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 23.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Post',
                style: context.displaySmall!.copyWith(
                  color: const Color(0xff101828),
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () => completer!(
                  SheetResponse(confirmed: true),
                ),
                child: const Icon(
                  Icons.close,
                  color: Color(0xff433E3F),
                ),
              ),
            ],
          ),
          Gap(18.h),
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return Gap(6.h);
            },
            itemBuilder: (BuildContext context, int index) {
              return const SelectPostTile();
            },
          ),
        ],
      ),
    );
  }

  @override
  AdSelectPostModel viewModelBuilder(BuildContext context) {
    return AdSelectPostModel();
  }
}
