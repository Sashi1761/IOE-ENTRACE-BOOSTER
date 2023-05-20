import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectapp/screens/quizcategoryscreen.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: const Color.fromARGB(255, 74, 16, 11),
     animationDuration: Duration(milliseconds: 500),
    items: <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.man, size: 30),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
      body:SizedBox.expand(
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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizCategoryScreen(),
                    ),
                  );
                },
                child: Text('Begin Your Journey'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}