import 'package:flutter/material.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/action_sheet/action_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ActionSheet extends StackedView<ActionModel> {
  const ActionSheet({super.key, this.completer, required this.request});
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(BuildContext context, ActionModel viewModel, Widget? child) {
    return Container();
  }

  @override
  ActionModel viewModelBuilder(BuildContext context) {
    return ActionModel();
  }
}
