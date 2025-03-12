import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/core/theme/app_text_size.dart';
import 'package:quiz_api_project_wc/core/ui_components/custom_text.dart';
import 'package:quiz_api_project_wc/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_api_project_wc/features/quiz/presentation/bloc/quiz_event.dart';

import '../../../../core/theme/app_colors.dart';

class NavigationButton extends StatefulWidget {
  final int currentIndex;
  final dynamic state;
  final PageController pageController;
  const NavigationButton(
      {super.key,
      required this.currentIndex,
      this.state,
      required this.pageController});

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  void _nextQuestion(BuildContext context) {
    if (widget.currentIndex < widget.state.quizResponse.results!.length - 1) {
      context.read<QuizBloc>().add(NextQuestionEvent());
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _prevQuestion(BuildContext context) {
    if (widget.currentIndex > 0) {
      context.read<QuizBloc>().add(PreviousQuestionEvent());
      widget.pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _submitQuiz() {
    context.read<QuizBloc>().add(SubmitQuiz());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.currentIndex > 0)
            ElevatedButton(
              onPressed: () {
                _prevQuestion(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
              ),
              child: CustomText(
                  text: AppString.previous,
                  fontSize: AppTextSize.s16,
                  color: AppColors.black),
            )
          else
            const SizedBox(width: 80), // Empty space for alignment

          CustomText(
            text:
                "${widget.currentIndex + 1}/${widget.state.quizResponse.results!.length}",
            fontSize: AppTextSize.s16,
          ),

          if (widget.currentIndex <
              widget.state.quizResponse.results!.length - 1)
            ElevatedButton(
              onPressed: () {
                _nextQuestion(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
              ),
              child: CustomText(
                text: AppString.next,
                fontSize: AppTextSize.s16,
                color: AppColors.black,
              ),
            )
          else
            ElevatedButton(
              onPressed: _submitQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
              ),
              child: CustomText(
                text: AppString.submit,
                fontSize: AppTextSize.s18,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
