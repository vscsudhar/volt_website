import 'package:flutter/material.dart';
import 'package:spare_website/app/app.bottomsheets.dart';
import 'package:spare_website/app/app.dialogs.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:spare_website/ui/common/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoltSpare — EV & Petrol Two-Wheeler Spare Parts',
      debugShowCheckedModeBanner: false,
      theme: getVoltSpareTheme(),
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
