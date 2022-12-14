part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NotesListLoading extends NoteState {}

class NotesListLoaded extends NoteState {
  final List<NoteEntity> notes;
  const NotesListLoaded({required this.notes});
  @override
  List<Object> get props => [notes];
}

class NotesListError extends NoteState {
  final String message;
  const NotesListError({required this.message});
  @override
  List<Object> get props => [message];
}

class NoteCreated extends NoteState {}

class NoteCreatedFailed extends NoteState {
  final String message;
  const NoteCreatedFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class NoteUpdated extends NoteState {
  final NoteEntity note;
  const NoteUpdated({required this.note});
  @override
  List<Object> get props => [note];
}

class NoteUpdateFailed extends NoteState {
  final String message;
  const NoteUpdateFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class NoteDeleted extends NoteState {}

class NoteDeletedFailed extends NoteState {
  final String message;
  const NoteDeletedFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final NoteEntity note;
  const NoteLoaded({required this.note});
  @override
  List<Object> get props => [note];
}

class NoteLoadingFailed extends NoteState {
  final String message;
  const NoteLoadingFailed({required this.message});
  @override
  List<Object> get props => [message];
}

class NoteFavoriteToggledState extends NoteState {
  final NoteEntity note;
  const NoteFavoriteToggledState({required this.note});
  @override
  List<Object> get props => [note];
}

// note color states
class NoteColorsLoadingState extends NoteState {}

class AllNoteColorsFetchedState extends NoteState {
  final List<NoteColor> colors;
  const AllNoteColorsFetchedState({required this.colors});
  @override
  List<Object> get props => [colors];
}

class NoteColorSelectedState extends NoteState {
  final NoteColor color;
  const NoteColorSelectedState({
    required this.color,
  });
  @override
  List<Object> get props => [color];
}

// copy note to clipboard state
class NoteCopiedToClipboardState extends NoteState {
  final String noteText;
  const NoteCopiedToClipboardState({required this.noteText});
  @override
  List<Object> get props => [noteText];
}

// note fullscreen reading mode state
class NoteNightModeState extends NoteState {
  final bool isNightMode;
  const NoteNightModeState({required this.isNightMode});
  @override
  List<Object> get props => [isNightMode];
}
