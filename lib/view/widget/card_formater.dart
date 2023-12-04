import 'package:flutter/services.dart';

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text.replaceAll(' ', '');

    if (newText.isEmpty) {
      return newValue;
    }

    var buffer = StringBuffer();
    var nonZeroIndex = 0;

    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      nonZeroIndex++;

      if (nonZeroIndex % 5 == 0 && nonZeroIndex != newText.length) {
        buffer.write(' ');
      } else if (nonZeroIndex > 5 && (nonZeroIndex - 5) % 4 == 0 && nonZeroIndex != newText.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}