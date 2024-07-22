import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t71/features/notes_achieves/domain/notes_model.dart';
import 'package:uuid/uuid.dart';

part 'note_provider.freezed.dart';
part 'note_provider.g.dart';

@freezed
class NodeState with _$NodeState {
  const factory NodeState({
    @Default([]) List<NotesModel> notes,
  }) = _NodeState;

  factory NodeState.initial() {
    return NodeState();
  }
}

@riverpod
class NoteProvider extends _$NoteProvider {
  @override
  NodeState build() {
    return NodeState.initial();
  }

  void addNote(NotesModel body) {
    final updateNote = body.copyWith(id: Uuid().v1());
    state = state.copyWith(notes: [updateNote, ...state.notes]);
  }

  void deleteNote(NotesModel body) {
    final deleteNote = state.notes.where((item) => item.id != body.id).toList();
    state = state.copyWith(notes: deleteNote);
  }

  void editNote(NotesModel body) {
    var updateNotes = state.notes.map((item) {
      if (body.id == item.id) {
        print('${body.id} ${item.id}');
        return item.copyWith(
          description: body.description ?? item.description,
          title: body.title ?? item.title,
          photo: body.photo ?? item.photo,
        );
      }
      return item;
    }).toList();
    state = state.copyWith(notes: updateNotes);
  }
}
