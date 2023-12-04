import 'package:flutter/material.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/view/widget/transactionCard.dart';

Widget recentTransactions() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppConstants.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppConstants.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 16.0,
              top: 32.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                      color: AppConstants.black,
                      fontSize: Dimensions.fontSizeLarge,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      color: AppConstants.mainColor,
                      fontSize: Dimensions.fontSizeExtraSmall,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                TransactionCard(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  letter: 'F',
                  title: 'Diana Fendi',
                  subTitle: '3365 **** **** 6786',
                  price: 'ZWL- 87.720,30',
                ),
                TransactionCard(
                  color: Color.fromARGB(255, 32, 28, 161),
                  letter: 'M',
                  title: 'Farai Moyo',
                  subTitle: '3365 **** **** 6786',
                  price: 'ZWL- 3833.720,30',
                ),
                TransactionCard(
                  color: Color.fromARGB(255, 198, 17, 17),
                  letter: 'M',
                  title: 'Farai Moyo',
                  subTitle: '3365 **** **** 6786',
                  price: 'ZWL- 5 383.720,30',
                ),
                TransactionCard(
                  color: Color.fromARGB(255, 155, 203, 11),
                  letter: 'F',
                  title: 'Farai Moyo',
                  subTitle: '3365 **** **** 6786',
                  price: 'ZWL- 4743.720,30',
                ),
                TransactionCard(
                  color: Colors.black,
                  letter: 'F',
                  title: 'Farai Moyo',
                  subTitle: '3365 **** **** 6786',
                  price: 'ZWL- 9378.720,30',
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
