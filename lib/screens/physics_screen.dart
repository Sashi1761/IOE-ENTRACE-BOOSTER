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
  double _score = 0;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;

    _timer = Timer.periodic( const Duration(seconds: 1), (timer) {
      print(_currentTime);
      setState(() {
        _currentTime = _currentTime - 1;
      });

      if (_currentTime == 0) {
        _timer.cancel();
         pushResultScreen(context);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final currentquestion = widget.question[_currentIndex];
    return Scaffold(
      appBar: AppBar(
       title: Text(''), 
       backgroundColor:Colors.white,
      ),
      backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      
                      backgroundColor:Colors.amber,
                      value: _currentTime / widget.totalTime,
                    ),
                  ],
                ),
              ),
            ),
              const SizedBox(height: 10),
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${_currentIndex + 1}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Total Questions: ${widget.question.length}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Question',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              currentquestion.question,
              style: const TextStyle(color: Colors.black, fontSize: 19),
            ),
          const SizedBox(height: 60,),
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
                         const  Duration(milliseconds: 200),
                          () {
                            if (_currentIndex == widget.question.length - 1) {
                              pushResultScreen(context);
                            }else {
                            setState(() {
                             
                              _currentIndex++;
                              _selectedAnswer = '';

                              
                            });
                            }
                           
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
        builder: (context) => ResultScreen(questions: widget.question,score:_score),
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

    if (answer == correctAnswer) {
      return Colors.green;
    }

    return Colors.redAccent;
  }
}

