import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/component/custom_button.dart';
import 'package:quiz_api_project_wc/core/constraints/app_string.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';

import '../../../core/theme/app_colors.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: AppString.startQuiz,
      color: AppColors.orange,
      onPressed: () => Get.toNamed(
        AppRoutesName.quizScreen,
      ),
    );
  }
}
