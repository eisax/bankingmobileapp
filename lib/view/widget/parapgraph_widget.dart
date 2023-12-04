import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zwmb/util/dimensions.dart';
import 'package:zwmb/util/styles.dart';

class ParagraphingWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextAlign textAlign;
  final TextInputAction inputAction;
  final Function(String value)? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int? maxLines;
  final TextCapitalization capitalization;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final InputDecoration? inputDecoration;
  final TextStyle? hintStyle;
  final String? errorText;
  final Color? fillColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatter;

  const ParagraphingWidget({
    Key? key,
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines,
    this.onSubmit,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.capitalization = TextCapitalization.none,
    this.inputDecoration,
    this.hintStyle,
    this.errorText,
    this.fillColor,
    this.borderColor,
    this.inputFormatter,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  State<ParagraphingWidget> createState() => _ParagraphingWidgetState();
}

class _ParagraphingWidgetState extends State<ParagraphingWidget> {
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
      decoration: widget.inputDecoration ??
          InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          borderSide: BorderSide(
            color:Colors.red,
          ),
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
            suffixIcon: widget.suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall),
                    child: Icon(widget.suffixIcon!, size: 20),
                  )
                : null,
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
          : null,
      onChanged: widget.onChanged,
    );
  }
}