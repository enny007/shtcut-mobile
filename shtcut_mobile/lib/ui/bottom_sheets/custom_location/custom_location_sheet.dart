import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/custom_location/custom_location_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomLocationSheet extends StackedView<CustomLocationModel> {
  const CustomLocationSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, CustomLocationModel viewModel, Widget? child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
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
          // Handle bar
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Header with close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Custom Locations',
                style: context.displaySmall!.copyWith(
                  color: const Color(0xff101828),
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () => completer!(SheetResponse(confirmed: true)),
                child: const Icon(
                  Icons.close,
                  color: Color(0xff433E3F),
                ),
              ),
            ],
          ),

          Gap(17.h),

          // Search field
          AppTextField(
            controller: viewModel.searchController,
            validator: (_) {
              return null;
            },
            hintText: 'Search location',
            prefixIcon: SvgPicture.asset(
              'assets/svgs/search.svg',
              fit: BoxFit.scaleDown,
            ),
          ),

          Gap(21.h),

          // Selected countries count (optional display)
          if (viewModel.selectedCountries.isNotEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: kcPrimaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: kcPrimaryColor.withValues(alpha: .3),
                ),
              ),
              child: Text(
                '${viewModel.selectedCountries.length} ${viewModel.selectedCountries.length == 1 ? 'country' : 'countries'} selected',
                style: context.bodySmall!.copyWith(
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

          // Countries list
          Expanded(
            child: ListView.separated(
              itemCount: viewModel.filteredCountries.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Divider(
                height: 1.h,
                color: const Color(0xffE4E7EC),
              ),
              itemBuilder: (context, index) {
                final country = viewModel.filteredCountries[index];
                final isSelected = viewModel.isCountrySelected(country);

                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 8.h,
                  ),
                  leading: Checkbox(
                    value: isSelected,
                    onChanged: (bool? value) {
                      viewModel.toggleCountrySelection(country);
                    },
                    activeColor: kcPrimaryColor,
                    checkColor: Colors.white,
                    side: BorderSide(
                      color:
                          isSelected ? kcPrimaryColor : const Color(0xffCCCBCB),
                      width: 2.w,
                    ),
                  ),
                  title: Text(
                    country,
                    style: context.bodyMedium!.copyWith(
                      color: const Color(0xff101828),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    viewModel.toggleCountrySelection(country);
                  },
                );
              },
            ),
          ),
          Gap(16.h),

          // Done button
          SizedBox(
            width: double.infinity,
            child: AppButton(
              callback: () {
                // Pass selected countries back through completer
                completer!(SheetResponse(
                  confirmed: true,
                  data: viewModel.selectedCountries,
                ));
              },
              text: viewModel.selectedCountries.isEmpty
                  ? 'Done'
                  : 'Done (${viewModel.selectedCountries.length})',
              color: kcPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  CustomLocationModel viewModelBuilder(BuildContext context) {
    final model = CustomLocationModel();

    // Get the callback from request.data and set it in the model
    if (request.data != null && request.data['onSelectionChanged'] != null) {
      model.setOnSelectionChanged(request.data['onSelectionChanged']);
    }

    return model;
  }
}
