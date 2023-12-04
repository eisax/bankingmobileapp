import 'package:flutter/material.dart';


class MyModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (context) {
            return SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  // Add your desired child widgets here
                ],
              ),
            );
          },
        );
      },
      child: const Text(
        'Choose Option',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}