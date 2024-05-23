part of 'note_bloc.dart';

abstract class NoteEvent {
  const NoteEvent();
}

// Событие добавление
class AddNote extends NoteEvent {
  final Note note;
  const AddNote(this.note);
}

// Событие удаления
class RemoveNote extends NoteEvent {
  final String noteId;
  const RemoveNote(this.noteId);
}
