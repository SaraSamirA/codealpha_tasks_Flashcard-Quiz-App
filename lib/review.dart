

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ReviewFlashcardScreen extends StatelessWidget {
  final List<Flashcard> flashcards;

  ReviewFlashcardScreen({required this.flashcards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Review Flashcards',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),)),
      ),
      body: ListView.builder(
        itemCount: flashcards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(flashcards[index].question),
            subtitle: Text('Correct Answer: ${flashcards[index].choices[flashcards[index].correctAnswerIndex]}'),
          );
        },
      ),
    );
  }
}