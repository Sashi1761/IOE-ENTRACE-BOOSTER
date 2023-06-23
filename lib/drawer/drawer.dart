import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectapp/components/groupdisscussion.dart';
import 'package:projectapp/screens/calenderScreen.dart';
import 'package:projectapp/screens/home_screen.dart';
import 'package:projectapp/screens/quizcategoryscreen.dart';

import '../chatapp/chatscreen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUserInformation();
  }

  Future<void> _getUserInformation() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    setState(() {
      _user = user;
    });
  }
   Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
       Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
    } catch (e) {
      // Handle logout error
       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>HomePage(),
                        ),
                      );
      print('Logout error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(_user?.displayName ?? ''),
            accountEmail: Text(_user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(_user?.photoURL ?? ''),
            ),
          ),
          ListTile(
            leading:const Icon(Icons.home, color: Colors.black,),
            title:const Text('H O M E ',style:TextStyle(color: Colors.black),),
            onTap: () {
               Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>HomePage(),
                        ),
                      );
            },
          ),
         ListTile(
            leading:const Icon(Icons.category, color: Colors.black,),
            title:const Text('C A T E G O R Y ',style:  TextStyle(color: Colors.black),),
            onTap: () {  Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>QuizCategoryScreen(),
                        ),
                      );
              
            },
          ),
           ListTile(
            leading:const Icon(Icons.calendar_today, color: Colors.black,),
            title:const Text('E V E N T  C A L E N D A R',style:  TextStyle(color: Colors.black),),
            onTap: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>EventCalendarScreen(),
                        ),
                      );
            },
          ),
          ListTile(
            leading:const Icon(Icons.book, color: Colors.black,),
            title:const Text('S Y L L A B U S',style: TextStyle(color: Colors.black),),
            onTap: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>const QuizCategoryScreen(),
                        ),
                      );
            },
          ),
           ListTile(
            leading:const Icon(Icons.chat, color: Colors.black,),
            title:const Text('C H A T',style: TextStyle(color: Colors.black),),
            onTap: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ),
                      );
            },
          ),
        const  SizedBox(height:100,),
          ListTile(
            leading:const Icon(Icons.logout, color: Colors.black,),
            title: const Text('L O G O U T',style:  TextStyle(color: Colors.black),),
            onTap: () {
              _logout();
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}








