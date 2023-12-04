import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';
import 'package:zwmb/util/styles.dart';
import 'package:zwmb/view/widget/custom_textfield_widget.dart';
import 'package:zwmb/view/widget/date_time_picker_widget.dart';
import 'package:zwmb/view/widget/dropdown_widget.dart';
import 'package:zwmb/view/widget/parapgraph_widget.dart';

class RTGSTransferScreen extends StatefulWidget {
  const RTGSTransferScreen({super.key});

  @override
  State<RTGSTransferScreen> createState() => _RTGSTransferScreenState();
}

class _RTGSTransferScreenState extends State<RTGSTransferScreen> {
  String _getCurrentDate() {
    final now = DateTime.now();
    return '${now.year}-${_formatDigit(now.month)}-${_formatDigit(now.day)}';
  }

  String _formatDigit(int digit) {
    return digit.toString().padLeft(2, '0');
  }

  String? sourceAccount;
  String? destinationAccount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppConstants.black,
          ),
        ),
        title: Text(
          "RTGS Transfer",
          style: TextStyle(
              color: AppConstants.black,
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Application for an Electronic Transfer",
                  style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeOverLarge,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Select Branch:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: CustomDropdown(
                  hintText: 'Select Branch',
                  options: ['Trust Towers', 'Head Office', 'Mutare'],
                  value: sourceAccount,
                  onChanged: (value) {
                    setState(() {
                      sourceAccount = value;
                    });
                  },
                  borderColor: AppConstants.black.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Select Account:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: CustomDropdown(
                  hintText: 'Source account',
                  options: [
                    '343536347747484848',
                    '3435377747484848',
                    '3437777747484848'
                  ],
                  value: sourceAccount,
                  onChanged: (value) {
                    setState(() {
                      sourceAccount = value;
                    });
                  },
                  borderColor: AppConstants.black.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Amount in Figures:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: CustomTextField(
                  // borderColor: AppConstants.black.withOpacity(0.3),
                  hintText: 'Amount in Figures',
                  inputType: TextInputType.phone,
                  onSubmit: (String value) {},
                  // hintStyle: robotoRegular.copyWith(
                  //     fontSize: Dimensions.fontSizeSmall),
                  onChanged: (String value) {},
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Amount in Words:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: ParagraphingWidget(
                  borderColor: AppConstants.black.withOpacity(0.5),
                  hintText: 'Amount in words',
                  inputType: TextInputType.text,
                  onChanged: (value) {},
                  onSubmit: () {},
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Beneficiary Banking Details:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeOverLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Select Bank Name:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: CustomDropdown(
                  hintText: 'Select Bank Name',
                  options: ['CBZ', 'CABS', 'RBZ'],
                  value: destinationAccount,
                  onChanged: (value) {
                    setState(() {
                      destinationAccount = value;
                    });
                  },
                  borderColor: AppConstants.black.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Select Branch Name:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: CustomDropdown(
                  hintText: 'Select Bank Name',
                  options: ['CBZ', 'CABS', 'RBZ'],
                  value: destinationAccount,
                  onChanged: (value) {
                    setState(() {
                      destinationAccount = value;
                    });
                  },
                  borderColor: AppConstants.black.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Enter Account Name:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: ParagraphingWidget(
                  borderColor: AppConstants.black.withOpacity(0.5),
                  hintText: 'Enter Account Name',
                  inputType: TextInputType.text,
                  onChanged: (value) {},
                  onSubmit: () {},
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Enter Account Number:",
                style: TextStyle(
                    color: AppConstants.black,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Center(
                child: ParagraphingWidget(
                  borderColor: AppConstants.black.withOpacity(0.5),
                  hintText: 'Enter Account Number',
                  inputType: TextInputType.text,
                  onChanged: (value) {},
                  onSubmit: () {},
                ),
              ),
              
              SizedBox(
                height: Get.height * 0.03,
              ),
              Center(
                child: SizedBox(
                  width: Get.width,
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
                    onPressed: () async {},
                    child: const Text(
                      'Transfer',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
}
