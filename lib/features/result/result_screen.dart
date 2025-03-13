import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/constants/app_sized_box_extension.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';
import 'package:quiz_api_project_wc/core/theme/app_padding_size.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';
import 'package:quiz_api_project_wc/core/ui_components/custom_button.dart';
import 'package:quiz_api_project_wc/features/result/widget/score_card_widget.dart';

import '../../core/constants/app_string.dart';
import '../../core/ui_components/custom_title.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String performanceMessage;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.performanceMessage,
  });

  double get scoreOutOfTen => (correctAnswers / totalQuestions) * 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: AppPaddingSize.ph20, vertical: AppPaddingSize.pw50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.teal.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTitle(
                text: AppString.result,
                fontSize: AppTextSize.s24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              25.sizeHeight,
              ScoreCardWidget(
                correctAnswers: correctAnswers,
                totalQuestions: totalQuestions,
                performanceMessage: performanceMessage,
                scoreOutOfTen: scoreOutOfTen,
              ),
              const SizedBox(height: 35),
              CustomButton(
                text: AppString.retryQuiz,
                onPressed: () {
                  Get.offNamed(AppRoutesName.homeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
