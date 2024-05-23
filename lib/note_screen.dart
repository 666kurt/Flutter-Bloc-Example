import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/note_bloc.dart';
import 'package:flutter_application_1/note_list.dart';
import 'package:flutter_application_1/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class NoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final Uuid uuid = Uuid();
  NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(child: NoteList()),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = _titleController.text;
                    final content = _contentController.text;
                    if (title.isNotEmpty && content.isNotEmpty) {
                      final note = Note(
                        id: uuid.v4(),
                        title: title,
                        content: content,
                      );
                      context.read<NoteBloc>().add(AddNote(note));
                      _titleController.clear();
                      _contentController.clear();
                    }
                  },
                  child: Text('Add note'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
