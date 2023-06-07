import 'package:flutter/material.dart';

import '../physicscategory/AtomicPhysicsandElectronics.dart';
import '../physicscategory/Electricity.dart';
import '../physicscategory/Heat.dart';
import '../physicscategory/Optics.dart';
import '../physicscategory/Sound.dart';
import '../physicscategory/mechanics.dart';

class PhysicsCategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Mechanics',
    'Heat',
    'optics',
    'Sound',
    'Electricity',
    'Atomic Physics and Electronics'
  ];

  final List<IconData> icons = [
    Icons.vibration,
    Icons.sunny,
     Icons.flash_on,
    Icons.volume_up,
   
    Icons.memory,
    Icons.language,
   
  ];
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.teal,
  ];

 void navigateToCategoryPage(BuildContext context, String category) {
  // You can define your own routes and navigate to the respective page
  // based on the selected category
  if (category == 'Mechanics') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Mechanics()),
    );
  } else if (category == 'Heat') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Heat()),
    );
  } else if (category == 'Optics') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Optics()),
    );
  } else if (category == 'Sound') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Sound()),
    );
  }else if (category == 'Electricity') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Electricity()),
    );
  }else if (category == 'Atomic Physics and Electronics') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AtomicPhysicsandElectronics()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Physics Categories',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                navigateToCategoryPage(context, categories[index]);
              },
              leading: Icon(icons[index], color: colors[index]),
              title: Text(categories[index]),
            ),
          );
        },
      ),
    );
  }
}
