import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/components/gradient_box.dart';
import 'package:projectapp/components/rank_auth_button.dart';
import 'package:projectapp/screens/quizcategoryscreen.dart';

import '../components/action_button.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {super.key, required this.score, required this.totalQuestions});
  final double score;
  final int totalQuestions;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: [
        const SizedBox(
          height: 80,
        ),
        Container(
          height: 120,
          width: 400,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
            decoration: BoxDecoration(
              
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: Radius.zero,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child:Center(
                child: Text(
                        'Result: ${widget.score}/${widget.totalQuestions}',
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ),
        const SizedBox(height:30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: const Text('Note: No negative marking is included',style: TextStyle(color: Colors.black, fontSize: 18),),
        ),
      const  SizedBox(height: 20,),
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
        
        RankAuthButton()
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
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
    }
    else{ 

  await userRef.set({
      'email': authUser.email,
      'photoUrl': authUser.photoURL,
      'score': widget.score,
      'name': authUser.displayName,
    });
    }
  }
}




