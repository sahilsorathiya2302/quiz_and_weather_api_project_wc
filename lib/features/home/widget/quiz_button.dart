import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/ui_components/custom_button.dart';

class QuizButton extends StatefulWidget {
  const QuizButton({super.key});

  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
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
