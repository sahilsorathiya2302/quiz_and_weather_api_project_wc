import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/feature/quiz/presentation/widget/navigation_button.dart';
import 'package:quiz_api_project_wc/feature/quiz/presentation/widget/question_widget.dart';

import '../bloc/quiz_state.dart';

class QuestionScreen extends StatefulWidget {
  final QuizLoaded state;

  const QuestionScreen({super.key, required this.state});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable swipe, use buttons
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.state.quizResponse.results!.length,
              itemBuilder: (context, index) {
                return QuestionWidget(
                  state: widget.state,
                  questionIndex: index,
                );
              },
            ),
          ),

          // Navigation Buttons
          NavigationButton(
            currentIndex: _currentIndex,
            pageController: _pageController,
            state: widget.state,
          )
        ],
      ),
    );
  }
}
