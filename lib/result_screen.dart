import 'package:flutter/material.dart';

import 'main.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnswers;
  final List<Map<String, Object>> questions;

  ResultsScreen({required this.selectedAnswers, required this.questions});

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i]['correctAnswer']) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    int totalQuestions = questions.length;
    int score = calculateScore();

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Results:',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Score: $score / $totalQuestions',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Go Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
