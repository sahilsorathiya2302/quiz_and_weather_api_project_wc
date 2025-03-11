import 'package:flutter/widgets.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

import '../theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? AppTextSize.s14,
        color: color ?? AppColors.black,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
