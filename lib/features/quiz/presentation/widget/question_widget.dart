import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';

import '../../../../core/ui_components/custom_text.dart';
import '../bloc/quiz_bloc.dart';
import '../bloc/quiz_event.dart';
import '../bloc/quiz_state.dart';

class QuestionWidget extends StatefulWidget {
  final QuizLoaded state;
  final int questionIndex;
  const QuestionWidget(
      {super.key, required this.state, required this.questionIndex});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late List<String> shuffledOptions;

  @override
  void initState() {
    super.initState();
    _shuffleOptions();
  }

  void _shuffleOptions() {
    final question = widget.state.quizResponse.results![widget.questionIndex];
    shuffledOptions = [
      ...question.incorrectAnswers!,
      question.correctAnswer.toString()
    ]..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.state.quizResponse.results![widget.questionIndex];

    // Get the selectedAnswer directly from the widget.state
    final selectedAnswer =
        widget.state.selectedAnswers[widget.questionIndex] ?? "";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Q${widget.questionIndex + 1}: ${question.question}",
            fontSize: AppTextSize.s18,
          ),
          const SizedBox(height: 20),
          Column(
            children: shuffledOptions.map((option) {
              final bool isSelected =
                  selectedAnswer.toLowerCase() == option.toLowerCase();

              return GestureDetector(
                onTap: () {
                  context.read<QuizBloc>().add(SelectAnswer(
                      questionIndex: widget.questionIndex,
                      selectedAnswer: option));
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.orange : AppColors.bgColor,
                    border: Border.all(
                      color: isSelected ? AppColors.orange : AppColors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomText(
                    text: option,
                    fontSize: AppTextSize.s16,
                    color: isSelected ? AppColors.black : AppColors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
