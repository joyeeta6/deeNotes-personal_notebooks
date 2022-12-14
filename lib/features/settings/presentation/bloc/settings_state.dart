part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

// ignore: must_be_immutable
class AllSettingsFetchedState extends SettingsState {
  NoteViewType? selectedView;
  bool? isNoteContentHidden;
  AllSettingsFetchedState({
    this.selectedView,
    this.isNoteContentHidden,
  });
  @override
  List<Object> get props => [];

  AllSettingsFetchedState copyWith({
    NoteViewType? selectedView,
    bool? isNoteContentHidden,
  }) {
    return AllSettingsFetchedState(
      selectedView: selectedView ?? this.selectedView,
      isNoteContentHidden: isNoteContentHidden ?? this.isNoteContentHidden,
    );
  }
}

class NoteViewSettingsChangedState extends SettingsState {
  final NoteViewType selectedView;
  const NoteViewSettingsChangedState({required this.selectedView});
  @override
  List<Object> get props => [selectedView];
}

class NoteContentViewToggledState extends SettingsState {
  final bool isNoteContentHidden;
  const NoteContentViewToggledState({required this.isNoteContentHidden});
  @override
  List<Object> get props => [isNoteContentHidden];
}

class IntroLoadingState extends SettingsState {
  const IntroLoadingState();
  @override
  List<Object> get props => [];
}

class IntroWatchedState extends SettingsState {
  const IntroWatchedState();
  @override
  List<Object> get props => [];
}

class IntroNotWatchedState extends SettingsState {
  const IntroNotWatchedState();
  @override
  List<Object> get props => [];
}

// database cleared
class DatabaseClearingState extends SettingsState {}

class DatabaseClearedState extends SettingsState {
  const DatabaseClearedState();
  @override
  List<Object> get props => [];
}
