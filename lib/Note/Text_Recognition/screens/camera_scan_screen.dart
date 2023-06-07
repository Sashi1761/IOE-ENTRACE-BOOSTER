import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  File? _image;
  String? _extractedText;
  TextEditingController _titleController = TextEditingController();
  List<String> _notes = [];

  Future<void> _getImageAndExtractText() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _extractedText = null; // Clear previous text
      } else {
        print('No image selected');
      }
    });

    if (_image != null) {
      final inputImage = InputImage.fromFile(_image!);
      final textRecognizer = GoogleMlKit.vision.textRecognizer();
      final recognisedText = await textRecognizer.processImage(inputImage);

      String extractedText = recognisedText.text;

      setState(() {
        _extractedText = extractedText;
      });

      textRecognizer.close();
    }
  }

  Future<void> _saveTextAsNote() async {
    if (_extractedText != null) {
      String title = _titleController.text.trim();
      String content = _extractedText!.trim();
      if (title.isNotEmpty && content.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> savedNotes = prefs.getStringList('notes') ?? [];

        savedNotes.add("$title: $content");
        await prefs.setStringList('notes', savedNotes);
        print('Text saved as note');

        _titleController.clear();
        _image = null;
        _extractedText = null;

        setState(() {
          _notes = savedNotes;
        });
      }
    }
  }

  Future<List<String>> _loadSavedNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('notes') ?? [];
  }

  @override
  void initState() {
    super.initState();
    _loadSavedNotes().then((notes) {
      setState(() {
        _notes = notes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              child: Text('Scan Image'),
              onPressed: _getImageAndExtractText,
            ),
            SizedBox(height: 20),
            _extractedText != null
                ? Text(_extractedText!)
                : Text('No text extracted'),
            SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save Note'),
              onPressed: _saveTextAsNote,
            ),
            SizedBox(height: 20),
            Text(
              'Notes:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  final noteParts = note.split(':');
                  final title = noteParts[0].trim();
                  final content = noteParts[1].trim();

                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {
                        _notes.removeAt(index);
                        
                        SharedPreferences.getInstance().then((prefs) {
                          prefs.setStringList('notes', _notes);
                        });
                      });
                    },
                    background: Container(
                      height: 80,
                      width: 100,
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16.0),
                    ),
                    child: ListTile(
                      title: Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(content),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
