import 'package:flashcard/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



class Flashcard {
  final String question;
  final List<String> choices;
  final int correctAnswerIndex;

  Flashcard({required this.question, required this.choices, required this.correctAnswerIndex});
}
