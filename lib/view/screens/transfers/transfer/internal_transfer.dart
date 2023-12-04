import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';
import 'package:zwmb/util/styles.dart';
import 'package:zwmb/view/widget/creditcard_widget.dart';
import 'package:zwmb/view/widget/custom_textfield_widget.dart';
import 'package:zwmb/view/widget/date_time_picker_widget.dart';
import 'package:zwmb/view/widget/dropdown_widget.dart';
import 'package:zwmb/view/widget/parapgraph_widget.dart';
import 'package:zwmb/view/widget/transaction_history.dart';

class InternalTransfersScreen extends StatefulWidget {
  const InternalTransfersScreen({super.key});

  @override
  State<InternalTransfersScreen> createState() =>
      _InternalTransfersScreenState();
}

class _InternalTransfersScreenState extends State<InternalTransfersScreen> {
  final controller = PageController();
  bool isLastPage = false;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: _getCurrentDate());
  }

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
      backgroundColor: AppConstants.white,
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
          "Internal transfer",
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
                  "Internal Funds Application Form",
                  style: TextStyle(
                      color: AppConstants.mainColor,
                      fontSize: Dimensions.fontSizeOverLarge,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              
              Text(
                "From:",
                style: TextStyle(
                    color: AppConstants.mainColor,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.03,
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
              Center(
                child: CustomTextField(
                  
                  borderColor: AppConstants.black.withOpacity(0.3),
                  hintText: 'Amount in Figures',
                  inputType: TextInputType.phone,
                  onSubmit: (String value) {},
                  hintStyle: robotoRegular.copyWith(
                      fontSize: Dimensions.fontSizeSmall),
                  onChanged: (String value) {},
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
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
                "To:",
                style: TextStyle(
                    color: AppConstants.mainColor,
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.03,
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
              Center(
                child: CustomDropdown(
                  hintText: 'Destination account',
                  options: [
                    '343536378776474848',
                    '343536376767484848',
                    '343536676567484848'
                  ],
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
              Center(
                child: ParagraphingWidget(
                  maxLines: 5,
                  borderColor: AppConstants.black.withOpacity(0.5),
                  hintText: 'Reason for transfer',
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
