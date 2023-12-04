import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }

    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: width / 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Card Selected",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: fontSize(20)),
            )),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: width,
                    decoration: BoxDecoration(
                        boxShadow: AppColors.neumorpShadow,
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(
                        horizontal: width / 25, vertical: height / 30),
                    child: Stack(
                      children: <Widget>[
                        
                      
                      ],
                    ),
                  );
                })),
      ],
    );
  }
}


class AppColors {
  static Color primaryWhite = Color(0xFFCADCED);
  // static Color primaryWhite = Colors.indigo[100];

  static List pieColors = [
    Colors.indigo[400],
    Colors.green,
    Colors.amber,
    Colors.brown,
    Colors.deepOrange,
    Colors.blueGrey[400],
  ];
  static List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5),
        spreadRadius: -5,
        offset: Offset(-5, -5),
        blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900]!.withOpacity(.2),
        spreadRadius: 2,
        offset: Offset(7, 7),
        blurRadius: 20)
  ];
}


class SizeConfig {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}



class BankCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 20),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                alignment: Alignment.topLeft,
                width: width / 1.8,
                child: Image.asset(
                  "assets/mastercardlogo.png",
                  fit: BoxFit.fill,
                )),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: height / 10,
                width: width / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "**** **** **** ",
                          style: TextStyle(
                              fontSize: fontSize(20),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1930",
                          style: TextStyle(
                              fontSize: fontSize(30),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      "Platinum Card".toUpperCase(),
                      style: TextStyle(
                          fontSize: fontSize(15), fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              alignment: Alignment.bottomRight,
              width: width / 6,
              height: height / 16,
              decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  boxShadow: AppColors.neumorpShadow,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}