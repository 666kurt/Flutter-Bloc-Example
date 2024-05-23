part of 'note_bloc.dart';

abstract class NoteState {
  const NoteState();
}

class NoteInitial extends NoteState {}

class NoteLoadSuccess extends NoteState {
  final List<Note> notes;

  const NoteLoadSuccess([this.notes = const []]);
}
