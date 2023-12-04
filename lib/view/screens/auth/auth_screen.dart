import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/helper/route_helper.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';
import 'package:zwmb/util/styles.dart';
import 'package:zwmb/view/widget/custom_textfield_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: Get.width * 0.25,
              leading: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.25 * 0.5),
                child: Transform.scale(
                  scale: 2,
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.3,
                        child: Image.asset(
                          Images.logowide,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          actions: []),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            height: Get.height*0.82,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Get.height*0.66,
                
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: AppConstants.black,
                              fontSize: Dimensions.fontSizeHeaders,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: Get.height*0.02,
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          "Enter your mobile pin",
                          style: TextStyle(
                              color: AppConstants.black.withOpacity(0.8),
                              fontSize: Dimensions.fontSizeLarge,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height:Get.height*0.03,),
                      CustomTextField(
                        borderColor: AppConstants.black.withOpacity(0.3),
                        hintText: '0774259097',
                        inputType: TextInputType.phone,
                        onSubmit: (String value) {},
                        suffixIcon: Icons.phone,
                        hintStyle:
                            robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                        onChanged: (String value) {},
                      ),
                      SizedBox(height: Get.height*0.02,),
                      CustomTextField(
                        borderColor: AppConstants.black.withOpacity(0.3),
                        hintText: '******',
                        inputType: TextInputType.phone,
                        onSubmit: (String value) {},
                       isPassword: true,
                        hintStyle:
                            robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                        onChanged: (String value) {},
                      ),
                      SizedBox(height: Get.height*0.02,),
                      SizedBox(
                      width: Get.width*0.5,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.mainColor,
                          textStyle: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          shadowColor: AppConstants.grey,
                        ),
                        onPressed: () async {
                         Get.offAllNamed(RouteHelper.bottomBar);
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height*0.06,),
                    Container(
                      
                      child: Icon(Icons.fingerprint,size: Get.height*0.1,color: AppConstants.black.withOpacity(0.5),),
                    ),
                    SizedBox(height: Get.height*0.04,),
                     Container(
                        width: Get.width*0.5,
                        child: Center(
                          child: Text(
                            "We will automatyicallt detect your phone's default settings",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppConstants.black.withOpacity(0.8),
                                fontSize: Dimensions.fontSizeLarge,
                                
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                        
                     
                    ],
                  ),
                ),
                SizedBox(height: Get.height*0.04,),
              
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: Get.width*0.15,
                              height: Get.width*0.15 ,
                              decoration: BoxDecoration(
                                color: AppConstants.secondaryColor,
                                borderRadius: BorderRadius.circular(Get.width*0.15)
                              ),
                              child: Icon(Icons.graphic_eq,color: AppConstants.grey,),
                            ),
                            SizedBox(height: 5,),
                            Center(
                        child: Text(
                          "Exchange Rates",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppConstants.black.withOpacity(0.8),
                              fontSize: Dimensions.fontSizeSmall,
                              
                              fontWeight: FontWeight.w400),
                        ),
                      )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: Get.width*0.15,
                              height: Get.width*0.15 ,
                              decoration: BoxDecoration(
                                color: AppConstants.secondaryColor,
                                borderRadius: BorderRadius.circular(Get.width*0.15)
                              ),
                              child: Icon(Icons.location_on,color: AppConstants.grey,),
                            ),
                             SizedBox(height: 5,),
                            Center(
                        child: Text(
                          "Branch Locator",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppConstants.black.withOpacity(0.8),
                              fontSize: Dimensions.fontSizeSmall,
                              
                              fontWeight: FontWeight.w400),
                        ),
                      )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: Get.width*0.15,
                              height: Get.width*0.15 ,
                              decoration: BoxDecoration(
                                color: AppConstants.secondaryColor,
                                borderRadius: BorderRadius.circular(Get.width*0.15)
                              ),
                              child: Icon(Icons.call,color: AppConstants.grey,),
                            ),
                             SizedBox(height: 5,),
                            Center(
                        child: Text(
                          "Support",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppConstants.black.withOpacity(0.8),
                              fontSize: Dimensions.fontSizeSmall,
                              
                              fontWeight: FontWeight.w400),
                        ),
                      )
                          ],
                        )
                      ],
                    )
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
