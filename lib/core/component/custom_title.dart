import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/component/custom_text.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

class CustomTitle extends StatelessWidget {
  final double? fontSize;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomTitle(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      fontSize: fontSize ?? AppTextSize.s24,
      text: text,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }
}
