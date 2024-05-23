import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/note_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        if (state is NoteLoadSuccess) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<NoteBloc>().add(RemoveNote(note.id));
                  },
                ),
              );
            },
          );
        }
        return Center(
          child: Text('No notes'),
        );
      },
    );
  }
}
