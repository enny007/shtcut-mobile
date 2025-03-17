import 'package:shtcut_mobile/app/app.bottomsheets.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HashtagModel extends BaseViewModel {
  Function(SheetResponse)? completer;

  HashtagModel({this.completer});
  Future<void> showAddHashtagSheet() async {
    completer!(SheetResponse(confirmed: true));
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addHashtag,
      isScrollControlled: true,
    );
  }
}
