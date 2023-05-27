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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
         const  SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child:  Center(
                child: InkWell(
                  onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhysicsScreen(totalTime: 10, question: question,)
                        ),
                      );
                    }, 
                  child: ListTile(
                  title: Text('Mechanics', style: TextStyle(color: Colors.black, fontSize:20 ),),
                  leading: Icon(Icons.book),
                  selectedTileColor: Colors.red,
                  ),
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: ListTile(
                title: Text('Heat', style: TextStyle(color: Colors.black, fontSize:20 ),),
                leading: Icon(Icons.book),
                selectedTileColor: Colors.red,
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: ListTile(
                title: Text('Optics', style: TextStyle(color: Colors.black, fontSize:20 ),),
                leading: Icon(Icons.book),
                selectedTileColor: Colors.blue,
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: ListTile(
                title: Text('Sound', style: TextStyle(color: Colors.black, fontSize:20 ),),
                leading: Icon(Icons.book),
                selectedTileColor: Colors.blue,
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: ListTile(
                title: Text('Electricity', style: TextStyle(color: Colors.black, fontSize:20 ),),
                leading: Icon(Icons.book),
                selectedTileColor: Colors.blue,
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: ListTile(
                title: Text('Atomic Phyaics and Electronics', style: TextStyle(color: Colors.black, fontSize:20 ),),
                leading: Icon(Icons.book),
                selectedTileColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
