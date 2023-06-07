import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> questions = [];
  List<String> filteredQuestions = [];
  List<dynamic> filteredAnswers = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('englishset1');

    QuerySnapshot snapshot = await collection.get();
    List<dynamic> fetchedQuestions =
        snapshot.docs.map((doc) => doc['question']).toList();
    filteredAnswers = snapshot.docs.map((doc) => doc['correctAnswer']).toList();

    List<String> sortedQuestions = dualPivotQuicksort(fetchedQuestions.cast<String>());

    setState(() {
      questions = sortedQuestions;
      filteredQuestions = sortedQuestions;
    });
  }

  List<String> dualPivotQuicksort(List<String> arr) {
    if (arr.length <= 1) {
      return arr;
    }

    int len = arr.length;
    String pivot1 = arr[0];
    String pivot2 = arr[len - 1];

    if (pivot1.compareTo(pivot2) > 0) {
      String temp = pivot1;
      pivot1 = pivot2;
      pivot2 = temp;
    }

    List<String> left = [];
    List<String> middle1 = [];
    List<String> middle2 = [];
    List<String> right = [];

    for (String question in arr) {
      if (question.compareTo(pivot1) < 0) {
        left.add(question);
      } else if (question.compareTo(pivot2) < 0) {
        middle1.add(question);
      } else if (question.compareTo(pivot2) > 0) {
        right.add(question);
      } else {
        middle2.add(question);
      }
    }

    return [
      ...dualPivotQuicksort(left),
      ...middle1,
      ...dualPivotQuicksort(middle2),
      ...right
    ];
  }

  void filterQuestions(String query) {
    setState(() {
      filteredQuestions = questions
          .where((question) =>
              question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: filterQuestions,
              decoration: const InputDecoration(
                labelText: 'Search Question',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredQuestions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(filteredAnswers);
                  },
                  child: ListTile(
                    title: Text(filteredQuestions[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
