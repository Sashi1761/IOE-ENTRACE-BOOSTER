import 'package:flutter/material.dart';
import 'package:projectapp/Syllabus/Screens/physics_syllabus_screen.dart';
import 'package:projectapp/screens/home_screen.dart';
import 'Screens/chemistry_syllabus_screen.dart';
import 'Screens/english_syllabus_screen.dart';
import 'Screens/math_syllabus_screen.dart';

class SyllabusPage extends StatelessWidget {
  const SyllabusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syllabus'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              thickness: 0.3,
              // color: Color.fromARGB(77, 133, 65, 65),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhysicsSyllabus(),
                    ));
              },
              child: Container(
                padding:
                    EdgeInsets.only(top:10, bottom:10,),
                child: ListTile(
            leading:Image.asset('assets/physics.png', height: 70),
            title:const Text('Physics',style:  TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () {  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>PhysicsSyllabus(),
                        ),
                      );
              
            },
          ),
              ),
            ),
            Divider(
              thickness: 0.8,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChemistrySyllabus(),
                    ));
              },
              child: Container(
              
                
                child:Container(
                padding:
                    EdgeInsets.only(top:10, bottom:10,),
                child: ListTile(
            leading:Image.asset('assets/chemistry.png', height: 70),
            title:const Text('Chemistry',style:  TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () {  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>ChemistrySyllabus(),
                        ),
                      );
              
            },
          ),
              ),
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MathSyllabus(),
                    ));
              },
              child: Container(
                
                child:Container(
                padding:
                    EdgeInsets.only(top:10, bottom:10,),
                child: ListTile(
            leading:Image.asset('assets/maths.png', height: 70),
            title:const Text('Maths',style:  TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () {  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>MathSyllabus(),
                        ),
                      );
              
            },
          ),
              ),
              ),
            ),
            Divider(
              thickness: 0.8,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnglishSyllabus(),
                    ));
              },
              child: Container(
                
                child: Container(
                padding:
                    EdgeInsets.only(top:10, bottom:10,),
                child: ListTile(
                  iconColor:Colors.teal ,
            leading:Icon(Icons.book, size: 70,),
            title:const Text('English',style:  TextStyle(color: Colors.black,fontSize: 20),),
            onTap: () {  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>PhysicsSyllabus(),
                        ),
                      );
              
            },
          ),
              ),
              ),
            ),
            Divider(
              thickness: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
