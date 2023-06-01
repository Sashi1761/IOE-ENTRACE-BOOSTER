import 'package:flutter/material.dart';
import 'package:projectapp/categorycontents/chemistrycategory.dart';
import 'package:projectapp/categorycontents/physicscategory.dart';
import 'package:projectapp/drawer/drawer.dart';
import '../Note/Text_Recognition/screens/camera_scan_screen.dart';
import '../Syllabus/syllabus_screen.dart';
import '../categorycontents/englishCategoriesScreen.dart';
import '../categorycontents/mathCategoriesScreen.dart';
import 'calenderScreen.dart';

class QuizCategoryScreen extends StatefulWidget {
  const QuizCategoryScreen({super.key});

  @override
  State<QuizCategoryScreen> createState() => _QuizCategoryScreenState();
}

class _QuizCategoryScreenState extends State<QuizCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
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
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Hello! What Do you Want To Learn Today!',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhysicsCategoryScreen(),
                              ));
                          // PhysicsScreen(totalTime: 10,question: question,)
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.teal.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/physics.png', height: 70),
                              const Text(
                                "Physics",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChemistryCategoryScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/chemistry.png', height: 70),
                              const Text(
                                "Chemistry",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MathCategoryScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/maths.png', height: 70),
                              const Text(
                                "Maths",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>const SyllabusPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/syllabus.png', height: 70),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Syllabus",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventCalendarScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.purple.shade300,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 70,
                                color: Colors.white,
                              ),
                              Text(
                                "Event Calender",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EnglishQuizCategoryScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 5, 71, 48),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book,
                                size: 70,
                                color: Colors.white,
                              ),
                              Text(
                                "English",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraScanScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.note,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                "keep Notes",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
