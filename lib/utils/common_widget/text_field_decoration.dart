import 'package:newGetxCLI/utils/theme/app_colors.dart';
import 'package:newGetxCLI/utils/sizes.dart';
import 'package:flutter/material.dart';

class TextFieldDecoration {
  static InputDecoration textfieldDecoration({required String hint}) =>
      new InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          hintText: hint,
          hintStyle: TextStyle(
              fontFamily: "Inter-Regular",
              fontWeight: FontWeight.w400,
              color: AppColors.subtitle,
              fontSize: 14));

  static InputDecoration textfieldDecorationForSaveCard({String? hintText}) =>
      new InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: FontSizes.s14,
              color: AppColors.subtitle,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AppColors.primary, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AppColors.textFieldBorder),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AppColors.textFieldBorder),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppColors.textFieldBorder,
            ),
          ));
}
