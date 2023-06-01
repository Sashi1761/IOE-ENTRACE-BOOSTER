import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/components/action_button.dart';
import 'package:projectapp/screens/ranking_screen.dart';
import 'package:projectapp/services/auth_service.dart';

class RankAuthButton extends StatefulWidget {
  const RankAuthButton({super.key});

  @override
  State<RankAuthButton> createState() => _RankAuthButtonState();
}

class _RankAuthButtonState extends State<RankAuthButton> {
 bool _isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    if(_isLoggedIn) return ActionButton(title: 'Ranking', onTap:(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RankingScreen()));
    });
      
      return ActionButton(title: 'Sign in With Google', onTap: (){
        AuthService.signInWithGoogle();
      }
      );
    
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