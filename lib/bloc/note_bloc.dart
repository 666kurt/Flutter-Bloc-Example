import 'package:flutter_bloc/flutter_bloc.dart';

import '../note_model.dart';
part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    print('ssdfs');
    on<AddNote>((event, emit) {
      final currentState = state;
      if (currentState is NoteLoadSuccess) {
        final updatedNotes = List<Note>.from(currentState.notes)
          ..add(event.note);
        emit(NoteLoadSuccess(updatedNotes));
      } else {
        final updatedNotes = [event.note];
        emit(NoteLoadSuccess(updatedNotes));
      }
    });

    on<RemoveNote>((event, emit) {
      final currentState = state;
      if (currentState is NoteLoadSuccess) {
        final udpatedNotes = currentState.notes
            .where((element) => element.id != event.noteId)
            .toList();
        emit(NoteLoadSuccess(udpatedNotes));
      }
    });
  }
}
