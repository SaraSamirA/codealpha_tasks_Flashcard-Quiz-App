import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddFlashcardScreen extends StatelessWidget {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController choicesController = TextEditingController();
  final TextEditingController correctAnswerIndexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                labelText: 'Question',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: choicesController,
              decoration: InputDecoration(
                labelText: 'Choices (Separate with commas)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: correctAnswerIndexController,
              decoration: InputDecoration(
                labelText: 'Index of Correct Answer',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveFlashcard(context);
              },
              child: Text(
                'Save',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xff615a57)
                    .withOpacity(0.5)),
              ),
            ),


          ],
        ),
      ),
    );
  }

  void _saveFlashcard(BuildContext context) {
    final question = questionController.text;
    final choices = choicesController.text.split(',').map((choice) => choice.trim()).toList();
    final correctAnswerIndex = int.tryParse(correctAnswerIndexController.text) ?? 0;

    if (question.isNotEmpty && choices.isNotEmpty && correctAnswerIndex >= 0 && correctAnswerIndex < choices.length) {
      Navigator.pop(context, Flashcard(question: question, choices: choices, correctAnswerIndex: correctAnswerIndex));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please enter a valid question, choices, and correct answer index.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}