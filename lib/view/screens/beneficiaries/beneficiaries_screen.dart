import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/styles.dart';
import 'package:zwmb/view/widget/custom_textfield_widget.dart';
import 'package:zwmb/view/widget/ex.dart';

class BeneficiariesScreen extends StatefulWidget {
  const BeneficiariesScreen({super.key});

  @override
  State<BeneficiariesScreen> createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends State<BeneficiariesScreen> {
  final List<String> names = <String>[
    'John Adams',
    'Goarge Bush',
    'Bill Clinton',
    'Theodore Rosevelt',
    'John F Kennedy',
    'John Adams',
    'Goarge Bush',
    'Bill Clinton',
    'Theodore Rosevelt',
    'John F Kennedy',
    'John Adams',
    'Goarge Bush',
    'Bill Clinton',
    'Theodore Rosevelt',
    'John F Kennedy'
  ];
  final List<String> phones = <String>[
    '0785465060',
    '0774259097',
    '0716860096',
    '0785465067',
    '0735891170',
    '0785465060',
    '0774259097',
    '0716860096',
    '0785465067',
    '0735891170',
    '0785465060',
    '0774259097',
    '0716860096',
    '0785465067',
    '0735891170'
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Beneficiaries Overview",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeOverLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
            
              CustomTextField(
                borderColor: AppConstants.black.withOpacity(0.3),
                hintText: 'Search',
                inputType: TextInputType.phone,
                prefixIcon: Icons.search,
                onSubmit: (String value) {},
                hintStyle:
                    robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                onChanged: (String value) {},
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              TabBar(
                indicatorColor: AppConstants.mainColor,
                labelColor: AppConstants.mainColor,
                dividerColor: AppConstants.black.withOpacity(0.5),
                unselectedLabelColor: AppConstants.black.withOpacity(0.5),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Bill Payments",
                      style: TextStyle(
                          fontSize: Dimensions.fontSizeSmall,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                      "Airtime",
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
                    Center(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: names.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      names[index],
                                      style: TextStyle(
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      phones[index],
                                      style: TextStyle(
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                      width: Get.width * 0.2,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_arrow)))
                                ],
                              ),
                            );
                          }),
                    ),
                    Center(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: names.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      names[index],
                                      style: TextStyle(
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      phones[index],
                                      style: TextStyle(
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                      width: Get.width * 0.2,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_arrow)))
                                ],
                              ),
                            );
                          }),
                    ),
                    Center(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: names.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      names[index],
                                      style: TextStyle(
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: Text(
                                      phones[index],
                                      style: TextStyle(
                                          fontSize: Dimensions.fontSizeLarge,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                      width: Get.width * 0.2,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_arrow)))
                                ],
                              ),
                            );
                          }),
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

  Widget squareBigButtonBeneficiaries(String title, IconData icon,
      Color backgroundColor, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.25 * 0.5,
          height: Get.width * 0.25 * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Get.width * 0.25 * 0.5,
              ),
              color: backgroundColor),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: 34.0,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 13, color: backgroundColor),
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: backgroundColor, fontSize: Dimensions.fontSizeExtraSmall),
        )
      ],
    );
  }
}
