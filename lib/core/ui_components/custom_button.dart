import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/component/custom_text.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  const CustomButton(
      {super.key, this.onPressed, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(250, 50),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: CustomText(
          fontSize: AppTextSize.s16,
          text: text,
        ));
  }
}
