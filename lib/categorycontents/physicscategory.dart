import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/models/questions.dart';
import 'package:projectapp/screens/physics_screen.dart';

import 'package:projectapp/screens/quizcategoryscreen.dart';

class PhysicsCategoryScreen extends StatelessWidget {
  const PhysicsCategoryScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physics Categories'),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuizCategoryScreen()));
          },
        ),
      ),
      body:Column(
        children: [
          Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Column(
                    children: [
                      Center(
                        child: 
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
                          return
                        InkWell(
                          onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PhysicsScreen(totalTime: 10, question: questions,)
                                ),
                              );
                            }, 
                          child: const ListTile(
                          title: Text('Mechanics', style: TextStyle(color: Colors.black, fontSize:20 ),),
                          leading: Icon(Icons.book),
                          selectedTileColor: Colors.red,
                          ),
                        );
                         }),
                      ),
                         

                ),
                    ]
                  ),
          ),
         const SizedBox( height: 40,),
         Text('arko ayo aba hai'),
 Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Column(
                    children: [
                      Center(
                        child: 
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
                          return
                        InkWell(
                          onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PhysicsScreen(totalTime: 10, question: questions,)
                                ),
                              );
                            }, 
                          child: const ListTile(
                          title: Text('Mechanics', style: TextStyle(color: Colors.black, fontSize:20 ),),
                          leading: Icon(Icons.book),
                          selectedTileColor: Colors.red,
                          ),
                        );
                         }),
                      ),
                      

                ),
                    ]
                  ),
                  

                   
          ),
        ],
        
      ),
              
          );
        
      
    
  }
}
