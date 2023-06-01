import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isPrimary = true,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: isPrimary
          ? ElevatedButton(
            style: ElevatedButton.styleFrom(
           primary: Colors.purple.shade100, // Background color
  ),
              onPressed: () => onTap(),
              child: Text(title, style: TextStyle(color: Colors.black),),
              
            )
          : TextButton(
              onPressed: () => onTap(),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
    );
  }
}