import 'package:flutter/material.dart';
import 'package:projectapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectapp/splash/SplaceScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IOE ENTRANCE BOOSTER',
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:const AppBarTheme(
            backgroundColor: Colors.white,
          )),
      home: const SplashScreen(),
    );
  }
}
