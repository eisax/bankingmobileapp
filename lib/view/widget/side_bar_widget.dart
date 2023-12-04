import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstants.grey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppConstants.grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.3,
                  child: Image.asset(Images.logowide),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                    children: [
                      TextSpan(
                        text: ' John Banda',
                        style: TextStyle(
                          color: AppConstants.black,
                          fontSize: Dimensions.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Last login: ',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                    children: [
                      TextSpan(
                        text: '24/01/2023',
                        style: TextStyle(
                          color: AppConstants.black,
                          fontSize: Dimensions.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.home,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Home',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
         ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.swap_horiz,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Transfers',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
         ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.mobile_friendly,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Airtime',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.receipt,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Bill payments',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.settings,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Settings',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.headset_mic,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Help & Support',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.logout_outlined,
                      color: AppConstants.black,
                      size: 15,
                    ),
                  ),
                  const WidgetSpan(
                      child: SizedBox(
                    width: 20,
                  )),
                  TextSpan(
                    text: 'Logout',
                    style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeSmall,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
