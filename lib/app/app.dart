import 'package:spare_website/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:spare_website/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:spare_website/ui/views/home/home_view.dart';
import 'package:spare_website/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:spare_website/ui/views/privacy_policy/privacy_policy_view.dart';
import 'package:spare_website/ui/views/terms_and_conditions/terms_and_conditions_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true, path: '/'),
    MaterialRoute(page: TermsAndConditionsView, path: '/terms-and-conditions'),
    MaterialRoute(page: PrivacyPolicyView, path: '/privacy-policy'),
    MaterialRoute(page: StartupView, path: '/startup-view'),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
