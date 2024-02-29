import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flashcard.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/vector.jpg'),
          //  fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 100),
            Text(
              'Flashcard Quiz App',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  width: 100,
                  height: 50,
                  child: IconButton(icon:Icon( Icons.arrow_forward,color: Colors.white,), onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlashcardScreen()),
                    );
                  },),
                ),
                SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}