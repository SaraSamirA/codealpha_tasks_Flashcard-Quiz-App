import 'package:flutter/material.dart';

import 'main.dart';

class QuizScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  QuizScreen({required this.flashcards});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentCardIndex = 0;
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentCardIndex + 1} / ${widget.flashcards.length}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.flashcards[currentCardIndex].question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 32.0),
            ..._buildChoicesButtons(widget.flashcards[currentCardIndex].choices),
            SizedBox(height: 32.0),
            Text(
              'Correct Answers: $correctAnswers / ${widget.flashcards.length}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChoicesButtons(List<String> choices) {
    List<Widget> choiceButtons = [];
    for (int i = 0; i < choices.length; i++) {
      choiceButtons.add(
        ElevatedButton(
          onPressed: () {
            _checkAnswer(i);
          },
          child: Text(choices[i]),
        ),
      );
      choiceButtons.add(SizedBox(height: 16.0));
    }
    return choiceButtons;
  }

  void _checkAnswer(int selectedAnswerIndex) {
    if (selectedAnswerIndex == widget.flashcards[currentCardIndex].correctAnswerIndex) {
      setState(() {
        correctAnswers++;
      });
    }
    if (currentCardIndex < widget.flashcards.length - 1) {
      setState(() {
        currentCardIndex++;
      });
    } else {
      _showResultDialog(context);
    }
  }

  void _showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Result'),
        content: Text('You scored $correctAnswers out of ${widget.flashcards.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}