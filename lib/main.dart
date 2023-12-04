import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:zwmb/controller/theme_controller.dart';
import 'package:zwmb/helper/route_helper.dart';
import 'package:zwmb/theme/dark_theme.dart';
import 'package:zwmb/theme/light_theme.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/view/screens/root/not_found_screen.dart';
import 'helper/get_di.dart' as di;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}




class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetMaterialApp(
        
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        theme: themeController.darkTheme ? dark : light,
        fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
            AppConstants.languages[0].countryCode),
        initialRoute: RouteHelper.splash,
        getPages: RouteHelper.routes,
        unknownRoute: GetPage(name: '/', page: () => const NotFoundScreen()),
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: 500),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
      );
    });
  }
}
