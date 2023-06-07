import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/chatapp/chatscreen.dart';
import 'package:projectapp/components/rank_auth_button.dart';
import 'package:projectapp/screens/home_screen.dart';
class GroupDiscussion extends StatefulWidget {
  const GroupDiscussion({super.key});

  @override
  State<GroupDiscussion> createState() => _GroupDiscussion();
}

class _GroupDiscussion extends State<GroupDiscussion> {
 bool _isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    if(_isLoggedIn) return ChatScreen();
      
      return HomePage();
      
  }
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.userChanges().listen((user) {
     if(user == null){

     
      setState(() {
        _isLoggedIn = false;
      });
      return;

    }
    setState((){
      _isLoggedIn = true;

    });
    
    });
  }
}