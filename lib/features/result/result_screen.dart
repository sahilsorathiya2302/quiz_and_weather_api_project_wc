import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';
import 'package:quiz_api_project_wc/core/ui_components/custom_button.dart';

import '../../core/constants/app_string.dart';
import '../../core/ui_components/custom_title.dart';

class ResultScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String performanceMessage;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.performanceMessage,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.teal.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
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
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 15,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CustomTitle(
                    text: AppString.finalScore,
                    fontSize: AppTextSize.s24,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 12),
                  CustomTitle(
                    text: "${widget.correctAnswers} / ${widget.totalQuestions}",
                    fontSize: AppTextSize.s26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                  const SizedBox(height: 12),
                  CustomTitle(
                    text: widget.performanceMessage,
                    fontSize: AppTextSize.s18,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            CustomButton(
              text: AppString.retryQuiz,
              onPressed: () {
                Get.toNamed(AppRoutesName.homeScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
