import 'package:flutter/material.dart';

class SyllabusSubtitle extends StatelessWidget {
  final String subtitle;
 SyllabusSubtitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}