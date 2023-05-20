import 'package:flutter/material.dart';

class QuizCategoryScreen extends StatelessWidget {
  const QuizCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categores',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 60, 6, 2),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'What do you Want to learn Today!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                'https://img.freepik.com/premium-vector/engineer-profession-mascot-logo-vector-cartoon-style_180868-1122.jpg?w=2000',
                height: 200,
              )
            ],
          ),
        )
      ]),
    );
  }
}
