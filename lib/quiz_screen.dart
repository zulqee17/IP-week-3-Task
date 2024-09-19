import 'package:flutter/material.dart';
import 'package:week_three_task/result_screen.dart';

import 'main.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<String> _selectedAnswers = [];

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of Pakistan?',
      'answers': ['Islamabad', 'Peshawar', 'Karachi', 'Abbottabad'],
      'correctAnswer': 'Islamabad',
    },
    {
      'question': 'Which is the largest planet of Solar system',
      'answers': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'correctAnswer': 'Jupiter',
    },
    {
      'question': 'When did pakistan got his independence',
      'answers': ['1947', '1937', '1984', '1999'],
      'correctAnswer': '1947',
    },
  ];

  void _nextQuestion(String selectedAnswer) {
    setState(() {
      _selectedAnswers.add(selectedAnswer);
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResults();
      }
    });
  }

  void _showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          selectedAnswers: _selectedAnswers,
          questions: _questions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex]['question'] as String;
    final answers = _questions[_currentQuestionIndex]['answers'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Question'),
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                question,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Column(
                children: answers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () => _nextQuestion(answer),
                      child: Text(answer),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
