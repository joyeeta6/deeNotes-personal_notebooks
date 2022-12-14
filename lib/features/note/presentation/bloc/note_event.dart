part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetAllNotesEvent extends NoteEvent {
  final int notebookId;
  const GetAllNotesEvent({required this.notebookId});
}

class CreateNoteEvent extends NoteEvent {
  final NoteEntity note;
  const CreateNoteEvent(this.note);
  @override
  List<Object> get props => [note];
}

class UpdateNoteEvent extends NoteEvent {
  final NoteEntity note;
  const UpdateNoteEvent(this.note);
  @override
  List<Object> get props => [note];
}

class FindNoteEvent extends NoteEvent {
  final int id;
  const FindNoteEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class DeleteNoteEvent extends NoteEvent {
  final int noteId;
  const DeleteNoteEvent({required this.noteId});
  @override
  List<Object> get props => [noteId];
}

class DeleteAllNotesEvent extends NoteEvent {
  final int notebookId;
  const DeleteAllNotesEvent(this.notebookId);
}

class ToggleNoteFavoriteEvent extends NoteEvent {
  final NoteEntity note;
  const ToggleNoteFavoriteEvent({required this.note});
  @override
  List<Object> get props => [note];
}

// note colors
class GetAllNoteColorsEvent extends NoteEvent {}

class SelectNoteColorEvent extends NoteEvent {
  final NoteColor color;
  const SelectNoteColorEvent({required this.color});
}

// copy note to clipboard
class CopyNoteToClipboardEvent extends NoteEvent {
  final String noteText;
  const CopyNoteToClipboardEvent({required this.noteText});
  @override
  List<Object> get props => [noteText];
}

// note fullscreen reading mode
class ToggleNightModeEvent extends NoteEvent {
  final bool toggle;
  const ToggleNightModeEvent({required this.toggle});
  @override
  List<Object> get props => [toggle];
}
