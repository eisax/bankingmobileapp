import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/helper/route_helper.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';
import 'package:zwmb/view/screens/transfers/transfer/internal_transfer.dart';
import 'package:zwmb/view/screens/transfers/transfer/rtgs_transfer.dart';
import 'package:zwmb/view/screens/transfers/transfer/zipit_transfer.dart';
import 'package:zwmb/view/widget/custom_card_widget.dart';
import 'package:zwmb/view/widget/ex.dart';
import 'package:zwmb/view/widget/modal_bottom_sheet.dart';
import 'package:zwmb/view/widget/sample.dart';
import 'package:zwmb/view/widget/transaction_history.dart';

class TransfersScreen extends StatefulWidget {
  const TransfersScreen({super.key});

  @override
  State<TransfersScreen> createState() => _TransfersScreenState();
}

class _TransfersScreenState extends State<TransfersScreen> {
  final controller = PageController();
  final List<String> items = [
    'Jessica',
    'Malvin',
    'John',
    'Emily',
    'Linette',
    'Tafara'
  ];

  @override
  Widget build(BuildContext context) {
    int _getCrossAxisCount(BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
      if (screenSize.width > 600) {
        return 4;
      } else if (screenSize.width > 400) {
        return 3;
      } else {
        return 2;
      }
    }

    int crossAxisCount = _getCrossAxisCount(context);

    const List cardOperations = [
      {"icon": Icons.credit_card, "title": "Internal Transfer"},
      {"icon": Icons.wallet, "title": "Electronic Transfer"},
      {"icon": Icons.telegram_sharp, "title": "ZipIt Transfer"},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Transfer",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeOverLarge,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "\$ 17, 468.66",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeHeaders,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.25,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SizedBox(
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.5, end: 1.0),
                        duration: Duration(milliseconds: 500),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: buildCustomCardWidget(
                          color: AppConstants.mainColor,
                          cardExpiration: "08/2022",
                          cardHolder: "Card Holder",
                          cardNumber: "1234 **** **** 3456",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.5, end: 1.0),
                        duration: Duration(milliseconds: 1000),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: buildCustomCardWidget(
                          color: AppConstants.mainColor,
                          cardExpiration: "08/2022",
                          cardHolder: "Card Holder",
                          cardNumber: "1234 **** **** 3456",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.5, end: 1.0),
                        duration: const Duration(milliseconds: 1000),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: buildCustomCardWidget(
                          color: AppConstants.mainColor,
                          cardExpiration: "08/2022",
                          cardHolder: "Card Holder",
                          cardNumber: "1234 **** **** 3456",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.5, end: 1.0),
                        duration: Duration(milliseconds: 1000),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: buildCustomCardWidget(
                          color: AppConstants.mainColor,
                          cardExpiration: "08/2022",
                          cardHolder: "Card Holder",
                          cardNumber: "1234 **** **** 3456",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              indicatorColor: AppConstants.mainColor,
                              labelColor: AppConstants.mainColor,
                              unselectedLabelColor:
                                  AppConstants.black.withOpacity(0.5),
                              tabs: <Widget>[
                                Tab(
                                  child: Text(
                                    "Transfers",
                                    style: TextStyle(
                                        fontSize: Dimensions.fontSizeSmall,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Transactions",
                                    style: TextStyle(
                                        fontSize: Dimensions.fontSizeSmall,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: <Widget>[
                                  SingleChildScrollView(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Column(
                                          children: List.generate(
                                              cardOperations.length, (index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 20),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (index == 0) {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const InternalTransfersScreen(),
                                                      ),
                                                    );
                                                  }else if (index ==1){
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RTGSTransferScreen(),
                                                      ),
                                                    );
                                                  }else if (index ==2){
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ZIPITTransfersScreen(),
                                                      ),
                                                    );
                                                  }else{

                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: AppConstants.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppConstants
                                                            .black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 1,
                                                        blurRadius: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: AppConstants
                                                                  .secondaryColor
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
                                                          child: Center(
                                                            child: Icon(
                                                              cardOperations[
                                                                      index]
                                                                  ['icon'],
                                                              color: AppConstants
                                                                  .mainColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          cardOperations[index]
                                                              ['title'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: recentTransactions(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showMyModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: Get.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              // Add your desired child widgets here
            ],
          ),
        );
      },
    );
  }
}
