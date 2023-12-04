import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/styles.dart';

class CustomDatePicker extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextAlign textAlign;
  final Function(String value)? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final InputDecoration? inputDecoration;
  final TextStyle? hintStyle;
  final String? errorText;
  final Color? fillColor;
  final Color? borderColor;
  final bool? readOnly;

  const CustomDatePicker({
    this.readOnly,
    Key? key,
    this.hintText = 'Select a date...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.textAlign = TextAlign.start,
    this.onSubmit,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.inputDecoration,
    this.hintStyle,
    this.errorText,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly??false,
      textAlign: widget.textAlign,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
      keyboardType: TextInputType.datetime,
      cursorColor: widget.borderColor,
      enabled: widget.isEnabled,
      decoration: widget.inputDecoration ??
          InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: widget.fillColor ?? Theme.of(context).cardColor,
            hintStyle: widget.hintStyle ??
                robotoRegular.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).hintColor,
                ),
            filled: true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall),
                    child: Icon(widget.prefixIcon!, size: 20),
                  )
                : null,
            suffixIcon: IconButton(
              icon: Icon(widget.suffixIcon ?? Icons.calendar_today),
              onPressed: _showDatePicker,
            ),
            errorText: widget.errorText,
            errorBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: widget.borderColor == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(color: widget.borderColor!),
                  ),
          ),
      onSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
              ? widget.onSubmit!()
              : null,
      onChanged:
          widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
    );
  }

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller?.text = _selectedDate.toString();
      });
    }
  }
}
