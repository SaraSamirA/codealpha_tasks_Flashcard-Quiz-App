import 'package:flashcard/quiz.dart';
import 'package:flashcard/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add-save-flashcard.dart';
import 'main.dart';

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Flashcard> flashcards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flashcard Quiz',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(flashcards[index].question),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width:250 ,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _addFlashcard(context);
                },
                child: Text(
                  'Add Flashcard',
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
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width:250 ,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _startQuiz(context);
                },
                child: Text(
                  'Start Quiz',
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Container(
              width:250 ,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _reviewFlashcards(context);
                },
                child: Text(
                  'Review Flashcards',
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
            ),
          ),
          SizedBox(height: 200,)
        ],
      ),
    );
  }

  void _addFlashcard(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFlashcardScreen()),
    );
    if (result != null && result is Flashcard) {
      setState(() {
        flashcards.add(result);
      });
    }
  }

  void _startQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizScreen(flashcards: flashcards)),
    );
  }

  void _reviewFlashcards(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewFlashcardScreen(flashcards: flashcards)),
    );
  }
}