import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/constants/app_sized_box_extension.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

import '../../../core/constants/app_string.dart';
import '../../../core/ui_components/custom_text.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 50,
          child: CustomText(
            text: AppString.logoText,
            fontSize: AppTextSize.s26,
          ),
        ),
        20.sizeHeight,
        CustomText(
          text: "Play Quiz And Check Weather",
          fontSize: AppTextSize.s18,
        ),
      ],
    );
  }
}
