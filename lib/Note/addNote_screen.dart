import 'package:flutter/material.dart';

import '../main.dart';
import 'note_screen.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController headerController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    headerController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    headerController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void addNote() {
    if (headerController.text.isNotEmpty && contentController.text.isNotEmpty) {
      Note newNote = Note(
        header: headerController.text,
        content: contentController.text,
      );
      Navigator.pop(context, newNote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: headerController,
              decoration: InputDecoration(
                labelText: 'Note Header',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Note Content',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addNote,
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}