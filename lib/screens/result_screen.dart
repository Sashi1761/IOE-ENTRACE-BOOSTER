import 'package:flutter/material.dart';
import 'package:projectapp/components/gradient_box.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.score, required this.totalQuestions});
  final int score;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: GradientBox(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text('Result: $score/$totalQuestions',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
