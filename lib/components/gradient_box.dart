import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  const GradientBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade800, Colors.teal.shade200],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}




 













                      //    StreamBuilder<QuerySnapshot>(
                      // stream: FirebaseFirestore.instance
                      //     .collection('pquestions')
                      //     .snapshots(),
                      // builder: ((context, snapshot) {
                      //   if (!snapshot.hasData) {
                      //     return const  Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   }
                      //   final questionDocs = snapshot.data?.docs;
                      //   final questions = questionDocs!
                      //       .map((e) => Question.fromQueryDocumentSnapshot(e))
                      //       .toList();
                      //   return
                      // }),