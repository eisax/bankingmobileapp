import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zwmb/util/app_constants.dart';
import 'package:zwmb/view/widget/ex.dart';

class FundTransferScreen extends StatefulWidget {
  const FundTransferScreen({Key? key, required}) : super(key: key);

  @override
  _FundTransferScreenState createState() => _FundTransferScreenState();
}

class _FundTransferScreenState extends State<FundTransferScreen> {
  late Map<String, dynamic> userData;
  late TextEditingController _transactionAmountController;
  late TextEditingController _secondTextFieldController; // New controller
  String _controllerHelperText = "0.00";
  String _secondTextFieldHelperText = ""; // New helper text
  late String transactionButton;

  String? tileSubtitle;

  @override
  void initState() {
    super.initState();
    transactionButton = 'Internal Transfer';
    numPadKeys =
        List<int>.generate(9, (i) => i + 1).map(_createButton).toList();

    bottomKeys = [
      ElevatedButton(
        onPressed: _addZeroes,
        child: Text(
          "0",
          style: TextStyle(
              color: AppConstants.mainColor,
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: CircleBorder(),
          elevation: 0,
          // elevation: 0.618,
          // shadowColor: Color(0xffF5F7FA)
        ),
      ),
      ElevatedButton(
        onPressed: _addDecimal,
        child: Text(
          ".",
          style: TextStyle(
              color: AppConstants.mainColor,
              fontSize: 30,
              fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: CircleBorder(),
          // elevation: 0.618,
          elevation: 0,
          // shadowColor: Color(0xffF5F7FA)
        ),
      ),
      ElevatedButton(
        onPressed: _eraseDigits,
        onLongPress: _clearTransactionAmount,
        child: Text(
          "Clear",
          style: TextStyle(
            inherit: false,
            color: AppConstants.mainColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: CircleBorder(),
            // elevation: .618,
            // shadowColor: Color(0xffF5F7FA)
            elevation: 0),
      ),
    ]
        .map((e) => Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppConstants.mainColor.withOpacity(0.1),
                    blurRadius: 48,
                    offset: Offset(20, 32),
                    spreadRadius: -16)
              ]),
              child: e,
            ))
        .toList();
    numPadKeys.addAll(bottomKeys);
    _transactionAmountController =
        TextEditingController(text: _controllerHelperText);
    _secondTextFieldController =
        TextEditingController(); // Initialize the second controller
  }

  @override
  void dispose() {
    _transactionAmountController.dispose();
    _secondTextFieldController.dispose(); // Dispose the second controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color(0xfffefefe),
      appBar: AppBar(
        title: Text("$transactionButton"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppConstants.mainColor,
      ),
      body: Column(
        children: [
         Padding(
  padding: EdgeInsets.symmetric(horizontal: 27, vertical: 13),
  child: TextField(
    keyboardType: TextInputType.none,
    controller: _transactionAmountController,
    style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppConstants.mainColor),
    decoration: InputDecoration(
      contentPadding:
          EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(color: AppConstants.mainColor, width: 2.0)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppConstants.mainColor)),
      prefix: Container(
          margin: EdgeInsets.only(right: 10),
          child: Text(
            "\$",
            style: GoogleFonts.manrope(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: AppConstants.mainColor),
          )),
    ),
  ),
),
Expanded(
  child: Container(
    height: 190,
    padding: EdgeInsets.symmetric(horizontal: 9),
    child: GridView.count(
      crossAxisCount: 3,
      children: numPadKeys,
      crossAxisSpacing: 2,
      mainAxisSpacing: 5,
      childAspectRatio: 1.55,
    ),
  ),
),
Container(
  width: MediaQuery.of(context).size.width - 45,
  height: 64,
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: Color(0xffF5F7FA),
          offset: Offset(0, 4),
          blurRadius: 5.0)
    ],
    gradient: RadialGradient(
        colors: [AppConstants.mainColor, AppConstants.mainColor],
        radius: 8.4,
        center: Alignment(-0.24, -0.36)),
    color: AppConstants.mainColor,
    borderRadius: BorderRadius.circular(20),
  ),
  child: ElevatedButton(
    onPressed: () {},
    child: Text(transactionButton),
    style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20))),
  ),
),
SizedBox(
  height: 10,
),
        ],
      ),
    );
  }

  void _updateHelperText(String k) {
    var cursorPos = _transactionAmountController.selection.base.offset;
    int editedOffset = _controllerHelperText.length;

    String suffixText = '', prefixText = '';

    if (cursorPos >= 0 && cursorPos < _controllerHelperText.length) {
      suffixText = _controllerHelperText.substring(cursorPos);
      prefixText = _controllerHelperText.substring(0, cursorPos);
    }

    setState(() {
      if (_controllerHelperText == "0.00") {
        _controllerHelperText = k;
        editedOffset = _controllerHelperText.length;
      } else if (cursorPos == -1 || cursorPos == _controllerHelperText.length) {
        _controllerHelperText += k;
        editedOffset = _controllerHelperText.length;
      } else {
        _controllerHelperText = prefixText + k + suffixText;
        editedOffset = cursorPos + 1;
      }
    });
    _transactionAmountController.value = TextEditingValue(
      text: _controllerHelperText,
      selection: TextSelection.fromPosition(TextPosition(offset: editedOffset)),
    );
  }

  late List<Container> bottomKeys;
  late List<Container> numPadKeys;

  Container _createButton(digit) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppConstants.mainColor.withOpacity(0.1),
              blurRadius: 48,
              offset: Offset(20, 32),
              spreadRadius: -16)
        ]),
        child: ElevatedButton(
          onPressed: () => _addDigits(digit),
          child: Text(
            digit.toString(),
            style: TextStyle(
                color: AppConstants.mainColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: CircleBorder(),
            elevation: 0,
            // shadowColor: Color(0xffF5F7FA)
          ),
        ),
      );

  void _addDigits(int digit) {
    int cursorPos = _transactionAmountController.selection.base.offset;
    //? detect cursor position
    int validPos = cursorPos == -1 ? 0 : cursorPos;

    String desiredAmount =
        _transactionAmountController.text.substring(0, validPos) +
            digit.toString() +
            _transactionAmountController.text.substring(validPos);
    if (double.parse(desiredAmount) <= 10000 ||
        _transactionAmountController.text.isEmpty) {
      if (_controllerHelperText == "0.00") {
        _updateHelperText(digit.toString());
      } else if (!_controllerHelperText.contains('.')) {
        _updateHelperText(digit.toString());
      } else if (_controllerHelperText.contains('.') &&
          cursorPos <= _transactionAmountController.text.length - 3) {
        _updateHelperText(digit.toString());
      } else if (_controllerHelperText.contains('.') &&
          _controllerHelperText.split('.').last.length < 2) {
        _updateHelperText(digit.toString());
      }
    }
  }

  void _addZeroes() {
    int cursorPos = _transactionAmountController.selection.base.offset;

    int validPos = cursorPos == -1 ? 0 : cursorPos;

    String desiredAmount =
        _transactionAmountController.text.substring(0, validPos) +
            '0' +
            _transactionAmountController.text.substring(validPos);

    if (double.parse(desiredAmount) <= 10000 ||
        _transactionAmountController.text.isEmpty) {
      if (_controllerHelperText != "0.00" &&
          _controllerHelperText.length != 0) {
        if (!_controllerHelperText.contains('.')) {
          _updateHelperText('0');
        } else if (_controllerHelperText.contains('.') &&
            cursorPos <= _transactionAmountController.text.length - 3) {
          _updateHelperText('0');
        } else if (_controllerHelperText.contains('.') &&
            _controllerHelperText.split('.').last.length < 2) {
          _updateHelperText('0');
        }
      }
    }
  }

  void _addDecimal() {
    if (!_controllerHelperText.contains(".")) {
      setState(() {
        _controllerHelperText += ".";
      });
      _transactionAmountController.value = TextEditingValue(
        text: _controllerHelperText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: _controllerHelperText.length),
        ),
      );
    }
  }

//? FUNCTIONS FOR DELETE BUTTON
  void _eraseDigits() {
    if (_controllerHelperText.length > 0) {
      var cursorPos = _transactionAmountController.selection.base.offset;
      int editedOffset = _controllerHelperText.length;

      setState(() {
        if (cursorPos == -1) {
          _controllerHelperText = _controllerHelperText.substring(
              0, _controllerHelperText.length - 1);
          editedOffset = _controllerHelperText.length;
        } else if (cursorPos == _controllerHelperText.length) {
          _controllerHelperText =
              _controllerHelperText.substring(0, cursorPos - 1);
          editedOffset = _controllerHelperText.length;
        } else if (cursorPos > 0 && cursorPos < _controllerHelperText.length) {
          _controllerHelperText =
              _controllerHelperText.substring(0, cursorPos - 1) +
                  _controllerHelperText.substring(
                      cursorPos, _controllerHelperText.length);
          editedOffset = cursorPos - 1;
        }
      });

      _transactionAmountController.value = TextEditingValue(
        text: _controllerHelperText,
        selection:
            TextSelection.fromPosition(TextPosition(offset: editedOffset)),
      );
    }
  }

  void _clearTransactionAmount() {
    setState(() {
      _controllerHelperText = "0.00";
    });
    _transactionAmountController.clear();
    _transactionAmountController.value = TextEditingValue(
      text: _controllerHelperText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _controllerHelperText.length),
      ),
    );
  }
}
