import 'package:flutter/material.dart';

InputDecoration cusInputDecoration({
  Widget? icon,
  Color? iconColor,
  Widget? label,
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  Color? prefixIconColor,
  Widget? suffix,
}) {
  return InputDecoration(
    icon: icon,
    iconColor: iconColor,
    label: label,
    labelText: labelText,
    hintText: hintText,
    prefixIcon: prefixIcon,
    prefixIconColor: prefixIconColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    suffix: suffix,
  );
}

