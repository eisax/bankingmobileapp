import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zwmb/helper/route_helper.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;
  int index = 0;

 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final PageController controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height * 0.06,
              ),
              Container(
                width: Get.width * 0.4,
                padding: const EdgeInsets.all(10),
                child: Image.asset(Images.logowide,fit: BoxFit.cover,),
              ),
              SizedBox(
                width: width,
                height: height * 0.6,
                child: SizedBox(
                  child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          index = index;
                        });
                        setState(() => isLastPage = index == 2);
                        setState(() => isFirstPage = index == 0);

                      },
                      children: <Widget>[
                        buildPage(
                            pageWidth: width,
                            pageHeight: height,
                            color: Colors.white,
                            urlImage: Images.banktransfer
                            ,
                            titleDecsription:
                                "Make daily transfers to your desired accounts"),
                        buildPage(
                            pageWidth: width,
                            pageHeight: height,
                            color: Colors.white,
                            urlImage: Images.bills,
                            titleDecsription:
                                "Pay your bills and cover your daily essentials"),
                        buildPage(
                            pageWidth: width,
                            pageHeight: height,
                            color: Colors.white,
                            urlImage: Images.mobile,
                            titleDecsription:
                                "Send airtime accross multiple networks")
                      ]),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      type: WormType.thin,
                      dotColor: AppConstants.black.withOpacity(0.5),
                      activeDotColor: AppConstants.black),
                  onDotClicked: (index) => controller.animateToPage(index,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeIn),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
        !isFirstPage?            ElevatedButton(
                      onPressed: () {
                       
                      
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                       
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: AppConstants.mainColor,
                            width: 1,
                          ),
                        ),
                        minimumSize: Size(Get.width * 0.3, 50),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 16, color: AppConstants.mainColor),
                      ),
                    ):Container(),
                    ElevatedButton(
                      onPressed: () {
                        if (index < 2) {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                        isLastPage ?Get.offAllNamed(RouteHelper.auth):null;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.mainColor,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: AppConstants.mainColor,
                            width: 1,
                          ),
                        ),
                        minimumSize: Size(Get.width * 0.3, 50),
                      ),
                      child: const Text(
                        'Next',
                        style:
                            TextStyle(fontSize: 16, color: AppConstants.grey),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(
          {required double pageWidth,
          required double pageHeight,
          required Color color,
          required String urlImage,
          required String titleDecsription}) =>
      Container(
        width: pageWidth,
        child: Center(
          child: Stack(
            children: [
              Container(
                width: pageWidth * 0.9,
                height: pageHeight * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: Get.width * 0.55,
                              width: Get.width * 0.55,
                              child: Image.asset(urlImage),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.6,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        titleDecsription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Dimensions.fontSizeOverLarge,
                            fontWeight: FontWeight.w400,
                            color: AppConstants.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
