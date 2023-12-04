
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextAlign textAlign;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String value)? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final InputDecoration? inputDecoration;
  final TextStyle? hintStyle;
  final String? errorText;
  final Color? fillColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextField({
    super.key,
    this.hintText = 'Write something...',
     this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixIcon,
     this.suffixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.inputDecoration,
    this.hintStyle,
    this.errorText,
    this.fillColor,
    this.borderColor,
    this.inputFormatter,
    this.textAlign = TextAlign.start,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: widget.borderColor,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      autofillHints: widget.inputType == TextInputType.name
          ? [AutofillHints.name]
          : widget.inputType == TextInputType.emailAddress
              ? [AutofillHints.email]
              : widget.inputType == TextInputType.phone
                  ? [AutofillHints.telephoneNumber]
                  : widget.inputType == TextInputType.streetAddress
                      ? [AutofillHints.fullStreetAddress]
                      : widget.inputType == TextInputType.url
                          ? [AutofillHints.url]
                          : widget.inputType == TextInputType.visiblePassword
                              ? [AutofillHints.password]
                              : null,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputFormatter ??
          (widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                ]
              : null),
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
                    child:
                        Icon(widget.prefixIcon!, size: 20),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle,
                  )
                : Icon(widget.suffixIcon,color: widget.borderColor,),
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
                    borderSide:
                        BorderSide(color: widget.borderColor!),
                  ),
          ),
      onSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
              ? widget.onSubmit!(text)
              : null,
      onChanged:
          widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}