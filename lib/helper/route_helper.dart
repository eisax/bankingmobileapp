import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/view/screens/airtime/airtime_screen.dart';
import 'package:zwmb/view/screens/auth/auth_screen.dart';
import 'package:zwmb/view/screens/beneficiaries/beneficiaries_screen.dart';
import 'package:zwmb/view/screens/billpay/bill_pap_screen.dart';
import 'package:zwmb/view/screens/bottomnav/bottom_navigation_bar.dart';
import 'package:zwmb/view/screens/home/home_screen.dart';
import 'package:zwmb/view/screens/splash/splash_screen.dart';
import 'package:zwmb/view/screens/transfers/transfer/internal_transfer.dart';
import 'package:zwmb/view/screens/transfers/transfer/rtgs_transfer.dart';
import 'package:zwmb/view/screens/transfers/transfers_screen.dart';
import 'package:zwmb/view/welcome/welcome_screen.dart';
import 'package:zwmb/view/widget/sample.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String auth = '/auth';

  static const String transfers = '/transfers';
  static const String billspay = '/billspay';
  static const String airtime = '/airtime';
  static const String beneficiaries = '/beneficiaries';
  static const String bottomBar = '/bottomBar';
  static const String welcome = '/welcome';

  static const String internalTransfer = '/internalTransfer';
  static const String rtgsTransfer = '/rtgsTransfer';
  static const String samp = '/samp';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getHomeRoute(String name) => '$home?name=$name';
  static getAuthRoute(String name) => '$auth?name=$name';

  static getTransfersRoute(String name) => '$transfers?name=$name';
  static getBillsPayRoute(String name) => '$billspay?name=$name';
  static getAirtimeRoute(String name) => '$airtime?name=$name';
  static getBeneficiariesRoute(String name) => '$beneficiaries?name=$name';
  static getBottomBarRoute(String name) => '$bottomBar?name=$name';
  static getWelcomeRoute(String name) => '$welcome?name=$name';

  static getInternalTransferRoute(String name) => '$internalTransfer?name=$name';
  static getRtgsTransferRoute(String name) => '$rtgsTransfer?name=$name';

  static getSampRoute(String name) => '$samp?name=$name';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: home,
      page: () => HomeSCreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: auth,
      page: () => AuthScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: transfers,
      page: () => TransfersScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: billspay,
      page: () => BillsPayScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: airtime,
      page: () => AirtimeScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: beneficiaries,
      page: () => BeneficiariesScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: bottomBar,
      page: () => BottomNavBar(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: welcome,
      page: () => WelcomeScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: internalTransfer,
      page: () => InternalTransfersScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
     GetPage(
      name: rtgsTransfer,
      page: () => RTGSTransferScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: samp,
      page: () => FundTransferScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
