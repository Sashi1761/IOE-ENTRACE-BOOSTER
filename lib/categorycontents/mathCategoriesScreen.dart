import 'package:flutter/material.dart';
import 'package:projectapp/mathcategores/Algebra.dart';
import 'package:projectapp/mathcategores/Calculus.dart';
import 'package:projectapp/mathcategores/CoordinateGeometry.dart';
import 'package:projectapp/mathcategores/Trigonomert.dart';
import 'package:projectapp/mathcategores/vectors.dart';

class MathCategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Algebra',
    'Trigonometry',
    'Coordinate Geometry',
    'Calculus',
    'Vectors'
  ];

  final List<IconData> icons = [
    Icons.add,
    Icons.functions,
    Icons.cloud,
    Icons.grid_3x3,
    Icons.arrow_right_alt,
    
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
  if (category == 'Algebra') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Algebra()),
    );
  } else if (category == 'Trigonometry') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Trigonometry()),
    );
  } else if (category == 'Coordinate Geometry') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CoordinateGeometry()),
    );
  } else if (category == 'Calculus') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Calculus()),
    );
  }else if (category == 'Vectors') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => vectors()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Categories', style: TextStyle(color: Colors.black),),
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
