import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import 'package:notebooks/data/data_providers/note_colors_provider.dart';
import 'package:notebooks/data/models/note_color.dart';
import 'package:notebooks/features/note/domain/usecases/create_note_usecase.dart'
    as create;
import 'package:notebooks/features/note/domain/usecases/delete_all_notes_usecase.dart'
    as delete_all;
import 'package:notebooks/features/note/domain/usecases/delete_note_usecase.dart'
    as delete;
import 'package:notebooks/features/note/domain/usecases/get_all_notes_usecase.dart'
    as get_all;
import 'package:notebooks/features/note/domain/usecases/update_note_usecase.dart'
    as update;
import '../../domain/usecases/find_note_usecase.dart' as find;

import '../../domain/entities/note_entity.dart';

part 'note_event.dart';
part 'note_state.dart';

String getAllError = "Notes could not be loaded!";
String createNoteError = "Note could not be created!";
String findNoteError = "Note could not be loaded!";
String deleteErrMsg = "Deletion failed!";
String updateErrMsg = "Updating note failed!";

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final create.CreateNoteUsecase createNote;
  final update.UpdateNoteUsecase updateNote;
  final find.FindNoteUsecase findNote;
  final get_all.GetAllNotesUsecase getAllNotes;
  final delete.DeleteNoteUsecase deleteNote;
  final delete_all.DeleteAllNotesUsecase deleteAllNotes;
  final NoteColorsProvider noteColorsProvider;
  NoteBloc({
    required this.createNote,
    required this.updateNote,
    required this.findNote,
    required this.getAllNotes,
    required this.deleteNote,
    required this.deleteAllNotes,
    required this.noteColorsProvider,
  }) : super(NoteInitial()) {
    on<NoteEvent>((event, emit) async {
      // get all notes of a notebook
      if (event is GetAllNotesEvent) {
        emit(NotesListLoading());
        final params = get_all.Params(notebookId: event.notebookId);
        final either = await getAllNotes(params);
        either.fold(
          (failure) => emit(
            NotesListError(message: getAllError),
          ),
          (result) => emit(
            NotesListLoaded(notes: result),
          ),
        );
      }

      // create note
      if (event is CreateNoteEvent) {
        final params = create.Params(note: event.note);
        final either = await createNote(params);
        either.fold(
          (failure) => emit(
            NoteCreatedFailed(message: createNoteError),
          ),
          (result) => emit(
            NoteCreated(),
          ),
        );
      }

      // find specific note
      if (event is FindNoteEvent) {
        emit(NoteLoading());
        final params = find.Params(id: event.id);
        final either = await findNote(params);
        either.fold(
          (failure) => emit(NoteLoadingFailed(message: findNoteError)),
          (result) => emit(NoteLoaded(note: result)),
        );
      }

      // delete note
      if (event is DeleteNoteEvent) {
        final params = delete.Params(id: event.noteId);
        final either = await deleteNote(params);
        either.fold(
          (failure) => emit(NoteDeletedFailed(message: deleteErrMsg)),
          (result) => emit(NoteDeleted()),
        );
      }

      // update note
      if (event is UpdateNoteEvent) {
        final params = update.Params(note: event.note);
        final either = await updateNote(params);
        either.fold(
          (failure) => emit(NoteUpdateFailed(message: updateErrMsg)),
          (result) => emit(NoteUpdated(note: event.note)),
        );
      }

      // add note to favorite
      if (event is ToggleNoteFavoriteEvent) {
        final params = update.Params(note: event.note);
        final either = await updateNote(params);
        either.fold(
          (failure) => emit(NoteUpdateFailed(message: updateErrMsg)),
          (result) => emit(NoteFavoriteToggledState(note: event.note)),
        );
      }

      //----------------------

      // get all note colors
      if (event is GetAllNoteColorsEvent) {
        emit(NoteColorsLoadingState());
        var colors = noteColorsProvider.noteColors;
        emit(AllNoteColorsFetchedState(colors: colors));
      }

      // select note color
      if (event is SelectNoteColorEvent) {
        emit(NoteColorSelectedState(color: event.color));
      }

      // note copy event
      if (event is CopyNoteToClipboardEvent) {
        await Clipboard.setData(ClipboardData(text: event.noteText));
        emit(NoteCopiedToClipboardState(noteText: event.noteText));
      }

      // note reading mode
      if (event is ToggleNightModeEvent) {
        bool? isNight = event.toggle;
        isNight = !isNight;
        emit(NoteNightModeState(isNightMode: isNight));
      }
    });
  }
}
