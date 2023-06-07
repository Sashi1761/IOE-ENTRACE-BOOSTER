import 'package:flutter/material.dart';

import '../chemistryCategoryscreen/LanguageofChemistry.dart';
import '../chemistryCategoryscreen/Metals.dart';
import '../chemistryCategoryscreen/NonMetals.dart';
import '../chemistryCategoryscreen/organicChemistry.dart';

class ChemistryCategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Language of Chemistry and Physical chemistry',
    'Non metals',
    'Metals',
    'Organic Chemistry',
  ];

  final List<IconData> icons = [
    Icons.scatter_plot,
    Icons.link,
    Icons.cloud,
    Icons.receipt,
    Icons.format_paint,
    Icons.flare,
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
  if (category == 'Language of Chemistry and Physical chemistry') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LanguageofChemistry()),
    );
  } else if (category == 'Non metals') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NonMetals()),
    );
  } else if (category == 'Metals') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Metals()),
    );
  } else if (category == 'Organic Chemistry') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrganicChemistry()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chemistry Categories',
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
