import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/questions.dart';
import '../screens/physics_screen.dart';

class Mechanics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mechanics',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 4, // Number of containers per row
        childAspectRatio: 1.0, // Width to height ratio of each container
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('physicsset1')
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
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PhysicsScreen(
                                totalTime: 120,
                                question: questions,
                              )),
                    );
                  },
                  child: Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,),
                    child: const Center(
                      child: Text(
                        'Set 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('physicsset1')
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
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PhysicsScreen(
                                totalTime: 120,
                                question: questions,
                              )),
                    );
                  },
                  child: Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                   ),
                    child: const Center(
                      child: Text(
                        'Set 2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('physicsset3')
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
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PhysicsScreen(
                                totalTime: 120,
                                question: questions,
                              )),
                    );
                  },
                  child: Container(
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        'Set 3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('physicsset1')
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
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PhysicsScreen(
                                totalTime: 120,
                                question: questions,
                              )),
                    );
                  },
                  child: Container(
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.teal,
                    ),
                    child: const Center(
                      child: Text(
                        'Set 4',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
         
        ],
      ),
    );
  }
}
