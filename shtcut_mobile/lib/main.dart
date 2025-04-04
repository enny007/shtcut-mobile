import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetup.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      const MainApp(),
    );
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get device information to determine if it's a tablet
    final data = MediaQueryData.fromView(View.of(context));
    final isTablet = data.size.shortestSide >= 600;

    // Choose design size based on device type
    final designSize = isTablet
        ? const Size(834, 1194) // iPad Air dimensions as an example
        : const Size(390, 844); // iPhone dimensions
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ToastificationWrapper(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            initialRoute: Routes.homeView,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
          ),
        ),
      ),
    );
  }
}
