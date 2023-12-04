import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/helper/route_helper.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _route() {
    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(RouteHelper.welcome);
    });
  }

  void initState() {
    super.initState();
    _route();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Theme.of(context).cardColor,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                           
                            width: Get.width * 0.33,
                            height: Get.width * 0.33,
                            child: Image.asset(
                              Images.logo,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "ZWMB  ",
                            style: TextStyle(
                                color: AppConstants.mainColor,
                                fontSize: Dimensions.fontSizeHeaders,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ZIMBABWE WOMEN MICROFINANCE BANK LIMITED                  ",
                            style: TextStyle(
                                color: AppConstants.secondaryColor,
                                fontSize: Dimensions.fontSizeExtraSmall * 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Creating a woman with power         ",
                            style: TextStyle(
                                color: AppConstants.mainColor,
                                fontSize: Dimensions.fontSizeExtraSmall * 0.9,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      " registered Comercial Bank & and a member of the Deposit Protection Corporation",
                      style: TextStyle(
                          color: AppConstants.black,
                          fontSize: Dimensions.fontSizeExtraSmall * 0.9,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
