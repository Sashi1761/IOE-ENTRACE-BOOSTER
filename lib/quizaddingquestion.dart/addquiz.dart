import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class QuizQuestion {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> quizQuestions = [];

  final TextEditingController _questionTextController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _option4Controller = TextEditingController();
  int _correctAnswerIndex = 0;

  @override
  void dispose() {
    _questionTextController.dispose();
    _option1Controller.dispose();
    _option2Controller.dispose();
    _option3Controller.dispose();
    _option4Controller.dispose();
    super.dispose();
  }

  void storeQuizQuestion(QuizQuestion quizQuestion) async {
    try {
      await FirebaseFirestore.instance.collection('quiz_questions').add({
        'questionText': quizQuestion.questionText,
        'options': quizQuestion.options,
        'correctAnswerIndex': quizQuestion.correctAnswerIndex,
      });
      print('Quiz question stored successfully.');
    } catch (e) {
      print('Error storing quiz question: $e');
    }
  }

  void addQuizQuestion() {
    var questionText = _questionTextController.text;
    var options = [
      _option1Controller.text,
      _option2Controller.text,
      _option3Controller.text,
      _option4Controller.text,
    ];

    var quizQuestion = QuizQuestion(
      questionText: questionText,
      options: options,
      correctAnswerIndex: _correctAnswerIndex,
    );

    storeQuizQuestion(quizQuestion);
    setState(() {
      quizQuestions.add(quizQuestion);
    });

    _questionTextController.clear();
    _option1Controller.clear();
    _option2Controller.clear();
    _option3Controller.clear();
    _option4Controller.clear();
    _correctAnswerIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _questionTextController,
                decoration: InputDecoration(
                  labelText: 'Question Text',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _option1Controller,
                decoration: InputDecoration(
                  labelText: 'Option 1',
                ),
              ),
              TextField(
                controller: _option2Controller,
                decoration: InputDecoration(
                  labelText: 'Option 2',
                ),
              ),
              TextField(
                controller: _option3Controller,
                decoration: InputDecoration(
                  labelText: 'Option 3',
                ),
              ),
              TextField(
                controller: _option4Controller,
                decoration: InputDecoration(
                  labelText: 'Option 4',
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButton<int>(
                value: _correctAnswerIndex,
                onChanged: (value) {
                  setState(() {
                    _correctAnswerIndex = value ?? 0;
                  });
                },
                items: [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Option 1'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Option 2'),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text('Option 3'),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text('Option 4'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: addQuizQuestion,
                child: Text('Add Question'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Quiz Questions:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: quizQuestions.length,
                itemBuilder: (context, index) {
                  var question = quizQuestions[index];
                  return Card(
                    child: ListTile(
                      title: Text(question.questionText),
                      subtitle: Text('Correct Answer: ${question.options[question.correctAnswerIndex]}'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
