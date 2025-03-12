import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/component/custom_text.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? bgColor;
  final String? text;
  final Color? txtColor;
  const CustomAppBar({super.key, this.bgColor, this.text, this.txtColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: bgColor ?? AppColors.orange,
        title: CustomText(
          text: text ?? "",
          color: txtColor,
          fontSize: AppTextSize.s20,
          fontWeight: FontWeight.w600,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(100, 50);
}
