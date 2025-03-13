import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/core/constants/app_sized_box_extension.dart';
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

import '../../../core/ui_components/custom_title.dart';

class ScoreCardWidget extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String performanceMessage;
  final double scoreOutOfTen;
  const ScoreCardWidget(
      {super.key,
      required this.correctAnswers,
      required this.totalQuestions,
      required this.performanceMessage,
      required this.scoreOutOfTen});

  @override
  State<ScoreCardWidget> createState() => _ScoreCardWidgetState();
}

class _ScoreCardWidgetState extends State<ScoreCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
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
          12.sizeHeight,
          CustomTitle(
            text: "${widget.correctAnswers} / ${widget.totalQuestions}",
            fontSize: AppTextSize.s26,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900,
          ),
          12.sizeHeight,
          CustomTitle(
            text: widget.performanceMessage,
            fontSize: AppTextSize.s18,
            fontWeight: FontWeight.w600,
            color: Colors.green.shade700,
          ),
        ],
      ),
    );
  }
}
