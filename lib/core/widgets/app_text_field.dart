import 'package:flutter/services.dart';

import '../core_export.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.title,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.validate,
    this.onChanged,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.enabled = true,
    this.enabledBorder,
    this.hintStyle,
    // this.inputFormatters,
  });
  final String? title;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final bool obscureText;
  final bool enabled;
  final int? maxLines;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final Function(String)? onFieldSubmitted;
  // final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      style: AppTextStyles.font10.copyWith(
        color: Theme.of(context).textTheme.bodyMedium!.color,
      ),
      textAlign: textAlign,
      focusNode: focusNode,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: title,
          hintStyle: hintStyle ??
              AppTextStyles.font10
                  .copyWith(color: AppColors.textMuted.withValues(alpha: 0.5)),
          labelStyle: TextStyle(color: AppColors.textMuted),
          prefixIcon: prefixIcon,
          errorText: errorText,
          suffixIcon: suffixIcon,
          enabledBorder: enabledBorder),
      inputFormatters: [
        keyboardType == TextInputType.number
            ? FilteringTextInputFormatter.allow(
                RegExp(
                    r'^\d+\.?\d*$'), // Allows only digits and an optional decimal point
              )
            : FilteringTextInputFormatter.singleLineFormatter,
      ],
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      keyboardType: keyboardType,
      validator: validate,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
