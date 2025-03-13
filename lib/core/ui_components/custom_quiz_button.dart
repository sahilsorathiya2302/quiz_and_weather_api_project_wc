import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';
import 'package:quiz_api_project_wc/core/ui_components/custom_text.dart';

class CustomQuizButton extends StatelessWidget {
  final void Function() onPressed;
  final Color bgColor;
  final String text;
  const CustomQuizButton(
      {super.key,
      required this.onPressed,
      required this.bgColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
      ),
      child: CustomText(
        text: text,
        fontSize: AppTextSize.s16,
        color: AppColors.black,
      ),
    );
  }
}
