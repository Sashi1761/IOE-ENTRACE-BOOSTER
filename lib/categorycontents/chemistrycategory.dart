import 'package:flutter/material.dart';

class ChemistryCategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Atomic Structure',
    'Chemical Bonding',
    'States of Matter',
    'Chemical Reactions',
    'Acids and Bases',
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
    if (category == 'Atomic Structure') {
      Navigator.pushNamed(context, '/atomic_structure');
    } else if (category == 'Chemical Bonding') {
      Navigator.pushNamed(context, '/chemical_bonding');
    } else if (category == 'States of Matter') {
      Navigator.pushNamed(context, '/states_of_matter');
    } else if (category == 'Chemical Reactions') {
      Navigator.pushNamed(context, '/chemical_reactions');
    } else if (category == 'Acids and Bases') {
      Navigator.pushNamed(context, '/acids_and_bases');
    } else if (category == 'Organic Chemistry') {
      Navigator.pushNamed(context, '/organic_chemistry');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemistry Categories', style: TextStyle(color: Colors.black),),
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
