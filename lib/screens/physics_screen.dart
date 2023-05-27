import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projectapp/models/questions.dart';
import 'package:projectapp/screens/result_screen.dart';

class PhysicsScreen extends StatefulWidget {
  const PhysicsScreen(
      {super.key, required this.totalTime, required this.question});

  final int totalTime;
  final List<Question> question;

  @override
  State<PhysicsScreen> createState() => _PhysicsScreenState();
}

class _PhysicsScreenState extends State<PhysicsScreen> {
  late int _currentTime;
  late Timer _timer;
  int _currentIndex = 0;
  String _selectedAnswer = '';
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_currentTime);
      setState(() {
        _currentTime = _currentTime - 1;
      });

      if (_currentTime == 0) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    pushResultScreen(context);
    super.dispose();
  }

  Widget build(BuildContext context) {
    final currentquestion = widget.question[_currentIndex];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 67, 67),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Colors.teal,
                      value: _currentTime / widget.totalTime,
                    ),
                    Center(
                      child: Text(
                        _currentTime.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Question',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              currentquestion.question,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final answer = currentquestion.answers[index];
                  return AnswerTile(
                      isSelected: answer == _selectedAnswer,
                      answer: answer,
                      correctAnswer: currentquestion.correctAnswer,
                      onTap: () {
                        setState(() {
                          _selectedAnswer = answer;
                        });

                        if (answer == currentquestion.correctAnswer) {
                          _score++;
                        }
                        Future.delayed(
                          Duration(milliseconds: 500),
                          () {
                            if (_currentIndex == widget.question.length - 1) {
                              pushResultScreen(context);
                            }
                            setState(() {
                              _currentIndex++;
                              _selectedAnswer = '';
                            });
                          },
                        );
                      });
                },
                itemCount: currentquestion.answers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pushResultScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(totalQuestions: widget.question.length,score:_score ,),
      ),
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.isSelected,
    required this.answer,
    required this.correctAnswer,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String answer;
  final String correctAnswer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: () => onTap(),
        title: Center(
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Color get cardColor {
    if (!isSelected) return Colors.white;

    if (isSelected) {
      return Colors.green;
    }

    return Colors.white;
  }
}
