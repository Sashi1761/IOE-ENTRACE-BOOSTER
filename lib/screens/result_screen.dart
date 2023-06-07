import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/components/groupdisscussion.dart';
import 'package:projectapp/components/rank_auth_button.dart';
import 'package:projectapp/screens/quizcategoryscreen.dart';

import '../components/action_button.dart';
import '../models/questions.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.score, required this.questions});
  final double score;
  final List<Question> questions;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result Screen',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: [
        const SizedBox(
          height: 80,
        ),
        Container(
          height: 130,
          width: 400,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(20).copyWith(
                topLeft: Radius.zero,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Result: ${widget.score}/${widget.questions.length}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Result Message'),
                          content: Container(
                            child: Text(
                              widget.score < widget.questions.length * 0.4
                                  ? 'You are weak. Study hard!'
                                  : widget.score >=
                                              widget.questions.length * 0.4 &&
                                          widget.score <
                                              widget.questions.length * 0.6
                                      ? 'You are good enough, but keep trying!'
                                      : widget.score >=
                                                  widget.questions.length *
                                                      0.6 &&
                                              widget.score <
                                                  widget.questions.length * 0.8
                                          ? 'Very good! You have a bright future!'
                                          : 'You are excellent! Your seat to Pulchowk is booked!',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('See Recommendation'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: const Text(
            'Note: No negative marking is included',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ActionButton(
          title: 'Practice Again',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QuizCategoryScreen(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        RankAuthButton(),
        const SizedBox(height: 20,),
        
      ]),
    );
  }

  @override
  void initState() {
    updateHighscore();
  }

  Future<void> updateHighscore() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser == null) return;

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(authUser.uid);

    final userDoc = await userRef.get();

    if (userDoc.exists) {
      final user = userDoc.data();

      if (user == null) return;
      final lastHighscore = user['score'];
      if (lastHighscore >= widget.score) {
        return;
      }
      userRef.update({'score': widget.score});
      return;
    } else {
      await userRef.set({
        'email': authUser.email,
        'photoUrl': authUser.photoURL,
        'score': widget.score,
        'name': authUser.displayName,
      });
    }
  }
}
