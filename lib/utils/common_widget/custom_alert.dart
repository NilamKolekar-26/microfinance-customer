import 'package:flutter/material.dart';
import 'package:newGetxCLI/utils/theme/app_colors.dart';
import 'package:newGetxCLI/utils/common_widget/app_textstyles.dart';
import 'package:newGetxCLI/utils/sizes.dart';
import 'package:newGetxCLI/utils/common_widget/ui_helper_widgets.dart';

void showCustomAlertDialog(
    BuildContext context,
    String alertTitle,
    String contentText,
    Function onPressedButton,
    Function onPressedButtonSecond,
    String button1Title,
    String button2Title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          alertTitle,
          style: TextStyles.productTitle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(contentText,
                style:
                    TextStyles.unitTextStyle.copyWith(fontSize: FontSizes.s13)),
            SizedBox(height: 16.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onPressedButtonSecond();
                          },
                          child: Text(
                            button1Title,
                            style: TextStyles.productTitle.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColors.error),
                          ))),
                  C10(),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onPressedButton();
                        },
                        child: Text(
                          button2Title,
                          style: TextStyles.productTitle.copyWith(
                              fontSize: FontSizes.s12,
                              color: AppColors.primary),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
