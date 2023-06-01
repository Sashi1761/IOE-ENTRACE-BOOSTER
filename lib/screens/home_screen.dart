import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/components/action_button.dart';
import 'package:projectapp/components/rank_auth_button.dart';
import 'package:projectapp/models/questions.dart';
import 'package:projectapp/screens/quizcategoryscreen.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 28, 13, 3),
              Color.fromARGB(255, 85, 4, 16)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'IOE ENTRACE BOOSTER',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Giving IOE Aspirant A New Life',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('testquestion')
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final questionDocs = snapshot.data?.docs;
                  final questions = questionDocs!
                      .map((e) => Question.fromQueryDocumentSnapshot(e))
                      .toList();
                  return ActionButton(title:'Begin Your Journey' , onTap:
                   () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const QuizCategoryScreen(),
                        ),
                      );
                    }
                  );
                }),
              ),
             const  SizedBox(height: 40,),
             const  RankAuthButton(),
            ],
          ),
        ),
      ),
    );
  }
}
