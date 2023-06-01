import 'package:flutter/material.dart';
import 'package:projectapp/Note/Text_Recognition/screens/camera_scan_screen.dart';
import 'package:projectapp/Note/addNote_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class Note {
  String header;
  String content;

  Note({
    required this.header,
    required this.content,
  });
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;

  @override
  void initState() {
    super.initState();
    notes = [];
    loadNotes();
  }

  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? noteHeaders = prefs.getStringList('noteHeaders');
    List<String>? noteContents = prefs.getStringList('noteContents');

    if (noteHeaders != null && noteContents != null) {
      setState(() {
        for (int i = 0; i < noteHeaders.length; i++) {
          notes.add(Note(
            header: noteHeaders[i],
            content: noteContents[i],
          ));
        }
      });
    }
  }

  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> noteHeaders = [];
    List<String> noteContents = [];

    for (Note note in notes) {
      noteHeaders.add(note.header);
      noteContents.add(note.content);
    }

    await prefs.setStringList('noteHeaders', noteHeaders);
    await prefs.setStringList('noteContents', noteContents);
  }

  void addNote() async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNotePage()));

    if (result != null && result is Note) {
      setState(() {
        notes.add(result);
        saveNotes();
      });
    }
  }

  void editNote(int index) async {
    final result = await Navigator.pushNamed(
      context,
      '/addNote',
      arguments: notes[index],
    );

    if (result != null && result is Note) {
      setState(() {
        notes[index] = result;
        saveNotes();
      });
    }
  }

  void removeNote(int index) {
    setState(() {
      notes.removeAt(index);
      saveNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].header),
                  subtitle: Text(notes[index].content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => editNote(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeNote(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, bottom: 16),
            child: FloatingActionButton(
              onPressed: () {
                // Add your camera button functionality here
                // This will be executed when the camera button is pressed
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraScanScreen()));
              },
              child: Icon(Icons.camera),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 16, bottom: 16),
            child: FloatingActionButton(
          onPressed: addNote,
    child: Icon(Icons.add),
    ),
          )
        ],
      ),
    );
  }
}