import 'package:flutter/material.dart';
import 'package:zwmb/util/dimensions.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final String? value;
  final Function(String?) onChanged;
  final String? errorText;
  final Color? borderColor;

  const CustomDropdown({
    required this.hintText,
    required this.options,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.borderColor,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.value,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          borderSide: BorderSide(
            color: widget.borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor, 
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor,
        ),
        errorText: widget.errorText,
      ),
      
      items: widget.options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}