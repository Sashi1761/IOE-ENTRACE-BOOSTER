import 'package:flutter/material.dart';

import '../widgets.dart';

class EnglishSyllabus extends StatelessWidget {
  const EnglishSyllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syllabus(English)'),
         centerTitle: true,
        backgroundColor:Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10,top: 15, bottom: 20, right: 5),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SyllabusSubtitle(
                    "Comprehension of reading passage on a variety of topics and style with special references: "),
                Text('(i) General English AND '
                    '(ii) Technical English.'),
                SyllabusSubtitle('Grammars:'),
                Text(
                  'Parts of Speech, Basic Grammatical Patterns/Structures, Tense and Aspects, Conditional sentences, Verbal: Infinitives, Participles and Gerunds, Direct and Indirect Speech, Active and Passive Voice, Kinds of sentences, Transformation of sentences, Concord/Agreement, Vocabulary, Use of Prepositions, Idiomatic expressions, Punctuation, Phonemes and Phonetic Symbols, Word Stress.',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
