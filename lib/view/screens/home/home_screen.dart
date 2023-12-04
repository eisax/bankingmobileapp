import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/view/screens/airtime/airtime_screen.dart';
import 'package:zwmb/view/screens/bottomnav/bottom_navigation_bar.dart';
import 'package:zwmb/view/screens/zesa/electricity.dart';
import 'dart:ui' as ui;
import 'package:zwmb/view/widget/creditcard_widget.dart';
import 'package:zwmb/view/widget/side_bar_widget.dart';
import 'package:zwmb/view/widget/transaction_history.dart';

class HomeSCreen extends StatefulWidget {
  const HomeSCreen({super.key});

  @override
  State<HomeSCreen> createState() => _HomeSCreenState();
}

class _HomeSCreenState extends State<HomeSCreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = PageController();
  bool isLastPage = false;
  bool isUsd = false;
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      backgroundColor: AppConstants.white,
      key: _scaffoldKey,
      body: Center(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: AppConstants.white,
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Container(
                  color: AppConstants.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isUsd = !isUsd;
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isUsd ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppConstants.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'ZWL',
                                          style: TextStyle(
                                            color: isUsd
                                                ? Colors.white
                                                : Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'USD',
                                          style: TextStyle(
                                            color: isUsd
                                                ? Colors.white
                                                : Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimatedAlign(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      alignment: isUsd
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Container(
                                          width: 50,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              isUsd ? 'USD' : 'ZWL',
                                              style: TextStyle(
                                                color: isUsd
                                                    ? Colors.green
                                                    : Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: isUsd
                                                  ? Colors.white
                                                  : Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '+ Add Card',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.fontSizeLarge),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * 0.95,
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
                              onPageChanged: (index) {
                                setState(() => isLastPage = index == 2);
                              },
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: buildCreditCard(
                                      color: AppConstants.mainColor,
                                      cardExpiration: "08/2022",
                                      cardHolder: "Card Holder",
                                      cardNumber: "1234 **** **** 3456"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: buildCreditCard(
                                      color: AppConstants.mainColor,
                                      cardExpiration: "08/2022",
                                      cardHolder: "Card Holder",
                                      cardNumber: "1234 5678 **** 3456"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: buildCreditCard(
                                      color: AppConstants.mainColor,
                                      cardExpiration: "08/2022",
                                      cardHolder: "Card Holder",
                                      cardNumber: "1234 5678 **** 3456"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: buildCreditCard(
                                      color: AppConstants.mainColor,
                                      cardExpiration: "08/2022",
                                      cardHolder: "Card Holder",
                                      cardNumber: "1234 5678 **** 3456"),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    decoration: BoxDecoration(
                        color: AppConstants.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  homeBigSquareButton("TelOne ADSL",
                                      Icons.loop_outlined, context),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ElectricityScreen(),
                                        ),
                                      );
                                    },
                                    child: homeBigSquareButton("Prepaid Electricity",
                                        Icons.electric_bolt, context),
                                  ),
                                  GestureDetector(
                                     onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AirtimeScreen(),
                                        ),
                                      );
                                    },
                                    child: homeBigSquareButton("Airtime",
                                        Icons.credit_card, context),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: Get.width,
                            height: Get.height * 0.4,
                            child: recentTransactions()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget transferListViewItem(
      String date, String type, double amount, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(
                color: AppConstants.black, fontSize: Dimensions.fontSizeLarge),
          ),
          Text(
            "Transfer",
            style: TextStyle(
                color: AppConstants.black, fontSize: Dimensions.fontSizeLarge),
          ),
          Text(
            "ZWL ${amount.toString()}",
            style: TextStyle(
                color: AppConstants.black, fontSize: Dimensions.fontSizeLarge),
          )
        ],
      ),
    );
  }

  Widget homeBigSquareButton(
      String title, IconData icon, BuildContext context) {
    return Container(
      width: Get.width * 0.2,
      height: Get.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Get.width * 0.25 * 0.6,
            height: Get.width * 0.25 * 0.6,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: AppConstants.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(
                  Get.width * 0.25 * 0.5,
                ),
                color: AppConstants.white),
            child: Icon(
              icon,
              color: AppConstants.mainColor,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                color: AppConstants.black,
                fontSize: Dimensions.fontSizeExtraSmall),
          )
        ],
      ),
    );
  }

  Widget buildCardWidget({
    required String accountName,
    required String cardName,
    required double amount,
    required double bankAccount,
  }) =>
      Center(
        child: Stack(
          children: [
            Container(
              width: Get.width * 0.9,
              height: Get.height * 0.27,
              decoration: BoxDecoration(
                  color: AppConstants.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    cardName,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        amount.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    bankAccount.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
