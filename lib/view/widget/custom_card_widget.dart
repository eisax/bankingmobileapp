import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/images.dart';
import 'package:google_fonts/google_fonts.dart';

Card buildCustomCardWidget({
  required Color color,
  required String cardNumber,
  required String cardHolder,
  required String cardExpiration,
}) {
  return Card(
    elevation: 50,
    shadowColor: AppConstants.black.withOpacity(0.1),
    color: AppConstants.mainColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    borderOnForeground: true,
    
    child: Container(
      height: Get.height*0.25,
      width: Get.width*0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: AppConstants.grey),
        borderRadius: BorderRadius.circular(25)
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
                child: Image.asset(Images.chip),
              ),
           const   Text(
                'View Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: 'ZWL', // Replace with your selected value variable
                    onChanged: (String? newValue) {
                      // Add your onChanged code here!
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    underline: Container(), // Removes the underline
                    dropdownColor:
                        AppConstants.mainColor, // Removes the dropdown background color
                    items: <String>[
                      'ZWL',
                      'USD',
                      'RTGS'
                    ] // Replace with your dropdown options
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Icon(Icons.credit_card,color: AppConstants.grey,size: Dimensions.fontSizeSmall,),
                      SizedBox(width: 5,),
                      Text(
                "01/80",
                style: GoogleFonts.montserrat(
                        color: AppConstants.grey,
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.w400),
              ),
                    ],
                  ),
                ],
              ),
              Text(
            cardNumber,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: Dimensions.fontSizeSmall,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
            ),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "ZWL 500, 100, 450.00",
                style: TextStyle(
                    color: AppConstants.grey,
                    fontSize: Dimensions.fontSizeOverLarge,
                    fontWeight: FontWeight.bold),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                backgroundColor: AppConstants.grey,
                child:const Icon(
                  Icons.add,
                  size: 20,
                  color: AppConstants.mainColor,
                ),
              )
            ],
          ),
            ],
          ),
          
         
        ],
      ),
    ),
  );
}
