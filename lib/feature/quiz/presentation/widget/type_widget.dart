import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/component/custom_text.dart';
import 'package:quiz_api_project_wc/core/theme/app_border_radius.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';

class TypeWidget extends StatefulWidget {
  const TypeWidget({super.key});

  @override
  State<TypeWidget> createState() => _TypeWidgetState();
}

class _TypeWidgetState extends State<TypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.r30,
        ),
      ),
      child: Center(
        child: CustomText(
          text: "Hard",
          color: AppColors.bgColor,
        ),
      ),
    );
  }
}
