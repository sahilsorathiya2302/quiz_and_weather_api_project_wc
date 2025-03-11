import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/component/custom_text.dart';
import 'package:quiz_api_project_wc/core/constraints/app_string.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 50,
      child: CustomText(
        text: AppString.t,
        fontSize: AppTextSize.s26,
      ),
    );
  }
}
