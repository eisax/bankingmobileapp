import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/view/screens/airtime/airtime_screen.dart';
import 'package:zwmb/view/screens/beneficiaries/beneficiaries_screen.dart';
import 'package:zwmb/view/screens/billpay/bill_pap_screen.dart';
import 'package:zwmb/view/screens/home/home_screen.dart';
import 'package:zwmb/view/screens/transfers/transfers_screen.dart';
import 'package:zwmb/view/widget/side_bar_widget.dart';

class CustomBottomNavItem extends StatefulWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Function() onPressed;
  final bool isActive;

  const CustomBottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.onPressed,
    required this.isActive,
  });

  @override
  _CustomBottomNavItemState createState() => _CustomBottomNavItemState();
}

class _CustomBottomNavItemState extends State<CustomBottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: widget.isActive
                      ? AppConstants.mainColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                widget.isActive ? widget.activeIcon : widget.icon,
                color: widget.isActive ? Colors.white : Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.label,
              style: TextStyle(
                  color: widget.isActive ? AppConstants.mainColor : Colors.grey,
                  fontSize: Dimensions.fontSizeExtraSmall),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeSCreen(),
    TransfersScreen(),
    BillsPayScreen(),
    AirtimeScreen(),
    BeneficiariesScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.swap_horiz,
    Icons.receipt,
    Icons.phone_android,
    Icons.people,
  ];

  final List<String> _labels = [
    'Home',
    'Transfers',
    'Bills pay',
    'Airtime',
    'Beneficiaries',
  ];

  void _onNavItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              elevation: 0,
              backgroundColor: AppConstants.white,
              leadingWidth: Get.width * 0.5,
              leading: Container(
                width: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      'John Banda',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.fontSizeOverLarge,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppConstants.secondaryColor,
                  child: Text(
                    "J",
                    style: TextStyle(color: AppConstants.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            )
          : null,
      key: _scaffoldKey,
      drawer: const SideBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: Get.width,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _pages.length,
            (index) => CustomBottomNavItem(
              icon: _icons[index],
              activeIcon: _icons[index],
              label: _labels[index],
              onPressed: () => _onNavItemPressed(index),
              isActive: _currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
