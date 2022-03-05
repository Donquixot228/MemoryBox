import 'package:flutter/material.dart';
import 'package:memorybox2/resources/resources.dart';

TextField customTextField(
    BuildContext context,
    TextEditingController controller, {
      bool? enabled,
      TextInputType keyboardType = TextInputType.phone,
      bool showBorder = false,
    }) {
  return TextField(
    cursorColor: Colors.black45,
    textAlign: TextAlign.center,
    enabled: enabled == false ? false : null,
    controller: controller,
    keyboardType: keyboardType,
    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.only(top: 10),
      focusedBorder: showBorder
          ? const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor))
          : null,
      enabledBorder: showBorder
          ? const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor))
          : null,
    ),
  );
}